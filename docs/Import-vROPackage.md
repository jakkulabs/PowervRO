# Import-vROPackage

## SYNOPSIS
    
Imports a vRO Package

## SYNTAX
 Import-vROPackage [-File] <String[]> [-Overwrite] [-ImportConfigurationAttributeValues] [[-TagImportMode] <String>]  [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Imports a vRO Package

## PARAMETERS


### File

The action file

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Overwrite

Overwrite an existing Package

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

### ImportConfigurationAttributeValues

Import Configuration Attribute Values

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

### TagImportMode

Tag Import Mode

* Required: false
* Position: 2
* Default value: Dont
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

PS C:\>Import-vROPackage -File C:\Packages\net.powervro.tests.package -Overwrite







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-ChildItem -Path C:\Packages\net.powervro.tests.package | Import-vROPackage -Confirm:$false
```

