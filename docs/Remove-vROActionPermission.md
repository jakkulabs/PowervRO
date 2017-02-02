# Remove-vROActionPermission

## SYNOPSIS
Remove a Permission from a vRO Action

## SYNTAX

```
Remove-vROActionPermission [-Id] <String[]> [-Principal] <String> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Remove a Permission from a vRO Action

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-vROActionPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' -Principal vRO_Users@vrademo.local
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROAction -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Remove-vROActionPermission -Principal vRO_Users@vrademo.local
```

## PARAMETERS

### -Id
Action Id

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

### -Principal
Specify the Permission Principal.
Needs to be in the format user@domain or domain\user

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

## OUTPUTS

### None

## NOTES

## RELATED LINKS

