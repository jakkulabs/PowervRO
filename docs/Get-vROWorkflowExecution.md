# Get-vROWorkflowExecution

## SYNOPSIS
    
Get vRO Workflow Executions

## SYNTAX
 Get-vROWorkflowExecution -Name <String> [<CommonParameters>] Get-vROWorkflowExecution -Id <String> [<CommonParameters>]    

## DESCRIPTION

Get vRO Workflow Executions

## PARAMETERS


### Id

Retrieve workflow by Id

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: true (ByPropertyName)

### Name

Retrieve workflow by Name

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

## INPUTS

System.String

## OUTPUTS

System.Management.Automation.PSObject.

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Get-vROWorkflowExecution -Name 'Test01'
```

