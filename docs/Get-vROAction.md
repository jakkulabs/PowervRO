# Get-vROAction

## SYNOPSIS
    
Retrieves a list of all actions

## SYNTAX
 Get-vROAction [<CommonParameters>] Get-vROAction -Id <String> [<CommonParameters>] Get-vROAction -Name <String> -Category <String> [<CommonParameters>]    

## DESCRIPTION

Retrieves a list of all actions

## PARAMETERS


### Id

The id of the action

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Name

The name of the action

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

### Category

The category that the action is in. This must be used with the name parameter

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

## INPUTS

System.String

## OUTPUTS

System.Management.Automation.PSObject.

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Get-vROAction







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROAction -Id f2193849-89e9-4136-8607-526eb196ee4c







-------------------------- EXAMPLE 3 --------------------------

PS C:\>Get-vROAction -Name Test01 -Category com.company.test
```

