# Get-vROResourceElementPermission

## SYNOPSIS
Get vRO Resource Element Permissions

## SYNTAX

```
Get-vROResourceElementPermission [-Id] <String[]>
```

## DESCRIPTION
Get vRO Resource Element Permissions

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROResourceElementPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROResourceElement -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROResourceElementPermission
```

## PARAMETERS

### -Id
Resource Element Id

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

