# Get-vROResourceElementPermission

## SYNOPSIS
    
Get vRO Resource Element Permissions

## SYNTAX
 Get-vROResourceElementPermission [-Id] <String[]> [<CommonParameters>]    

## DESCRIPTION

Get vRO Resource Element Permissions

## PARAMETERS


### Id

Resource Element Id

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

PS C:\>Get-vROResourceElementPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROResourceElement -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROResourceElementPermission
```

