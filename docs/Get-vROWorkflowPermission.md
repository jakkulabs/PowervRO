# Get-vROWorkflowPermission

## SYNOPSIS
Get vRO Workflow Permissions

## SYNTAX

```
Get-vROWorkflowPermission [-Id] <String[]>
```

## DESCRIPTION
Get vRO Workflow Permissions

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROWorkflowPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROWorkflow -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROWorkflowPermission
```

## PARAMETERS

### -Id
Workflow Id

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

