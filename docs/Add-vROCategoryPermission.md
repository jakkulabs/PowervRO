# Add-vROCategoryPermission

## SYNOPSIS
    
Add a Permission to a vRO Category

## SYNTAX
 Add-vROCategoryPermission [-Id] <String[]> [-Principal] <String> [-Rights] <String[]> [-WhatIf] [-Confirm]  [<CommonParameters>]    

## DESCRIPTION

Add a Permission to a vRO Category

## PARAMETERS


### Id

Category Id

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

PS C:\>Add-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e' -Principal vRO_Users@vrademo.local -Rights 
'View','Execute','Inspect'







-------------------------- EXAMPLE 2 --------------------------

PS C:\>$Permissions = Get-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e'


Get-vROCategory -Id '40281e8654ddec6201554f5836651514' | Add-vROCategoryPermission -Principal 
$Permissions[0].Principal -Rights $Permissions[0].Rights
```

