function Invoke-vRORestMethod {
<#
    .SYNOPSIS
    Wrapper for Invoke-RestMethod with vRO specifics
    
    .DESCRIPTION
    Wrapper for Invoke-RestMethod with vRO specifics

    .PARAMETER Method
    REST Method: GET, POST, PUT or DELETE

    .PARAMETER URI
    API URI, e.g. /vco/api/workflows

    .PARAMETER Body
    REST Body in JSON format

    .PARAMETER Webrequest
    Use Invoke-WebRequest instead of Invoke-RestMethod

    .PARAMETER Headers
    Optionally supply custom headers

    .PARAMETER OutFile
    Saves the response body in the specified output file

    .INPUTS
    System.String
    System.Collections.IDictionary
    Switch

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    Invoke-vRORestMethod -Method GET -URI '/vco/api/workflows'

    .EXAMPLE
    $URI = "/vco/api/workflows/$($ID)/executions/"
    $JSON =  @"
{"parameters":
	[
        {
            "value": {"string":{ "value": "Apple"}},
            "type": "string",
            "name": "a",
            "scope": "local"
        },
        {
            "value": {"number":{ "value": 20}},
            "type": "number",
            "name": "b",
            "scope": "local"
        }	
	]
}
"@
    $InvokeRequest = Invoke-vRORestMethod -Method POST -URI $URI -Body $Body -WebRequest
#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param (

    [parameter(Mandatory=$true)]
    [ValidateSet("GET","POST","PUT","DELETE")]
    [String]$Method,

    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$URI,

    [parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    $Body,

    [parameter(Mandatory=$false)]
    [Switch]$WebRequest,

    [parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [System.Collections.IDictionary]$Headers,

    [parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [String]$OutFile
    )   

# --- Test for existing connection to vRO
if (-not $Global:vROConnection){

    throw "vRO Connection variable does not exist. Please run Connect-vROServer first to create it"
}

    # --- Create Invoke-RestMethod Parameters
    $FullURI = "$($Global:vROConnection.Server)$($URI)"

    if (!$PSBoundParameters.ContainsKey("Headers")){

        $Headers = @{

            "Accept"="application/json";
            "Content-Type" = "application/json";
            "Authorization" = "Basic $($Global:vROConnection.EncodedPassword)";
        }
    }

    try {

        if ($PSBoundParameters.ContainsKey("WebRequest")) {

            if ($PSBoundParameters.ContainsKey("Body")) {

                $Response = Invoke-WebRequest -Method $Method -Headers $Headers -Uri $FullURI -Body $Body
            }
            else {
                
                $Response = Invoke-WebRequest -Method $Method -Headers $Headers -Uri $FullURI
            }
        }
        else {
            if ($PSBoundParameters.ContainsKey("Body")) {
            
                $Response = Invoke-RestMethod -Method $Method -Headers $Headers -Uri $FullURI -Body $Body
            }
            elseif ($PSBoundParameters.ContainsKey("OutFile")){

                $Response = Invoke-RestMethod -Method $Method -Headers $Headers -Uri $FullURI -OutFile $OutFile
            }
            else {

                $Response = Invoke-RestMethod -Method $Method -Headers $Headers -Uri $FullURI
            }
        }

        Write-Output $Response
    }
    catch [Exception] {
        
        throw $_.Exception.Message
    }
    finally {

        # Workaround for bug in Invoke-RestMethod. Thanks to the PowerNSX guys for pointing this one out
        # https://bitbucket.org/nbradford/powernsx/src

        $ServicePoint = [System.Net.ServicePointManager]::FindServicePoint($FullURI)
        $ServicePoint.CloseConnectionGroup("") | Out-Null
    }
}