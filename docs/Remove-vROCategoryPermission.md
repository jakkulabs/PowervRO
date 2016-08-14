# Remove-vROCategoryPermission

## SYNOPSIS
    
Remove a Permission from a vRO Category

## SYNTAX
 Remove-vROCategoryPermission [-Id] <String[]> [-Principal] <String> [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Remove a Permission from a vRO Category

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

PS C:\>Remove-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e' -Principal vRO_Users@vrademo.local







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROCategory -Id '40281e8654ddec6201553af63677146e' | Remove-vROWorkflowPermission -Principal 
vRO_Users@vrademo.local
```

