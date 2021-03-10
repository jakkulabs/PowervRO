function Import-vROPlugin {
<#
    .SYNOPSIS
    Imports a resource element in a given category.

    .DESCRIPTION
    Imports a resource element in a given category.

    .PARAMETER File
    The plugin file

    .PARAMETER Format
    The format of the plugin. It can be either dar or vmoapp

    .PARAMETER Overwrite
    Overwrite an installed plugin

    .INPUTS
    System.String
    System.IO.FileInfo
    Switch

    .OUTPUTS
    None

    .EXAMPLE
    Get-ChildItem -Path C:\Resources\* | Import-vROResourceElement -CategoryId "36cd783f-e858-4783-9273-06d11defc8b0" -Confirm:$false

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [System.IO.FileInfo]$File,

    [parameter(Mandatory=$true)]
    [ValidateSet("dar","vmoapp")]
    [String]$Format,

    [parameter(Mandatory=$false)]
    [Switch]$Overwrite

    )

    begin {

        #Set Set Line Feed
        $LF = "`r`n"

    }

    process {

        $FileInfo = [System.IO.FileInfo](Resolve-Path $File).Path

        try {

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

            $URI = "/vco/api/plugins?format=$($Format)&overwrite=$($Overwrite.ToString().ToLower())"

            # --- Set custom headers for the request
            $Headers = @{

                "Authorization" = "Basic $($Script:vROConnection.EncodedPassword)";
                "Accept" = "Application/json"
                "Accept-Encoding" = "gzip,deflate,sdch";
                "Content-Type" = "multipart/form-data; boundary=$($Boundary)"
            }

            if ($PSCmdlet.ShouldProcess($FileInfo.FullName)){

                # --- Run vRO REST Request
                Invoke-vRORestMethod -Method POST -Uri $URI -Body $Form -Headers $Headers -Verbose:$VerbosePreference | Out-Null

            }

        }
        catch [Exception]{

            throw

        }

    }

    end {

    }

}
