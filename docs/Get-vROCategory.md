# Get-vROCategory

## SYNOPSIS
    
Get vRO Categories

## SYNTAX
 Get-vROCategory [-Root] [<CommonParameters>] Get-vROCategory -CategoryType <String> [-Root] [<CommonParameters>] Get-vROCategory -Id <String> [<CommonParameters>]    

## DESCRIPTION

Get vRO Categories

## PARAMETERS


### CategoryType

Retrieve Category by CategoryType

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

### Id

Retrieve Category by Id

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

### Root

Retrieve only Categories in the top-level folder root

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

PS C:\>Get-vROCategory







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROCategory -CategoryType Workflow







-------------------------- EXAMPLE 3 --------------------------

PS C:\>Get-vROCategory -Id '40281e8b555889520155588bc4c10f1c'







-------------------------- EXAMPLE 4 --------------------------

PS C:\>Get-vROCategory -CategoryType ResourceElement -Root
```

