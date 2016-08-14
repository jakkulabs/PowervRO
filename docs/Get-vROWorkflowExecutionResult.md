# Get-vROWorkflowExecutionResult

## SYNOPSIS
    
Get vRO Workflow Execution Result

## SYNTAX
 Get-vROWorkflowExecutionResult [-ExecutionRef] <String> [<CommonParameters>]    

## DESCRIPTION

Get vRO Workflow Execution Result

## PARAMETERS


### ExecutionRef

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

PS C:\>Get-vROWorkflowExecutionResult -ExecutionRef 
/vco/api/workflows/565b2c35-3607-4ab9-ace7-9102c1391808/executions/402880244ae8e2a6014b045ea9290213







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROWorkflow -Name Test04 | Get-vROWorkflowExecution | Select-Object -Last 1 | Get-vROWorkflowExecutionResult
```

