# Remove-vROPackage

## SYNOPSIS
    
Remove a vRO Package

## SYNTAX
 Remove-vROPackage -Name <String[]> [-WhatIf] [-Confirm] [<CommonParameters>] Remove-vROPackage -Name <String[]> [-DeletePackageWithContent] [-WhatIf] [-Confirm] [<CommonParameters>] Remove-vROPackage -Name <String[]> [-DeletePackageKeepingShared] [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Remove a vRO Package

## PARAMETERS


### Name

Package Name

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### DeletePackageWithContent

Deletes the package along with the content. If other packages share elements with this package, they will be deleted

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

### DeletePackageKeepingShared

Deletes the package along with the content. If other packages share elements with this package, the elements will not 
be removed.

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

System.String.
Switch

## OUTPUTS

None

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Remove-vROPackage -Name "net.powervro.tests"







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROPackage -Name "net.powervro.tests" | Remove-vROPackage -Confirm:$false
```

