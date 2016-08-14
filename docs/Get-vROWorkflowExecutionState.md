# Get-vROWorkflowExecutionState

## SYNOPSIS
    
Get vRO Workflow Execution State

## SYNTAX
 Get-vROWorkflowExecutionState [-ExecutionStateRef] <String> [<CommonParameters>]    

## DESCRIPTION

Get vRO Workflow Execution State

## PARAMETERS


### ExecutionStateRef

vRO Workflow Execution Reference

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

## INPUTS

System.String

## OUTPUTS

System.Management.Automation.PSObject.

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Get-vROWorkflowExecutionState -ExecutionStateRef 
'/vco/api/workflows/565b2c35-3607-4ab9-ace7-9102c1391808/executions/402880244ae8e2a6014b045ea9290213'







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROWorkflowExecution -Id 3f92d2dc-a9fa-4323-900b-ef97196184ea | Select-Object -Last 1 | 
Get-vROWorkflowExecutionState
```

