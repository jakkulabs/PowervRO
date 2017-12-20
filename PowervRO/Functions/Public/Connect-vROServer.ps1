function Connect-vROServer {
<#
    .SYNOPSIS
    Connect to a vRO Server

    .DESCRIPTION
    Connect to a vRO Server and generate a connection object with Servername, Token etc

    .PARAMETER Server
    vRO Server to connect to

    .PARAMETER Port
    Optionally specify the server port. Default is 8281

    .PARAMETER Username
    Username to connect with

    .PARAMETER Password
    Password to connect with

    .PARAMETER Credential
    Credential object to connect with

    .PARAMETER IgnoreCertRequirements
    Ignore requirements to use fully signed certificates

    .INPUTS
    System.String
    Management.Automation.PSCredential
    Switch

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
    Connect-vROServer -Server vro01.domain.local -Credential (Get-Credential)

    .EXAMPLE
    $SecurePassword = ConvertTo-SecureString “P@ssword” -AsPlainText -Force
    Connect-vROServer -Server vro01.domain.local -Username TenantAdmin01 -Password $SecurePassword -IgnoreCertRequirements

    .EXAMPLE
    Connect-vROServer -Server vro01.domain.local -Port 443 -Credential (Get-Credential)

#>
[CmdletBinding(DefaultParametersetName="Username")][OutputType('System.Management.Automation.PSObject')]

    Param (

    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Server,

    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [Int]$Port = 8281,

    [Parameter(Mandatory=$true,ParameterSetName="Username")]
    [ValidateNotNullOrEmpty()]
    [String]$Username,

    [Parameter(Mandatory=$true,ParameterSetName="Username")]
    [ValidateNotNullOrEmpty()]
    [SecureString]$Password,

    [Parameter(Mandatory=$true,ParameterSetName="Credential")]
	[ValidateNotNullOrEmpty()]
	[Management.Automation.PSCredential]$Credential,

    [Parameter(Mandatory=$false)]
    [Switch]$IgnoreCertRequirements

    )

    # --- Test Connectivity to vRO Server on the given port
    try {

        # --- Test Connection to the vRO Server
        Write-Verbose -Message "Testing connectivity to $($Server):$($Port)"

        $TCPClient = New-Object Net.Sockets.TcpClient
        $TCPClient.Connect($Server, $Port)

        $TCPClient.Close()

    }
    catch [Exception] {

        throw "Could not connect to server $($Server) on port $($Port)"

    }

    # --- Handle untrusted certificates if necessary
    $SignedCertificates = $true

    if ($PSBoundParameters.ContainsKey("IgnoreCertRequirements")){

        if ($PSVersionTable.PSEdition -eq "Desktop" -or !$PSVersionTable.PSEdition) {

            if ( -not ("TrustAllCertsPolicy" -as [type])) {

            Add-Type @"
            using System.Net;
            using System.Security.Cryptography.X509Certificates;
            public class TrustAllCertsPolicy : ICertificatePolicy {
                public bool CheckValidationResult(
                    ServicePoint srvPoint, X509Certificate certificate,
                    WebRequest request, int certificateProblem) {
                    return true;
                }
            }
"@
            }
            [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
        }

        $SignedCertificates = $false
    }

    #--- Fix for vRO 7.0.1 Tls version
    $SecurityProtocols = @(
        [System.Net.SecurityProtocolType]::Ssl3,
        [System.Net.SecurityProtocolType]::Tls,
        [System.Net.SecurityProtocolType]::Tls12
    )

    [System.Net.ServicePointManager]::SecurityProtocol = $SecurityProtocols -join ","

    # --- Convert Secure Credentials
    if ($PSBoundParameters.ContainsKey("Credential")){

        $Username = $Credential.UserName
        $ConnectionPassword = $Credential.GetNetworkCredential().Password

    }
    if ($PSBoundParameters.ContainsKey("Password")){

        $ConnectionPassword = (New-Object System.Management.Automation.PSCredential("username", $Password)).GetNetworkCredential().Password
    }

    try {

        # --- Set Encoded Password
        $Auth = $Username + ':' + $ConnectionPassword
        $Encoded = [System.Text.Encoding]::UTF8.GetBytes($Auth)
        $EncodedPassword = [System.Convert]::ToBase64String($Encoded)

        # --- Create Output Object
        $Global:vROConnection = [pscustomobject]@{

            Server = "https://$($Server):$($Port)"
            Username = $Username
            EncodedPassword = $EncodedPassword
            Version = $Null
            APIVersion = $Null
            EnabledSecurityProtocols = [System.Net.ServicePointManager]::SecurityProtocol
            SignedCertificates = $SignedCertificates

        }

        # --- Update vROConnection with version information
        $VersionInfo = Get-vROVersion
        $Global:vROConnection.Version = $VersionInfo.Version
        $Global:vROConnection.APIVersion = $VersionInfo.APIVersion

        # --- Test the credentials provided
        Write-Verbose -Message "Testing credentials"
        $URI = "/vco/api/server/permissions"
        Invoke-vRORestMethod -Method Get -URI $URI -ErrorAction Stop | Out-Null

        Write-Output $Global:vROConnection


    }
    catch [Exception]{

        Remove-Variable -Name vROConnection -Scope Global -Force -ErrorAction SilentlyContinue
        throw $_.Exception.Message

    }

}