# Get-vROCategoryPermission

## SYNOPSIS
Get vRO Category Permissions

## SYNTAX

```
Get-vROCategoryPermission [-Id] <String[]>
```

## DESCRIPTION
Get vRO Category Permissions

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e'
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROCategory -Id '40281e8654ddec6201553af63677146e' | Get-vROCategoryPermission
```

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

## INPUTS

### System.String

## OUTPUTS

### System.Management.Automation.PSObject.

## NOTES

## RELATED LINKS

