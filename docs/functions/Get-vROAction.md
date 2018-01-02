# Get-vROAction

## SYNOPSIS
Retrieves a list of all actions

## SYNTAX

### All (Default)
```
Get-vROAction
```

### Id
```
Get-vROAction -Id <String>
```

### Name
```
Get-vROAction -Name <String> -Category <String>
```

## DESCRIPTION
Retrieves a list of all actions

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROAction
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROAction -Id f2193849-89e9-4136-8607-526eb196ee4c
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-vROAction -Name Test01 -Category com.company.test
```

## PARAMETERS

### -Id
The id of the action

```yaml
Type: String
Parameter Sets: Id
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Name
The name of the action

```yaml
Type: String
Parameter Sets: Name
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
The category that the action is in.
This must be used with the name parameter

```yaml
Type: String
Parameter Sets: Name
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String

## OUTPUTS

### System.Management.Automation.PSObject.

## NOTES

## RELATED LINKS

