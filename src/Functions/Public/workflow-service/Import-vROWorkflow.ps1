function Import-vROWorkflow {
<#
    .SYNOPSIS
    Import a vRO Workflow from a .workflow file

    .DESCRIPTION
    Import a vRO Workflow from a .workflow file

    .PARAMETER CategoryId
    Specify the ID of the vRO Category to import the Workfow to

    .PARAMETER File
    Specify the Filename to import from - should be a .workflow file

    .PARAMETER Overwrite
    Overwrite an existing vRO Workflow

    .PARAMETER PassThru
    If the name of the import file matches the name of the workflow then return imported workflow, e.g. if Test01.workflow matches a workflow name of Test01

    .INPUTS
    System.String
    System.IO.FileInfo
    Switch

    .OUTPUTS
    System.Management.Automation.PSObject

    .NOTES
    Thanks to @burkeazbill for a few hints with this one https://github.com/burkeazbill/vroClientScripts

    .EXAMPLE
    Import-vROWorkflow -CategoryId "40281e8654ddec6201553af63677146e" -File C:\Workflows\Test01.workflow -Overwrite

    .EXAMPLE
    Import-vROWorkflow -CategoryId "40281e8654ddec6201553af63677146e" -File C:\Workflows\Test01.workflow -PassThru -Confirm:$false

    .EXAMPLE
    Get-ChildItem -Path C:\Workflows\*.workflow | Import-vROWorkflow -CategoryId "40281e8654ddec6201553af63677146e" -Confirm:$false
#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")][OutputType('System.Management.Automation.PSObject')]

    Param (

    [parameter(Mandatory=$true)]
    [Alias("Id")]
    [ValidateNotNullOrEmpty()]
    [String]$CategoryId,

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$File,

    [parameter(Mandatory=$false)]
    [Switch]$Overwrite,

    [parameter(Mandatory=$false)]
    [Switch]$PassThru
    )

    begin {

        # --- Set Set Line Feed
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

                    $URI = "/vco/api/workflows?categoryId=$($categoryId)&overwrite=true"
                }
                else {

                    $URI = "/vco/api/workflows?categoryId=$($categoryId)"
                }

                $Headers = @{

                    "Authorization" = "Basic $($Script:vROConnection.EncodedPassword)";
                    "Accept" = "Application/json"
                    "Accept-Encoding" = "gzip,deflate,sdch";
                    "Content-Type" = "multipart/form-data; boundary=$($Boundary)"
                }

                if ($PSCmdlet.ShouldProcess($FileInfo.FullName)){

                    # --- Run vRO REST Request
                    Invoke-vRORestMethod -Method POST -Uri $URI -Body $Form -Headers $Headers -Verbose:$VerbosePreference

                    if ($PSBoundParameters.ContainsKey("PassThru")) {

                        # --- Output the result
                        $WorkflowName = ($FileInfo.Name -split "\.")[0]
                        Get-vROWorkflow -Name $WorkflowName
                    }
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