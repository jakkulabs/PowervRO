# Get-vROConfigurationElementPermission

## SYNOPSIS
    
Get vRO Configuration Element Permissions

## SYNTAX
 Get-vROConfigurationElementPermission [-Id] <String[]> [<CommonParameters>]    

## DESCRIPTION

Get vRO Configuration Element Permissions

## PARAMETERS


### Id

Configuration Element Id

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

PS C:\>Get-vROConfigurationElementPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROConfigurationElement -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROConfigurationElementPermission
```

