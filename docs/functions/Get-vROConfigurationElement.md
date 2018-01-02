# Get-vROConfigurationElement

## SYNOPSIS
Retrieves a list of all configuration elements

## SYNTAX

### All (Default)
```
Get-vROConfigurationElement [-WithAttributes]
```

### Id
```
Get-vROConfigurationElement -Id <String[]>
```

## DESCRIPTION
Retrieves a list of all configuration elements

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROConfigurationElement
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROConfigurationElement -Id f2193849-89e9-4136-8607-526eb196ee4c
```

## PARAMETERS

### -Id
The id of the configuration elements

```yaml
Type: String[]
Parameter Sets: Id
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -WithAttributes
By default when listing all configuration elements attributes are not returned.
Using this parameter will return attributes for each configuration element found.
It
could potentially be an expensive operation depending on the number of elements returned.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String
System.Switch

## OUTPUTS

### System.Management.Automation.PSObject.

## NOTES

## RELATED LINKS

