# Add-vROCategoryPermission

## SYNOPSIS
Add a Permission to a vRO Category

## SYNTAX

```
Add-vROCategoryPermission [-Id] <String[]> [-Principal] <String> [-Rights] <String[]> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Add a Permission to a vRO Category

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Add-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e' -Principal vRO_Users@vrademo.local -Rights 'View','Execute','Inspect'
```

### -------------------------- EXAMPLE 2 --------------------------
```
$Permissions = Get-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e'
```

Get-vROCategory -Id '40281e8654ddec6201554f5836651514' | Add-vROCategoryPermission -Principal $Permissions\[0\].Principal -Rights $Permissions\[0\].Rights

## PARAMETERS

### -Id
Category Id

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

