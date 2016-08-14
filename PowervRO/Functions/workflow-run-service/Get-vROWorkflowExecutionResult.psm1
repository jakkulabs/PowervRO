function Get-vROWorkflowExecutionResult {
<#
    .SYNOPSIS
    Get vRO Workflow Execution Result

    .DESCRIPTION
    Get vRO Workflow Execution Result

    .PARAMETER ExecutionRef
    vRO Workflow Execution Reference

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROWorkflowExecutionResult -ExecutionRef /vco/api/workflows/565b2c35-3607-4ab9-ace7-9102c1391808/executions/402880244ae8e2a6014b045ea9290213

    .EXAMPLE
    Get-vROWorkflow -Name Test04 | Get-vROWorkflowExecution | Select-Object -Last 1 | Get-vROWorkflowExecutionResult
#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param
    (   

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [Alias("Execution")]
    [ValidateNotNullOrEmpty()]
    [String]$ExecutionRef 
    )
    
    begin {

    }

    process {  

        try {

            foreach ($Reference in $ExecutionRef){   
    
                # --- Send REST call and process results            

                $Result = Invoke-vRORestMethod -Method GET -Uri $Reference -WebRequest -Verbose:$VerbosePreference

                $JSON = $Result.Content | ConvertFrom-Json

                foreach ($OutputParameter in $JSON.'output-parameters'){

                    $Type = $OutputParameter.type

                    [pscustomobject]@{                          
            
                        ExecutionRef = $Reference      
                        Name = $OutputParameter.name
                        Scope = $OutputParameter.scope
                        Type = $OutputParameter.type
                        Value = $OutputParameter.value.$Type.value
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