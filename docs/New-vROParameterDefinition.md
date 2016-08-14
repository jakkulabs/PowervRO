# New-vROParameterDefinition

## SYNOPSIS
    
Create a parameter definition for use with workflows such as Invoke-vROWorkflow and Invoke-vROAction

## SYNTAX
 New-vROParameterDefinition [-Name] <String> [-Value] <String> [-Type] <String> [[-Scope] <String>] [<CommonParameters>]    

## DESCRIPTION

Create a parameter definition for use with workflows such as Invoke-vROWorkflow and Invoke-vROAction

## PARAMETERS


### Name

Name of the workflow or action parameter

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: false

### Value

Value of the workflow or action parameter

* Required: true
* Position: 2
* Default value: 
* Accept pipeline input: false

### Type

Type of the workflow or action parameter

* Required: true
* Position: 3
* Default value: 
* Accept pipeline input: false

### Scope

Scope of the workflow or action parameter

* Required: false
* Position: 4
* Default value: LOCAL
* Accept pipeline input: false

## INPUTS

System.String.

## OUTPUTS

System.Management.Automation.PSObject

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>$Param1 = New-vROParameterDefinition -Name a -Value Apple -Type String -Scope LOCAL


Invoke-vROWorkflow -Id c0278910-9ae2-46c5-bb45-2292fe88e3ab -Parameters $Param1




-------------------------- EXAMPLE 2 --------------------------

PS C:\>$Param1 = New-vROParameterDefinition -Name Location -Value UK -Type String -Scope LOCAL


Invoke-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 -Parameters $Param1
```

