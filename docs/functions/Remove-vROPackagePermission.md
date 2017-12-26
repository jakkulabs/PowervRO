# Remove-vROPackagePermission

## SYNOPSIS
Remove a Permission from a vRO Package

## SYNTAX

```
Remove-vROPackagePermission [-Name] <String[]> [-Principal] <String> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Remove a Permission from a vRO Package

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-vROPackagePermission -Name "net.powervro.tests" -Principal vRO_Users@vrademo.local
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROPackage -Name "net.powervro.tests" | Remove-vROPackagePermission -Principal vRO_Users@vrademo.local
```

## PARAMETERS

### -Name
Package Name

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

