# Set-vROPluginState

## SYNOPSIS
Sets the state of a vRO plugin

## SYNTAX

```
Set-vROPluginState [-Name] <String[]> [-Enabled] <Boolean> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Sets the state of a vRO plugin

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-vROPlugin -Name ExamplePlugin -Enabled:$True
```

### -------------------------- EXAMPLE 2 --------------------------
```
Remove-vROPlugin -Name ExamplePlugin -Enabled:$False
```

## PARAMETERS

### -Name
The name of the plugin

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

### -Enabled
A boolean value to decide whether or not the plugin is enabled

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
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

### System.String.

## OUTPUTS

### None

## NOTES

## RELATED LINKS

