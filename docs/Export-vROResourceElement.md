# Export-vROResourceElement

## SYNOPSIS
Exports a resource element by its ID.

## SYNTAX

```
Export-vROResourceElement [-Id] <String> [[-Path] <String>]
```

## DESCRIPTION
Exports a resource element by its ID.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROResourceElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 | Export-vROResourceElement -Path C:\Resources
```

### -------------------------- EXAMPLE 2 --------------------------
```
Export-vROResourceElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133
```

## PARAMETERS

### -Id
The id of the resource element

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
The path of the exported file.
If this parameter is not passed, the resource element
will be exported to the current working directory.

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

