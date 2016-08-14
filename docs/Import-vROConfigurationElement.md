# Import-vROConfigurationElement

## SYNOPSIS
    
Imports a configuration element in a given category.

## SYNTAX
 Import-vROConfigurationElement [-CategoryId] <String> [-File] <String[]> [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Imports a configuration element in a given category.

## PARAMETERS


### CategoryId

The name of the configuration element category

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: false

### File

The configuraiton file

* Required: true
* Position: 2
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### WhatIf


* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

### Confirm


* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

## INPUTS

System.String
Switch

## OUTPUTS

None

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Get-ChildItem -Path C:\Configurations\*.vsoconfig | Import-vROConfigurationElement -CategoryId 
"36cd783f-e858-4783-9273-06d11defc8b0" -Confirm:$false
```

