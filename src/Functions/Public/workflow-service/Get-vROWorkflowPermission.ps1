function Get-vROWorkflowPermission {
<#
    .SYNOPSIS
    Get vRO Workflow Permissions

    .DESCRIPTION
    Get vRO Workflow Permissions

    .PARAMETER Id
    Workflow Id

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROWorkflowPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'

    .EXAMPLE
	Get-vROWorkflow -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROWorkflowPermission
#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param
    (   
    
    [parameter(Mandatory=$true,ValueFromPipeline,ValueFromPipelinebyPropertyName=$true)]
    [String[]]$Id

    )

    begin {

    }

    process {

        try {

            foreach ($WorkflowId in $Id){

                # --- Send REST call and process results            
                $URI = "/vco/api/workflows/$($WorkflowId)/permissions"

                $Workflow = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference

                foreach ($Permission in $Workflow.permissions){

                    $Rights = @()

                    switch -regex ($Permission.permission.rights)
                    {
                        "[r]" {$Rights += "View"}
                        "[x]" {$Rights += "Execute"}
                        "[i]" {$Rights += "Inspect"}
                        "[c]" {$Rights += "Edit"}
                        "[a]" {$Rights += "Admin"}

                        Default {}
                    }

                    [pscustomobject]@{                
                    
                        Principal = $Permission.permission.principal
                        Rights = $Rights
                        WorkflowID = $WorkflowId
                        WorkflowHref = $Permission.permission.href
                    }
                }
            }
        }
        catch [Exception]{
        
            throw
        }
    }

    end {

    }
}