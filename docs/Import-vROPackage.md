# Import-vROPackage

## SYNOPSIS
Imports a vRO Package

## SYNTAX

```
Import-vROPackage [-File] <String[]> [-Overwrite] [-ImportConfigurationAttributeValues]
 [[-TagImportMode] <String>] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Imports a vRO Package

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Import-vROPackage -File C:\Packages\net.powervro.tests.package -Overwrite
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-ChildItem -Path C:\Packages\net.powervro.tests.package | Import-vROPackage -Confirm:$false
```

## PARAMETERS

### -File
The action file

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Overwrite
Overwrite an existing Package

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

### -ImportConfigurationAttributeValues
Import Configuration Attribute Values

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

### -TagImportMode
Tag Import Mode

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: Dont
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String
System.IO.FileInfo
Switch

## OUTPUTS

### None

## NOTES

## RELATED LINKS

