function Get-vROWorkflowExecutionState {
<#
    .SYNOPSIS
    Get vRO Workflow Execution State

    .DESCRIPTION
    Get vRO Workflow Execution State

    .PARAMETER ExecutionStateRef
    vRO Workflow Execution Reference

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROWorkflowExecutionState -ExecutionStateRef '/vco/api/workflows/565b2c35-3607-4ab9-ace7-9102c1391808/executions/402880244ae8e2a6014b045ea9290213'

    .EXAMPLE
    Get-vROWorkflowExecution -Id 3f92d2dc-a9fa-4323-900b-ef97196184ea | Select-Object -Last 1 | Get-vROWorkflowExecutionState
#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param
    (   
    
    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [Alias("Execution")]
    [ValidateNotNullOrEmpty()]
    [String]$ExecutionStateRef
      
    )    

    begin {

    }

    process {

        try {

            foreach ($Reference in $ExecutionStateRef){
    
                # --- Send REST call and process results            

                $URI = $Reference + "state"
                $State = Invoke-vRORestMethod -Method GET -Uri $URI -WebRequest -Verbose:$VerbosePreference

                [pscustomobject]@{                                             
        
                    ExecutionStateRef = $Reference         
                    StatusCode = $State.StatusCode
                    StatusDescription = $State.StatusDescription
                    Execution = ($State.Content | ConvertFrom-Json).Value
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