# Remove-vROCategory

## SYNOPSIS
Remove a vRO Category

## SYNTAX

```
Remove-vROCategory [-Id] <String[]> [-Force] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Remove a vRO Category

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-vROCategory -Id "40281e8654ddec620155df5563fc1800"
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROCategory -Id '40281e8b555889520155588bc4c10f1c' | Remove-vROCategory -Confirm:$false
```

## PARAMETERS

### -Id
Category ID

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
If the contains any content such as Workflows, Actions, Resource Elements or Configuration Elements the delete operation will fail, unless the 'force' option is provided.
USE WITH CAUTION!

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

