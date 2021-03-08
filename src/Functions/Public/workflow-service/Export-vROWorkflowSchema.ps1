function Export-vROWorkflowSchema {
<#
    .SYNOPSIS
    Export a vRO Workflow Schema as a PNG file

    .DESCRIPTION
    Export a vRO Workflow Schema as a PNG file

    .PARAMETER Id
    Specify the ID of the vRO Workfow

    .PARAMETER File
    Specify the Filename to export to - should be a PNG file

    .INPUTS
    System.String

    .OUTPUTS
    System.IO.FileInfo

    .EXAMPLE
    Export-vROWorkflowSchema -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea" -File C:\Schemata\Test01.png

    .EXAMPLE
    Get-vROWorkflow -Name Test01 | Export-vROWorkflowSchema -File C:\Schemata\Test01.png
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

    }

    process {

        foreach ($WorkflowId in $Id){

            try {

                $URI = "/vco/api/workflows/$($WorkflowId)/schema"

                $Headers = @{

                    "Content-Type" = "image/png";
                    "Authorization" = "Basic $($Script:vROConnection.EncodedPassword)";
                }

                # --- Run vRO REST Request
                Invoke-vRORestMethod -Method GET -Headers $Headers -URI $URI -OutFile $File -Verbose:$VerbosePreference

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