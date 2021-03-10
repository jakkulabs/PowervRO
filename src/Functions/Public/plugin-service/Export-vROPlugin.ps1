function Export-vROPlugin {
<#
    .SYNOPSIS
    Exports a plugin.

    .DESCRIPTION
    Exports a plugin.

    .PARAMETER Name
    The name of the plugin

    .PARAMETER Path
    The path of the exported file. If this parameter is not passed, the plugin
    will be exported to the current working directory.

    .INPUTS
    System.String

    .OUTPUTS
    System.IO.FileInfo

    .EXAMPLE
    Export-vROPlugin -Name ExamplePlugin

    .EXAMPLE
    Export-vROPlugin -Name ExamplePlugin -Path C:\plugins

#>
[CmdletBinding()][OutputType('System.IO.FileInfo')]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Name,

    [parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [String]$Path

    )

    begin {

        if ($IsWindows) {

            $Delimiter = '\'
        }
        else {

            $Delimiter = '/'
        }
    }

    process {

        foreach ($PluginName in $Name){

            try {

                $URI = "/vco/api/plugins/$($PluginName)"

                $Headers = @{

                    "Authorization" = "Basic $($Script:vROConnection.EncodedPassword)";
                    "Accept" ="Application/json";
                    "Content-Type" = "application/zip;charset=UTF-8";

                }

                # --- Run vRO REST Request
                Write-Verbose -Message "Receiving response. This may take some time depending on the size of the plugin.."
                $Request = Invoke-vRORestMethod -Uri $URI -Method Get -Headers $Headers -WebRequest -Verbose:$VerbosePreference

                # --- Get the name of the plugin
                $Filename = $Request.Headers['Content-Disposition'].Split("=")[1]

                if (!$PSBoundParameters.ContainsKey("Path")) {


                    Write-Verbose -Message "Path parameter not passed, exporting to current directory."
                    $FullPath = "$($(Get-Location).Path)$($Delimiter)$($Filename)"

                }
                else {

                    Write-Verbose -Message "Path parameter passed."

                    if ($Path.EndsWith("$($Delimiter)")) {

                        Write-Verbose -Message "Ends with"

                        $Path = $Path.TrimEnd("$($Delimiter)")

                    }

                    $FullPath = "$($Path)$($Delimiter)$($FileName)"

                }

                Write-Verbose -Message "Exporting plugin to $($FullPath)"
                [System.IO.File]::WriteAllBytes($FullPath, $Request.Content)

                # --- Get the exported file
                Get-ChildItem -Path $FullPath

            }
            catch [Exception]{

                throw

            }
            finally {

                # --- Set request variable to null to avoid the content staying in memory
                $Request = $null

            }

        }

    }

    end {

    }

}