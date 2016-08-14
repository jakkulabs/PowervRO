# Get-vROPackage

## SYNOPSIS
    
Get vRO Packages

## SYNTAX
 Get-vROPackage [<CommonParameters>] Get-vROPackage -Name <String> [<CommonParameters>]    

## DESCRIPTION

Get vRO Packages

## PARAMETERS


### Name

Retrieve Package by Name

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

## INPUTS

System.String
System.Switch

## OUTPUTS

System.Management.Automation.PSObject.

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Get-vROPackage







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROPackage -Name 'com.vmware.library.powershell'
```

