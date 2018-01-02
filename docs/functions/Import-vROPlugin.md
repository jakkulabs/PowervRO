# Import-vROPlugin

## SYNOPSIS
Imports a resource element in a given category.

## SYNTAX

```
Import-vROPlugin [-File] <FileInfo> [-Format] <String> [-Overwrite] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Imports a resource element in a given category.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ChildItem -Path C:\Resources\* | Import-vROResourceElement -CategoryId "36cd783f-e858-4783-9273-06d11defc8b0" -Confirm:$false
```

## PARAMETERS

### -File
The plugin file

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Format
The format of the plugin.
It can be either dar or vmoapp

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

### -Overwrite
Overwrite an installed plugin

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

