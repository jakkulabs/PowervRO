function Set-vROResourceElement {
<#
    .SYNOPSIS
    Updates a resource element based off the resource ID.    

    .DESCRIPTION
    Updates a resource element based off the resource ID. 

    .PARAMETER Id
    The ID of the Resource

    .PARAMETER File
    The resource file

    .INPUTS
    System.String

    .OUTPUTS
    None

    .EXAMPLE
    Get-ChildItem -Path "C:\Resources\$file" | Set-vROResourceElement -Id $resource.Id -Confirm:$false

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")][OutputType('System.Management.Automation.PSObject')]

    Param (

    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Id,         
    
    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$File

    )

    begin {

        #Set Set Line Feed
        $LF = "`r`n"
    
    }

    process {

        foreach ($FilePath in $File){

            $FileInfo = [System.IO.FileInfo](Resolve-Path $FilePath).Path

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

                $URI = "/vco/api/resources/$($Id)"

                # --- Set custom headers for the request
                $Headers = @{
                
                    "Authorization" = "Basic $($Global:vROConnection.EncodedPassword)";
                    "Accept" = "Application/json"
                    "Accept-Encoding" = "gzip,deflate,sdch";
                    "Content-Type" = "multipart/form-data; boundary=$($Boundary)"
                }

                if ($PSCmdlet.ShouldProcess($Id)){

                    # --- Run vRO REST Request
                    Invoke-vRORestMethod -Method POST -Uri $URI -Body $Form -Headers $Headers -Verbose:$VerbosePreference | Out-Null
                    
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
