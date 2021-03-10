function Export-vROConfigurationElement {
<#
    .SYNOPSIS
    Exports a configuration element by its ID.

    .DESCRIPTION
    Exports a configuration element by its ID.

    .PARAMETER Id
    The id of the action

    .PARAMETER Path
    The path of the exported file. If this parameter is not passed, the resource element
    will be exported to the current working directory.

    .INPUTS
    System.String

    .OUTPUTS
    System.IO.FileInfo

    .EXAMPLE
    Get-vROConfigurationElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 | Export-vROConfigurationElement -Path C:\Configurations

    .EXAMPLE
    Export-vROConfigurationElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133

#>
[CmdletBinding()][OutputType('System.IO.FileInfo')]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Id,

    [parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [String]$Path

    )

    begin {

    }

    process {

        foreach ($ConfigurationId in $Id){

            try {

                $URI = "/vco/api/configurations/$($ConfigurationId)"

                $Headers = @{

                    "Authorization" = "Basic $($Script:vROConnection.EncodedPassword)";
                    "Accept" ="application/vcoobject+xml";
                    "Accept-Encoding" = "gzip, deflate";
                    "Content-Type" = "Application/vcoobject+xml;charset=utf-8";

                }

                # --- Run vRO REST Request
                $Request = Invoke-vRORestMethod -Uri $URI -Method Get -Headers $Headers -WebRequest -Verbose:$VerbosePreference

                # --- Get the displayname of the Configuration element and set filename
                $XMLContent = [XML]$Request.Content
                $DisplayName = $XMLContent.'config-element'.'display-name'.'#cdata-section'
                $FileName = "$($DisplayName).vsoconf"

                if (!$PSBoundParameters.ContainsKey("Path")) {

                    Write-Verbose -Message "Path parameter not passed, exporting to current directory."
                    $FullPath = "$($(Get-Location).Path)\$($Filename)"

                }
                else {

                    Write-Verbose -Message "Path parameter passed."

                    if ($Path.EndsWith("\")) {

                        Write-Verbose -Message "Ends with"

                        $Path = $Path.TrimEnd("\")

                    }

                    $FullPath = "$($Path)\$($FileName)"

                }

                Write-Verbose -Message "Exporting configuration element to $($FullPath)"
                $Request.Content | Set-Content -Path $FullPath -Force

                # --- Output the result
                Get-ChildItem -Path $FullPath

            }
            catch [Exception]{

                throw

            }

        }

    }

    end {

    }

}