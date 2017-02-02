# Remove-vROAction

## SYNOPSIS
Remove a vRO Action

## SYNTAX

```
Remove-vROAction [-Id] <String[]> [-Force] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Remove a vRO Action

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-vROAction -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea"
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROAction -Name Test01 -Category com.company.test | Remove-vROAction -Confirm:$false
```

## PARAMETERS

### -Id
Action ID

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

### -Force
If the action is referenced by some workflows, it is considered to be 'in use'and the delete operation will fail, unless the 'force' option is provided.

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

### System.String.
Switch

## OUTPUTS

### None

## NOTES

## RELATED LINKS

