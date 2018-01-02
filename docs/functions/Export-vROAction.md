# Export-vROAction

## SYNOPSIS
Exports an action by its ID.

## SYNTAX

```
Export-vROAction [-Id] <String> [[-Path] <String>]
```

## DESCRIPTION
Exports an action by its ID.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 | Export-vROAction -Path C:\Actions\Test01.action
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROAction -Name Test01 -Category com.company.test | Export-vROAction
```

## PARAMETERS

### -Id
The id of the action

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Path
The resulting path.
If this parameter is not passed the action will be exported to
the current working directory.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String

## OUTPUTS

### System.IO.FileInfo

## NOTES

## RELATED LINKS

