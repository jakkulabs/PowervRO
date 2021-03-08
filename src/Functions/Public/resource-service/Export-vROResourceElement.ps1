function Export-vROResourceElement {
<#
    .SYNOPSIS
    Exports a resource element by its ID.

    .DESCRIPTION
    Exports a resource element by its ID.

    .PARAMETER Id
    The id of the resource element

    .PARAMETER Path
    The path of the exported file. If this parameter is not passed, the resource element
    will be exported to the current working directory.

    .PARAMETER Encoding
    Encoding of the output file
    Windows PS Default = UTF8
    PS Core Default = UTF8NoBOM

    .INPUTS
    System.String

    .OUTPUTS
    System.IO.FileInfo

    .EXAMPLE
    Get-vROResourceElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 | Export-vROResourceElement -Path C:\Resources

    .EXAMPLE
    Export-vROResourceElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133

    .EXAMPLE
    Export-vROResourceElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 -Encoding Ascii

#>
[CmdletBinding()][OutputType('System.IO.FileInfo')]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Id,

    [parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [String]$Path,

    [parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [String]$Encoding

    )

    begin {
        if (!$PSBoundParameters.ContainsKey('Encoding')){

            if (!$IsCoreCLR){

                $Encoding = 'UTF8'
            }
            else {
                $Encoding = 'UTF8NoBOM'
            }
        }
    }

    process {

        foreach ($ResourceId in $Id){

            try {

                $URI = "/vco/api/resources/$($ResourceId)"

                $Headers = @{

                    "Authorization" = "Basic $($Script:vROConnection.EncodedPassword)";
                    "Accept" =" application/octet-stream";

                }

                # --- Run vRO REST Request
                $Request = Invoke-vRORestMethod -Uri $URI -Method Get -Headers $Headers -WebRequest -Verbose:$VerbosePreference

                # --- Get the name of the resource element
                $FileName = (Get-vROResourceElement -Id $ResourceId).Name

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

                Write-Verbose -Message "Exporting resource element to $($FullPath)"
                $Request.Content | Set-Content -Path $FullPath -Encoding $Encoding -Force

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