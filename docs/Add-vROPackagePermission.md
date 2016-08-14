# Add-vROPackagePermission

## SYNOPSIS
    
Add a Permission to a vRO Package

## SYNTAX
 Add-vROPackagePermission [-Name] <String[]> [-Principal] <String> [-Rights] <String[]> [-WhatIf] [-Confirm]  [<CommonParameters>]    

## DESCRIPTION

Add a Permission to a vRO Package

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

### Rights

Specify the Permission Rights

* Required: true
* Position: 3
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

System.Management.Automation.PSObject.

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Add-vROPackagePermission -Name "net.powervro.tests" -Principal vRO_Users@vrademo.local -Rights 'View','Inspect'







-------------------------- EXAMPLE 2 --------------------------

PS C:\>$Permissions = Get-vROPackagePermission -Name "net.powervro.tests"


Get-vROPackage -Name "net.powervro.tests2" | Add-vROWorkflowPermission -Principal $Permissions[0].Principal -Rights 
$Permissions[0].Rights
```

