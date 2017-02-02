# Export-vROPackage

## SYNOPSIS
Export a vRO Package to a .package file

## SYNTAX

```
Export-vROPackage [-Name] <String> [-File] <String> [-DontExportConfigurationAttributeValues]
 [-DontExportGlobalTags]
```

## DESCRIPTION
Export a vRO Package to a .package file

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Export-vROPackage -Name "net.powervro.tests" -File C:\Packages\net.powervro.tests.package
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROPackage -Name 'net.powervro.tests' | Export-vROPackage -File C:\Packages\net.powervro.tests.package -DontExportConfigurationAttributeValues
```

## PARAMETERS

### -Name
Specify the Name of the vRO Package

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -File
Specify the Filename to export to - should be a .package file

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DontExportConfigurationAttributeValues
Don't Export Configuration Attribute Values

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DontExportGlobalTags
Don't Export Global Tags

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String
Switch

## OUTPUTS

### System.IO.FileInfo

## NOTES
Thanks to @burkeazbill for a few hints with this one https://github.com/burkeazbill/vroClientScripts

## RELATED LINKS

