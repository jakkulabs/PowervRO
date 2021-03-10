function Export-vROWorkflow {
<#
    .SYNOPSIS
    Export a vRO Workflow to a .workflow file

    .DESCRIPTION
    Export a vRO Workflow to a .workflow file

    .PARAMETER Id
    Specify the ID of the vRO Workfow

    .PARAMETER File
    Specify the Filename to export to - should be a .workflow file

    .INPUTS
    System.String

    .OUTPUTS
    System.IO.FileInfo

    .NOTES
    Thanks to @burkeazbill for a few hints with this one https://github.com/burkeazbill/vroClientScripts

    .EXAMPLE
    Export-vROWorkflow -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea" -File C:\Workflows\Test01.workflow

    .EXAMPLE
    Get-vROWorkflow -Name Test01 | Export-vROWorkflow -File C:\Workflows\Test01.workflow
#>
[CmdletBinding()][OutputType('System.IO.FileInfo')]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Id,

    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$File
    )

    begin {

        $Headers = @{

            "Authorization" = "Basic $($Script:vROConnection.EncodedPassword)";
            "Accept" ="Application/zip";
            "Accept-Encoding" = "gzip, deflate";
            "Content-Type" = "Application/zip;charset=utf-8";
        }
    }

    process {

        foreach ($WorkflowId in $Id){

            try {

                $URI = "/vco/api/workflows/$($WorkflowId)"

                # --- Run vRO REST Request
                $Request = Invoke-vRORestMethod -Uri $URI -Method Get -Headers $Headers -WebRequest -Verbose:$VerbosePreference

                # --- PS Core does not have -Encoding Byte. Replaced with new parameter AsByteStream
                if (!$IsCoreCLR) {

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