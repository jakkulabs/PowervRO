# Get-vROWorkflowExecution

## SYNOPSIS
Get vRO Workflow Executions

## SYNTAX

### Name (Default)
```
Get-vROWorkflowExecution -Name <String>
```

### Id
```
Get-vROWorkflowExecution -Id <String>
```

## DESCRIPTION
Get vRO Workflow Executions

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROWorkflowExecution -Id xxxxxxxxxxxxxxxxxxxxxx
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROWorkflowExecution -Name 'Test01'
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-vROWorkflow -Name 'Test01' | Get-vROWorkflowExecution
```

## PARAMETERS

### -Id
Retrieve workflow by Id

```yaml
Type: String
Parameter Sets: Id
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
Retrieve workflow by Name

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

