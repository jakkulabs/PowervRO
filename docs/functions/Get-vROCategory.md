# Get-vROCategory

## SYNOPSIS
Get vRO Categories

## SYNTAX

### All (Default)
```
Get-vROCategory [-Root]
```

### CategoryType
```
Get-vROCategory -CategoryType <String> [-Root]
```

### Id
```
Get-vROCategory -Id <String>
```

## DESCRIPTION
Get vRO Categories

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROCategory
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROCategory -CategoryType Workflow
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-vROCategory -Id '40281e8b555889520155588bc4c10f1c'
```

### -------------------------- EXAMPLE 4 --------------------------
```
Get-vROCategory -CategoryType ResourceElement -Root
```

## PARAMETERS

### -CategoryType
Retrieve Category by CategoryType

```yaml
Type: String
Parameter Sets: CategoryType
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
Retrieve Category by Id

```yaml
Type: String
Parameter Sets: Id
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Root
Retrieve only Categories in the top-level folder root

```yaml
Type: SwitchParameter
Parameter Sets: All, CategoryType
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

