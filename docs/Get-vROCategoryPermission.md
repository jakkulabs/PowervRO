# Get-vROCategoryPermission

## SYNOPSIS
    
Get vRO Category Permissions

## SYNTAX
 Get-vROCategoryPermission [-Id] <String[]> [<CommonParameters>]    

## DESCRIPTION

Get vRO Category Permissions

## PARAMETERS


### Id

Category Id

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

## INPUTS

System.String

## OUTPUTS

System.Management.Automation.PSObject.

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Get-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e'







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROCategory -Id '40281e8654ddec6201553af63677146e' | Get-vROCategoryPermission
```

