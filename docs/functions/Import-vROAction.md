# Import-vROAction

## SYNOPSIS
Imports an action in a given category.

## SYNTAX

```
Import-vROAction [-CategoryName] <String> [-File] <String[]> [-Overwrite] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Imports an action in a given category.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Import-vROAction -File C:\Actions\test01.action -CategoryName "com.company.package" -Confirm:$false
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-ChildItem -Path C:\Actions\*.action | Import-vROAction -CategoryName "com.company.package" -Confirm:$false
```

## PARAMETERS

### -CategoryName
The name of the action category

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -File
The action file

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Overwrite
Overwrite an existing action

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
Switch

## OUTPUTS

### None

## NOTES

## RELATED LINKS

