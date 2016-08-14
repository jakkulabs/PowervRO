# Invoke-vROAction

## SYNOPSIS
    
Invoke a vRO Action

## SYNTAX
 Invoke-vROAction -Id <String> [-Parameters <PSObject[]>] [<CommonParameters>] Invoke-vROAction -Name <String> -Category <String> [-Parameters <PSObject[]>] [<CommonParameters>]    

## DESCRIPTION

Invoke a vRO Action

## PARAMETERS


### Id

The id of the action requesting an action by id will return additional information

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

### Parameters

The parameters, if any, that the action expects. The input expects an array of New-vROParameterDefinition

* Required: false
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

PS C:\>$Param1 = New-vROParameterDefinition -Name Location -Value UK -Type String -Scope LOCAL


Invoke-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 -Parameters $Param1




-------------------------- EXAMPLE 2 --------------------------

PS C:\>$Param1 = New-vROParameterDefinition -Name Location -Value UK -Type String -Scope LOCAL


Invoke-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 -Parameters $Param1 | ConvertTo-Json




-------------------------- EXAMPLE 3 --------------------------

PS C:\>Invoke-vROACtion -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133
```

