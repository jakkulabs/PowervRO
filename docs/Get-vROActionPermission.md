# Get-vROActionPermission

## SYNOPSIS
Get vRO Action Permissions

## SYNTAX

```
Get-vROActionPermission [-Id] <String[]>
```

## DESCRIPTION
Get vRO Action Permissions

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROActionPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROAction -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROActionPermission
```

## PARAMETERS

### -Id
Action Id

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

## INPUTS

### System.String

## OUTPUTS

### System.Management.Automation.PSObject.

## NOTES

## RELATED LINKS

