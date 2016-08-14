# Get-vROWorkflow

## SYNOPSIS
    
Get vRO Workflows

## SYNTAX
 Get-vROWorkflow [<CommonParameters>] Get-vROWorkflow [-Category <String>] [<CommonParameters>] Get-vROWorkflow [-Id <String>] [<CommonParameters>] Get-vROWorkflow [-Name <String>] [-Wildcard] [<CommonParameters>]    

## DESCRIPTION

Get vRO Workflows

## PARAMETERS


### Category

Retrieve workflow by Category

* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

### Id

Retrieve workflow by Id

* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

### Name

Retrieve workflow by Name

* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

### Wildcard

Perform a wildcard search when using the Name parameter

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

## INPUTS

System.String
System.Switch

## OUTPUTS

System.Management.Automation.PSObject.

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Get-vROWorkflow







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROWorkflow -Category Dev







-------------------------- EXAMPLE 3 --------------------------

PS C:\>Get-vROWorkflow -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'







-------------------------- EXAMPLE 4 --------------------------

PS C:\>Get-vROWorkflow -Name 'New-DRSRule'







-------------------------- EXAMPLE 5 --------------------------

PS C:\>Get-vROWorkflow -Name 'New' -Wildcard
```

