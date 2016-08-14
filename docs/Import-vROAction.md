# Import-vROAction

## SYNOPSIS
    
Imports an action in a given category.

## SYNTAX
 Import-vROAction [-CategoryName] <String> [-File] <String[]> [-Overwrite] [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Imports an action in a given category.

## PARAMETERS


### CategoryName

The name of the action category

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: false

### File

The action file

* Required: true
* Position: 2
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Overwrite

Overwrite an existing action

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
Switch

## OUTPUTS

None

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Import-vROAction -File C:\Actions\test01.action -CategoryName "com.company.package" -Confirm:$false







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-ChildItem -Path C:\Actions\*.action | Import-vROAction -CategoryName "com.company.package" -Confirm:$false
```

