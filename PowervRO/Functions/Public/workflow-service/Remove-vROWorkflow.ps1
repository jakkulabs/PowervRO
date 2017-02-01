function Remove-vROWorkflow {
<#
    .SYNOPSIS
    Remove a vRO Workflow
    
    .DESCRIPTION
    Remove a vRO Workflow
    
    .PARAMETER Id
    Workflow ID

    .PARAMETER Force
    If the workflow is referenced by some other workflows, or is running, it is considered to be 'in use' and the delete operation will fail, unless the 'force' option is provided.

    .INPUTS
    System.String.
    Switch

    .OUTPUTS
    None

    .EXAMPLE
    Remove-vROWorkflow -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea"

    .EXAMPLE
    Get-vROWorkflow -Name Test01 | Remove-vROWorkflow -Confirm:$false
#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Id,

    [parameter(Mandatory=$false)]
    [Switch]$Force
    )    

    begin {
    
    }
    
    process {    

        foreach ($WorkflowId in $Id){

            try {    
                
                if ($PSBoundParameters.ContainsKey("Force")) {
                
                    $URI = "/vco/api/workflows/$($WorkflowId)?force=true"
                }
                else {

                    $URI = "/vco/api/workflows/$($WorkflowId)"
                }

                if ($PSCmdlet.ShouldProcess($WorkflowId)){

                    # --- Run vRO REST Request
                    Invoke-vRORestMethod -Uri $URI -Method DELETE -Verbose:$VerbosePreference
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