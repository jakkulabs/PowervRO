function Export-vROPackage {
<#
    .SYNOPSIS
    Export a vRO Package to a .package file

    .DESCRIPTION
    Export a vRO Package to a .package file

    .PARAMETER Name
    Specify the Name of the vRO Package

    .PARAMETER DontExportConfigurationAttributeValues
    Don't Export Configuration Attribute Values

    .PARAMETER DontExportGlobalTags
    Don't Export Global Tags

    .PARAMETER File
    Specify the Filename to export to - should be a .package file

    .INPUTS
    System.String
    Switch

    .OUTPUTS
    System.IO.FileInfo

    .NOTES
    Thanks to @burkeazbill for a few hints with this one https://github.com/burkeazbill/vroClientScripts

    .EXAMPLE
    Export-vROPackage -Name "net.powervro.tests" -File C:\Packages\net.powervro.tests.package

    .EXAMPLE
    Get-vROPackage -Name 'net.powervro.tests' | Export-vROPackage -File C:\Packages\net.powervro.tests.package -DontExportConfigurationAttributeValues
#>
[CmdletBinding()][OutputType('System.IO.FileInfo')]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Name,

    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$File,

    [parameter(Mandatory=$false)]
    [Switch]$DontExportConfigurationAttributeValues,

    [parameter(Mandatory=$false)]
    [Switch]$DontExportGlobalTags

    )

    begin {

        $Headers = @{

            "Authorization" = "Basic $($Global:vROConnection.EncodedPassword)";
            "Accept" ="Application/zip";
            "Accept-Encoding" = "gzip, deflate";
            "Content-Type" = "Application/zip;charset=utf-8";
        }

        if ($PSBoundParameters.ContainsKey('DontExportConfigurationAttributeValues')){

            $ExportConfigurationAttributeValues = 'false'
        }
        else {

            $ExportConfigurationAttributeValues = 'true'
        }
        if ($PSBoundParameters.ContainsKey('DontExportGlobalTags')){

            $ExportGlobalTags = 'false'
        }
        else {

            $ExportGlobalTags = 'true'
        }
    }

    process {

        foreach ($PackageName in $Name){

            try {

                $URI = "/vco/api/packages/$($PackageName)/?exportConfigurationAttributeValues=$($ExportConfigurationAttributeValues)&exportGlobalTags=$($ExportGlobalTags)"

                # --- Run vRO REST Request
                $Request = Invoke-vRORestMethod -Uri $URI -Method Get -Headers $Headers -WebRequest -Verbose:$VerbosePreference

                # --- PS Core does not have -Encoding Byte. Replaced with new parameter AsByteStream
                if ($PSVersionTable.PSEdition -eq "Desktop" -or !$PSVersionTable.PSEdition) {

                    $Request.Content | Set-Content -Path $File -Encoding Byte -Force
                }
                else {
                    $Request.Content | Set-Content -Path $File -AsByteStream -Force
                }

                # --- Output the result
                Get-ChildItem -Path $File
            }
            catch [Exception]{

                throw
            }
        }
    }

    end {

    }
}