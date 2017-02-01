function Get-vROWorkflowExecution {
<#
    .SYNOPSIS
    Get vRO Workflow Executions

    .DESCRIPTION
    Get vRO Workflow Executions

    .PARAMETER Id
    Retrieve workflow by Id

    .PARAMETER Name
    Retrieve workflow by Name

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROWorkflowExecution -Name 'Test01'
#>
[CmdletBinding(DefaultParametersetName="Name")][OutputType('System.Management.Automation.PSObject')]

    Param
    (   
    [parameter(Mandatory=$true,ValueFromPipelinebyPropertyName=$true,ParameterSetName="Id")]
    [String]$Id,
    
    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true,ParameterSetName="Name")]
    [String]$Name 
    )    

    begin {

    }

    process {

        try {       
    
            # --- Send REST call and process results
            switch ($PsCmdlet.ParameterSetName) {         
            
                "Id"  {
            
                    $Workflow = Get-vROWorkflow -Id $Id
                    break

                }

                "Name" {

                    $Workflow = Get-vROWorkflow -Name $Name
                    break
                }
            }

            $ItemHref = $Workflow.ItemHref
            $ExecutionURI = ("$($ItemHref)executions/" -split "8281")[1]

            $Executions = Invoke-vRORestMethod -Method GET -URI $ExecutionURI -Verbose:$VerbosePreference

            $Data = $Executions.relations.link | Where-Object {$_.attributes}

            foreach ($Execution in $Data){

                [pscustomobject]@{                        
        
                    Name = ($Execution.attributes | Where-Object {$_.name -eq 'name'}).value
                    ID = ($Execution.attributes | Where-Object {$_.name -eq 'id'}).value
                    Execution = "$ExecutionURI$(($Execution.attributes | Where-Object {$_.name -eq 'id'}).value)/"
                    State = ($Execution.attributes | Where-Object {$_.name -eq 'state'}).value
                    StartedBy = ($Execution.attributes | Where-Object {$_.name -eq 'startedBy'}).value
                    StartDate = ($Execution.attributes | Where-Object {$_.name -eq 'StartDate'}).value
                    EndDate = ($Execution.attributes | Where-Object {$_.name -eq 'EndDate'}).value
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