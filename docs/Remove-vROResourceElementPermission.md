# Remove-vROResourceElementPermission

## SYNOPSIS
    
Remove a Permission from a vRO Resource Element

## SYNTAX
 Remove-vROResourceElementPermission [-Id] <String[]> [-Principal] <String> [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Remove a Permission from a vRO Resource Element

## PARAMETERS


### Id

Resource Element Id

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

PS C:\>Remove-vROResourceElementPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' -Principal 
vRO_Users@vrademo.local







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROResourceElement -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Remove-vROResourceElementPermission 
-Principal vRO_Users@vrademo.local
```

