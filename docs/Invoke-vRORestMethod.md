# Invoke-vRORestMethod

## SYNOPSIS
    
Wrapper for Invoke-RestMethod with vRO specifics

## SYNTAX
 Invoke-vRORestMethod [-Method] <String> [-URI] <String> [[-Body] <Object>] [-WebRequest] [[-Headers] <IDictionary>]  [[-OutFile] <String>] [<CommonParameters>]    

## DESCRIPTION

Wrapper for Invoke-RestMethod with vRO specifics

## PARAMETERS


### Method

REST Method: GET, POST, PUT or DELETE

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: false

### URI

API URI, e.g. /vco/api/workflows

* Required: true
* Position: 2
* Default value: 
* Accept pipeline input: false

### Body

REST Body in JSON format

* Required: false
* Position: 3
* Default value: 
* Accept pipeline input: false

### WebRequest

Use Invoke-WebRequest instead of Invoke-RestMethod

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

### Headers

Optionally supply custom headers

* Required: false
* Position: 4
* Default value: 
* Accept pipeline input: false

### OutFile

Saves the response body in the specified output file

* Required: false
* Position: 5
* Default value: 
* Accept pipeline input: false

## INPUTS

System.String
System.Collections.IDictionary
Switch

## OUTPUTS

System.Management.Automation.PSObject

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Invoke-vRORestMethod -Method GET -URI '/vco/api/workflows'







-------------------------- EXAMPLE 2 --------------------------

PS C:\>$URI = "/vco/api/workflows/$($ID)/executions/"


$JSON =  @"
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
$InvokeRequest = Invoke-vRORestMethod -Method POST -URI $URI -Body $Body -WebRequest
```

