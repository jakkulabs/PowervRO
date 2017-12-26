# Invoke-vROAction

## SYNOPSIS
Invoke a vRO Action

## SYNTAX

### Id (Default)
```
Invoke-vROAction -Id <String> [-Parameters <PSObject[]>]
```

### Name
```
Invoke-vROAction -Name <String> -Category <String> [-Parameters <PSObject[]>]
```

## DESCRIPTION
Invoke a vRO Action

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
$Param1 = New-vROParameterDefinition -Name Location -Value UK -Type String -Scope LOCAL
```

Invoke-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 -Parameters $Param1

### -------------------------- EXAMPLE 2 --------------------------
```
$Param1 = New-vROParameterDefinition -Name Location -Value UK -Type String -Scope LOCAL
```

Invoke-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 -Parameters $Param1 | ConvertTo-Json

### -------------------------- EXAMPLE 3 --------------------------
```
Invoke-vROACtion -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133
```

## PARAMETERS

### -Id
The id of the action requesting an action by id will return additional information

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

### -Parameters
The parameters, if any, that the action expects.
The input expects an array of New-vROParameterDefinition

```yaml
Type: PSObject[]
Parameter Sets: (All)
Aliases: 

Required: False
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

