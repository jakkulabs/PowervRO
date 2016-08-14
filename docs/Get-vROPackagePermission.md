# Get-vROPackagePermission

## SYNOPSIS
    
Get vRO Package Permissions

## SYNTAX
 Get-vROPackagePermission [-Name] <String[]> [<CommonParameters>]    

## DESCRIPTION

Get vRO Package Permissions

## PARAMETERS


### Name

Package Name

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

PS C:\>Get-vROPackagePermission -Name "net.powervro.tests"







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROPackage -Name "net.powervro.tests" | Get-vROPackagePermission
```

