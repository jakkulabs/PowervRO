# Get-vROWorkflowExecutionState

## SYNOPSIS
Get vRO Workflow Execution State

## SYNTAX

```
Get-vROWorkflowExecutionState [-ExecutionStateRef] <String>
```

## DESCRIPTION
Get vRO Workflow Execution State

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROWorkflowExecutionState -ExecutionStateRef '/vco/api/workflows/565b2c35-3607-4ab9-ace7-9102c1391808/executions/402880244ae8e2a6014b045ea9290213'
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROWorkflowExecution -Id 3f92d2dc-a9fa-4323-900b-ef97196184ea | Select-Object -Last 1 | Get-vROWorkflowExecutionState
```

## PARAMETERS

### -ExecutionStateRef
vRO Workflow Execution Reference

```yaml
Type: String
Parameter Sets: (All)
Aliases: Execution

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

