function Import-vROAction {
<#
    .SYNOPSIS
    Imports an action in a given category.    

    .DESCRIPTION
    Imports an action in a given category.

    .PARAMETER CategoryName
    The name of the action category

    .PARAMETER File
    The action file

    .PARAMETER Overwrite
    Overwrite an existing action

    .INPUTS
    System.String
    Switch

    .OUTPUTS
    None

    .EXAMPLE
    Import-vROAction -File C:\Actions\test01.action -CategoryName "com.company.package" -Confirm:$false

    .EXAMPLE
    Get-ChildItem -Path C:\Actions\*.action | Import-vROAction -CategoryName "com.company.package" -Confirm:$false

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")][OutputType('System.Management.Automation.PSObject')]

    Param (

    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$CategoryName,         
    
    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$File,

    [parameter(Mandatory=$false)]
    [Switch]$Overwrite

    )

    begin {

        #Set Set Line Feed
        $LF = "`r`n"
    
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
                       
                if ($PSBoundParameters.ContainsKey("Overwrite")) {
 
                    $URI = "/vco/api/actions?categoryName=$($CategoryName)&overwrite=true"

                }
                else {

                    $URI = "/vco/api/actions?categoryName=$($CategoryName)"

                }

                # --- Set custom headers for the request
                $Headers = @{
                
                    "Authorization" = "Basic $($Global:vROConnection.EncodedPassword)";
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

    }

    end {

    }

}
