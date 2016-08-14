# Get-vROWorkflowPermission

## SYNOPSIS
    
Get vRO Workflow Permissions

## SYNTAX
 Get-vROWorkflowPermission [-Id] <String[]> [<CommonParameters>]    

## DESCRIPTION

Get vRO Workflow Permissions

## PARAMETERS


### Id

Workflow Id

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

PS C:\>Get-vROWorkflowPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROWorkflow -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROWorkflowPermission
```

