# Invoke-vROWorkflow

## SYNOPSIS
    
Invoke a vRO Workflow

## SYNTAX
 Invoke-vROWorkflow -ID <String> [-ParameterName <String>] [-ParameterValue <String>] [-ParameterType <String>]  [<CommonParameters>] Invoke-vROWorkflow -ID <String> [-Parameters <PSObject[]>] [<CommonParameters>] Invoke-vROWorkflow -ItemHref <String> [-NoParameters] [<CommonParameters>] Invoke-vROWorkflow -ItemHref <String> [-Parameters <PSObject[]>] [<CommonParameters>] Invoke-vROWorkflow -ItemHref <String> [-ParameterName <String>] [-ParameterValue <String>] [-ParameterType <String>]  [<CommonParameters>]    

## DESCRIPTION

Invoke a vRO Workflow

## PARAMETERS


### ID

vRO Workflow ID

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: true (ByPropertyName)

### ItemHref

vRO ItemHref

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: true (ByPropertyName)

### ParameterName

Supply a single parameter to the workflow

* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

### ParameterValue

Supply the value of the single parameter

* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

### ParameterType

Supply the type of the single parameter

* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

### Parameters

Supply workflow parameters via JSON or New-vROParameterDefinition

* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

### NoParameters

Required when using ItemHref and supplying no parameters

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

PS C:\>Invoke-vROWorkflow -ID c0278910-9ae2-46c5-bb45-2292fe88e3ab







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Invoke-vROWorkflow -ItemHref 
https://vRO01.vrademo.local:8281/vco/api/workflows/c0278910-9ae2-46c5-bb45-2292fe88e3ab/







-------------------------- EXAMPLE 3 --------------------------

PS C:\>Invoke-vROWorkflow -ID c0278910-9ae2-46c5-bb45-2292fe88e3ab -ParameterName 'text' -ParameterValue 'Apple' 
-ParameterType 'String'







-------------------------- EXAMPLE 4 --------------------------

PS C:\>$Parameters =  @"


{"parameters":
[
    {
        "value": {"string":{ "value": "Apple"}},
        "type": "string",
        "name": "a",
        "scope": "local"
    },
    {
        "value": {"number":{ "value": 20}},
        "type": "number",
        "name": "b",
        "scope": "local"
    }    
]
}
"@
Invoke-vROWorkflow -ID c0278910-9ae2-46c5-bb45-2292fe88e3ab -Parameters ($Parameters | ConvertFrom-Json).parameters




-------------------------- EXAMPLE 5 --------------------------

PS C:\>$Param1 = New-vROParameterDefinition -Name a -Value Apple -Type String -Scope LOCAL


Invoke-vROWorkflow -Id c0278910-9ae2-46c5-bb45-2292fe88e3ab -Parameters $Param1




-------------------------- EXAMPLE 6 --------------------------

PS C:\>Get-vROWorkflow -Name 'Test-Workflow' | Invoke-vROWorkflow -ParameterName a -ParameterValue 'Nature' 
-ParameterType String







-------------------------- EXAMPLE 7 --------------------------

PS C:\>Get-vROWorkflow -Name 'Test-Workflow' | Select ItemHref | Invoke-vROWorkflow -ParameterName a -ParameterValue 
'Junior' -ParameterType String
```

