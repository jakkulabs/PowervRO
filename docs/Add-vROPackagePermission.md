# Add-vROPackagePermission

## SYNOPSIS
Add a Permission to a vRO Package

## SYNTAX

```
Add-vROPackagePermission [-Name] <String[]> [-Principal] <String> [-Rights] <String[]> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Add a Permission to a vRO Package

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Add-vROPackagePermission -Name "net.powervro.tests" -Principal vRO_Users@vrademo.local -Rights 'View','Inspect'
```

### -------------------------- EXAMPLE 2 --------------------------
```
$Permissions = Get-vROPackagePermission -Name "net.powervro.tests"
```

Get-vROPackage -Name "net.powervro.tests2" | Add-vROWorkflowPermission -Principal $Permissions\[0\].Principal -Rights $Permissions\[0\].Rights

## PARAMETERS

### -Name
Package Name

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

### -Principal
Specify the Permission Principal.
Needs to be in the format user@domain or domain\user

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

### -Rights
Specify the Permission Rights

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
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

### System.String

## OUTPUTS

### System.Management.Automation.PSObject.

## NOTES

## RELATED LINKS

