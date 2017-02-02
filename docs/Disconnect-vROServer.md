# Disconnect-vROServer

## SYNOPSIS
Disconnect from a vRO server

## SYNTAX

```
Disconnect-vROServer [-WhatIf] [-Confirm]
```

## DESCRIPTION
Disconnect from a vRO server by removing the global vRAConnection variable from PowerShell

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Disconnect-vROServer
```

### -------------------------- EXAMPLE 2 --------------------------
```
Disconnect-vROServer -Confirm:$false
```

## PARAMETERS

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

## OUTPUTS

## NOTES

## RELATED LINKS

