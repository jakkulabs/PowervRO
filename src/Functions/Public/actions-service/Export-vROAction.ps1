function Export-vROAction {
<#
    .SYNOPSIS
    Exports an action by its ID.

    .DESCRIPTION
    Exports an action by its ID.

    .PARAMETER Id
    The id of the action

    .PARAMETER Path
    The resulting path. If this parameter is not passed the action will be exported to
    the current working directory.

    .INPUTS
    System.String

    .OUTPUTS
    System.IO.FileInfo

    .EXAMPLE
    Get-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 | Export-vROAction -Path C:\Actions\Test01.action

    .EXAMPLE
    Get-vROAction -Name Test01 -Category com.company.test | Export-vROAction

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

        if ($IsWindows) {

            $Delimiter = '\'
        }
        else {

            $Delimiter = '/'
        }
    }

    process {

        foreach ($ActionId in $Id){

            try {

                $URI = "/vco/api/actions/$($ActionId)"

                $Headers = @{

                    "Authorization" = "Basic $($Global:vROConnection.EncodedPassword)";
                    "Accept" ="Application/zip";
                    "Accept-Encoding" = "gzip, deflate";
                    "Content-Type" = "Application/zip;charset=utf-8";

                }

                # --- Run vRO REST Request
                $Request = Invoke-vRORestMethod -Uri $URI -Method Get -Headers $Headers -WebRequest -Verbose:$VerbosePreference

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

                Write-Verbose -Message "Exporting action to $($FullPath)"

                # --- PS Core does not have -Encoding Byte. Replaced with new parameter AsByteStream
                if ($PSVersionTable.PSEdition -eq "Desktop" -or !$PSVersionTable.PSEdition) {

                    $Request.Content | Set-Content -Path $FullPath -Encoding Byte -Force
                }
                else {
                    $Request.Content | Set-Content -Path $FullPath -AsByteStream -Force
                }

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