# Remove-vROCategory

## SYNOPSIS
    
Remove a vRO Category

## SYNTAX
 Remove-vROCategory [-Id] <String[]> [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Remove a vRO Category

## PARAMETERS


### Id

Category ID

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Force

If the contains any content such as Workflows, Actions, Resource Elements or Configuration Elements the delete 
operation will fail, unless the 'force' option is provided. USE WITH CAUTION!

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

PS C:\>Remove-vROCategory -Id "40281e8654ddec620155df5563fc1800"







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROCategory -Id '40281e8b555889520155588bc4c10f1c' | Remove-vROCategory -Confirm:$false
```

