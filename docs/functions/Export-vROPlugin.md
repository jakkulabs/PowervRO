# Export-vROPlugin

## SYNOPSIS
Exports a plugin.

## SYNTAX

```
Export-vROPlugin [-Name] <String> [[-Path] <String>]
```

## DESCRIPTION
Exports a plugin.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Export-vROPlugin -Name ExamplePlugin
```

### -------------------------- EXAMPLE 2 --------------------------
```
Export-vROPlugin -Name ExamplePlugin -Path C:\plugins
```

## PARAMETERS

### -Name
The name of the plugin

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
If this parameter is not passed, the plugin
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

