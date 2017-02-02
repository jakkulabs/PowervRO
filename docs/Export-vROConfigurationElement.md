# Export-vROConfigurationElement

## SYNOPSIS
Exports a configuration element by its ID.

## SYNTAX

```
Export-vROConfigurationElement [-Id] <String> [[-Path] <String>]
```

## DESCRIPTION
Exports a configuration element by its ID.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROConfigurationElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 | Export-vROConfigurationElement -Path C:\Configurations
```

### -------------------------- EXAMPLE 2 --------------------------
```
Export-vROConfigurationElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133
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

