# Import-vROResourceElement

## SYNOPSIS
Imports a resource element in a given category.

## SYNTAX

```
Import-vROResourceElement [-CategoryId] <String> [-File] <String[]> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Imports a resource element in a given category.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ChildItem -Path C:\Resources\* | Import-vROResourceElement -CategoryId "36cd783f-e858-4783-9273-06d11defc8b0" -Confirm:$false
```

## PARAMETERS

### -CategoryId
The name of the resource element category

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
The resouce file

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

