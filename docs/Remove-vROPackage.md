# Remove-vROPackage

## SYNOPSIS
Remove a vRO Package

## SYNTAX

### DeletePackage (Default)
```
Remove-vROPackage -Name <String[]> [-WhatIf] [-Confirm]
```

### DeletePackageWithContent
```
Remove-vROPackage -Name <String[]> [-DeletePackageWithContent] [-WhatIf] [-Confirm]
```

### DeletePackageKeepingShared
```
Remove-vROPackage -Name <String[]> [-DeletePackageKeepingShared] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Remove a vRO Package

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-vROPackage -Name "net.powervro.tests"
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROPackage -Name "net.powervro.tests" | Remove-vROPackage -Confirm:$false
```

## PARAMETERS

### -Name
Package Name

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -DeletePackageWithContent
Deletes the package along with the content.
If other packages share elements with this package, they will be deleted

```yaml
Type: SwitchParameter
Parameter Sets: DeletePackageWithContent
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DeletePackageKeepingShared
Deletes the package along with the content.
If other packages share elements with this package, the elements will not be removed.

```yaml
Type: SwitchParameter
Parameter Sets: DeletePackageKeepingShared
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

