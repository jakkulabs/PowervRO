# Invoke-vROWorkflow

## SYNOPSIS
Invoke a vRO Workflow

## SYNTAX

### A (Default)
```
Invoke-vROWorkflow -Id <String> [-ParameterName <String>] [-ParameterValue <String>] [-ParameterType <String>]
```

### B
```
Invoke-vROWorkflow -Id <String> [-Parameters <PSObject[]>]
```

### C
```
Invoke-vROWorkflow [-ParameterName <String>] [-ParameterValue <String>] [-ParameterType <String>]
```

### D
```
Invoke-vROWorkflow [-Parameters <PSObject[]>]
```

## DESCRIPTION
Invoke a vRO Workflow

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Invoke-vROWorkflow -ID c0278910-9ae2-46c5-bb45-2292fe88e3ab
```

### -------------------------- EXAMPLE 2 --------------------------
```
Invoke-vROWorkflow -ID c0278910-9ae2-46c5-bb45-2292fe88e3ab -ParameterName 'text' -ParameterValue 'Apple' -ParameterType 'String'
```

### -------------------------- EXAMPLE 3 --------------------------
```
$Parameters =  @"
```

{"parameters":
\[
    {
        "value": {"string":{ "value": "Apple"}},
        "type": "string",
        "name": "a",
        "scope": "local"
    },
    {
        "value": {"number":{ "value": 20}},
        "type": "number",
        "name": "b",
        "scope": "local"
    }	
\]
}
"@
Invoke-vROWorkflow -ID c0278910-9ae2-46c5-bb45-2292fe88e3ab -Parameters ($Parameters | ConvertFrom-Json).parameters

### -------------------------- EXAMPLE 4 --------------------------
```
$Param1 = New-vROParameterDefinition -Name a -Value Apple -Type String -Scope LOCAL
```

Invoke-vROWorkflow -Id c0278910-9ae2-46c5-bb45-2292fe88e3ab -Parameters $Param1

### -------------------------- EXAMPLE 5 --------------------------
```
Get-vROWorkflow -Name 'Test-Workflow' | Invoke-vROWorkflow -ParameterName a -ParameterValue 'Nature' -ParameterType String
```

## PARAMETERS

### -Id
vRO Workflow Id

```yaml
Type: String
Parameter Sets: A
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: B
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ParameterName
Supply a single parameter to the workflow

```yaml
Type: String
Parameter Sets: A, C
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ParameterValue
Supply the value of the single parameter

```yaml
Type: String
Parameter Sets: A, C
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ParameterType
Supply the type of the single parameter

```yaml
Type: String
Parameter Sets: A, C
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Parameters
Supply workflow parameters via JSON or New-vROParameterDefinition

```yaml
Type: PSObject[]
Parameter Sets: B, D
Aliases: 

Required: False
Position: Named
Default value: None
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

