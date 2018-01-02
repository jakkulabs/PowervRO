# New-vROParameterDefinition

## SYNOPSIS
Create a parameter definition for use with workflows such as Invoke-vROWorkflow and Invoke-vROAction

## SYNTAX

```
New-vROParameterDefinition [-Name] <String> [-Value] <String> [-Type] <String> [[-Scope] <String>] [-WhatIf]
 [-Confirm]
```

## DESCRIPTION
Create a parameter definition for use with workflows such as Invoke-vROWorkflow and Invoke-vROAction

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$Param1 = New-vROParameterDefinition -Name a -Value Apple -Type String -Scope LOCAL
```

Invoke-vROWorkflow -Id c0278910-9ae2-46c5-bb45-2292fe88e3ab -Parameters $Param1

### -------------------------- EXAMPLE 2 --------------------------
```
$Param1 = New-vROParameterDefinition -Name Location -Value UK -Type String -Scope LOCAL
```

Invoke-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 -Parameters $Param1

## PARAMETERS

### -Name
Name of the workflow or action parameter

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
Value of the workflow or action parameter

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
Type of the workflow or action parameter

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
Scope of the workflow or action parameter

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: LOCAL
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String.

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

