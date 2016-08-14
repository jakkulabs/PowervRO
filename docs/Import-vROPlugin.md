# Import-vROPlugin

## SYNOPSIS
    
Imports a resource element in a given category.

## SYNTAX
 Import-vROPlugin [-File] <FileInfo> [-Format] <String> [-Overwrite] [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Imports a resource element in a given category.

## PARAMETERS


### File

The plugin file

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Format

The format of the plugin. It can be either dar or vmoapp

* Required: true
* Position: 2
* Default value: 
* Accept pipeline input: false

### Overwrite


* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

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
System.IO.FileInfo
Switch

## OUTPUTS

None

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Get-ChildItem -Path C:\Resources\* | Import-vROResourceElement -CategoryId 
"36cd783f-e858-4783-9273-06d11defc8b0" -Confirm:$false
```

