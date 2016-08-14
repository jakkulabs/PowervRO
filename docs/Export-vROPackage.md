# Export-vROPackage

## SYNOPSIS
    
Export a vRO Package to a .package file

## SYNTAX
 Export-vROPackage [-Name] <String> [-File] <String> [-DontExportConfigurationAttributeValues] [-DontExportGlobalTags]  [<CommonParameters>]    

## DESCRIPTION

Export a vRO Package to a .package file

## PARAMETERS


### Name

Specify the Name of the vRO Package

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### File

Specify the Filename to export to - should be a .package file

* Required: true
* Position: 2
* Default value: 
* Accept pipeline input: false

### DontExportConfigurationAttributeValues

Don't Export Configuration Attribute Values

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

### DontExportGlobalTags

Don't Export Global Tags

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

## INPUTS

System.String
Switch

## OUTPUTS

System.IO.FileInfo

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Export-vROPackage -Name "net.powervro.tests" -File C:\Workflows\net.powervro.tests.workflow







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROPackage -Name 'net.powervro.tests' | Export-vROPackage -File C:\Workflows\Test01.workflow 
-DontExportConfigurationAttributeValues
```

