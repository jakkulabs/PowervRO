# Remove-vROPackagePermission

## SYNOPSIS
    
Remove a Permission from a vRO Package

## SYNTAX
 Remove-vROPackagePermission [-Name] <String[]> [-Principal] <String> [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Remove a Permission from a vRO Package

## PARAMETERS


### Name

Package Name

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Principal

Specify the Permission Principal. Needs to be in the format user@domain or domain\user

* Required: true
* Position: 2
* Default value: 
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

## OUTPUTS

None

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Remove-vROPackagePermission -Name "net.powervro.tests" -Principal vRO_Users@vrademo.local







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROPackage -Name "net.powervro.tests" | Remove-vROPackagePermission -Principal vRO_Users@vrademo.local
```

