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
    Get-vROWorkflowExecution -Id xxxxxxxxxxxxxxxxxxxxxx

    .EXAMPLE
	Get-vROWorkflowExecution -Name 'Test01'

    .EXAMPLE
    Get-vROWorkflow -Name 'Test01' | Get-vROWorkflowExecution
#>
[CmdletBinding(DefaultParametersetName="Name")][OutputType('System.Management.Automation.PSObject')]

    Param (   
        [Parameter(Mandatory=$true, ValueFromPipelinebyPropertyName=$true, ParameterSetName="Id")]
        [String]$Id,

        [Parameter(Mandatory=$true, ParameterSetName="Name")]
        [String]$Name
    )    

    begin {

    }

    process {

        try {

            if ($PSCmdlet.ParameterSetName -eq "Name") {

                $Id = (Get-vROWorkflow -Name $Name).Id
            }
    
            $URI = "/vco/api/workflows/$($Id)/executions"

            $Executions = Invoke-vRORestMethod -Method GET -URI $URI  -Verbose:$VerbosePreference

            $Data = $Executions.relations.link | Where-Object {$_.attributes}

            foreach ($Execution in $Data){

                [PSCustomObject]@{                        
        
                    Name = ($Execution.attributes | Where-Object {$_.name -eq 'name'}).value
                    ID = ($Execution.attributes | Where-Object {$_.name -eq 'id'}).value
                    Execution = "$URI/$(($Execution.attributes | Where-Object {$_.name -eq 'id'}).value)/"
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