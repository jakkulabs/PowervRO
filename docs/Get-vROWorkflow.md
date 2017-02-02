# Get-vROWorkflow

## SYNOPSIS
Get vRO Workflows

## SYNTAX

### All (Default)
```
Get-vROWorkflow
```

### Category
```
Get-vROWorkflow [-Category <String>]
```

### Id
```
Get-vROWorkflow [-Id <String>]
```

### Name
```
Get-vROWorkflow [-Name <String>] [-Wildcard]
```

## DESCRIPTION
Get vRO Workflows

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROWorkflow
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROWorkflow -Category Dev
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-vROWorkflow -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'
```

### -------------------------- EXAMPLE 4 --------------------------
```
Get-vROWorkflow -Name 'New-DRSRule'
```

### -------------------------- EXAMPLE 5 --------------------------
```
Get-vROWorkflow -Name 'New' -Wildcard
```

## PARAMETERS

### -Category
Retrieve workflow by Category

```yaml
Type: String
Parameter Sets: Category
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
Retrieve workflow by Id

```yaml
Type: String
Parameter Sets: Id
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Retrieve workflow by Name

```yaml
Type: String
Parameter Sets: Name
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Wildcard
Perform a wildcard search when using the Name parameter

```yaml
Type: SwitchParameter
Parameter Sets: Name
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

