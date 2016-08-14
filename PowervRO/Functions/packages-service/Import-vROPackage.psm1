function Import-vROPackage {
<#
    .SYNOPSIS
    Imports a vRO Package    

    .DESCRIPTION
    Imports a vRO Package  

    .PARAMETER File
    The action file

    .PARAMETER Overwrite
    Overwrite an existing Package

    .PARAMETER ImportConfigurationAttributeValues
    Import Configuration Attribute Values

    .PARAMETER TagImportMode
    Tag Import Mode

    .INPUTS
    System.String
    System.IO.FileInfo
    Switch

    .OUTPUTS
    None

    .EXAMPLE
    Import-vROPackage -File C:\Packages\net.powervro.tests.package -Overwrite

    .EXAMPLE
    Get-ChildItem -Path C:\Packages\net.powervro.tests.package | Import-vROPackage -Confirm:$false

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")][OutputType('System.Management.Automation.PSObject')]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$File,

    [parameter(Mandatory=$false)]
    [Switch]$Overwrite,

    [parameter(Mandatory=$false)]
    [Switch]$ImportConfigurationAttributeValues,

    [parameter(Mandatory=$false)]
    [ValidateSet("Dont","ImportOverwrite","ImportPreserve")]
    [String]$TagImportMode = "Dont"

    )

    begin {

        # --- Set Set Line Feed
        $LF = "`r`n"

        # --- Set options        
        if ($PSBoundParameters.ContainsKey("Overwrite")) {
 
            $OverwriteParam = 'true'

        }
        else {

            $OverwriteParam = 'false'
        }

        if ($PSBoundParameters.ContainsKey("ImportConfigurationAttributeValues")) {
 
            $ImportConfigurationAttributeValuesParam = 'true'

        }
        else {

            $ImportConfigurationAttributeValuesParam = 'false'
        }

        switch ($TagImportMode){ 

            “Dont”  {

                $TagImportModeParam = 'DoNotImport';
                break
            }

            “ImportOverwrite”  {

                $TagImportModeParam = 'ImportAndOverwriteExistingValue';
                break
            }
            “ImportPreserve”  {

                $TagImportModeParam = 'ImportButPreserveExistingValue';
                break
            } 

        } 
    
    }

    process {

        foreach ($FilePath in $File){

            try {

                # --- Resolve the file path
                $FileInfo = [System.IO.FileInfo](Resolve-Path $FilePath).Path

                # --- Create the multi-part form
                $Boundary = [guid]::NewGuid().ToString()
                $FileBin = [System.IO.File]::ReadAllBytes($FileInfo.FullName)
                $Encoding = [System.Text.Encoding]::GetEncoding("iso-8859-1")
                $EncodedFile = $Encoding.GetString($FileBin)

                $Form = (
                    "--$($Boundary)",
                    "Content-Disposition: form-data; name=`"file`"; filename=`"$($FileInfo.Name)`"",
                    "Content-Type:application/octet-stream$($LF)",
                    $EncodedFile,
                    "--$($Boundary)--$($LF)"
                ) -join $LF

                $URI = "/vco/api/packages?overwrite=$($OverwriteParam)&importConfigurationAttributeValues=$($ImportConfigurationAttributeValuesParam)&tagImportMode=$($TagImportModeParam)"

                # --- Set custom headers for the request
                $Headers = @{
                
                    "Authorization" = "Basic $($Global:vROConnection.EncodedPassword)";
                    "Accept" = "Application/json"
                    "Accept-Encoding" = "gzip,deflate,sdch";
                    "Content-Type" = "multipart/form-data; boundary=$($Boundary)"
                }

                if ($PSCmdlet.ShouldProcess($FileInfo.FullName)){

                    # --- Run vRO REST Request
                    Write-Verbose -Message "POST : $($URI)"

                    Invoke-vRORestMethod -Method POST -Uri $URI -Body $Form -Headers $Headers -Verbose:$VerbosePreference

                    Write-Verbose -Message "SUCCESS"

                    # --- Output the result
                    Get-vROPackage -Name $FileInfo.BaseName
                }

            }
            catch [Exception]{

                throw

            }
        }
    }

    end {

    }
}