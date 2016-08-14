# Get-vROActionPermission

## SYNOPSIS
    
Get vRO Action Permissions

## SYNTAX
 Get-vROActionPermission [-Id] <String[]> [<CommonParameters>]    

## DESCRIPTION

Get vRO Action Permissions

## PARAMETERS


### Id

Action Id

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

PS C:\>Get-vROActionPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROAction -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROActionPermission
```

