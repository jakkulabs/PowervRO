# Get-vROPackagePermission

## SYNOPSIS
Get vRO Package Permissions

## SYNTAX

```
Get-vROPackagePermission [-Name] <String[]>
```

## DESCRIPTION
Get vRO Package Permissions

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vROPackagePermission -Name "net.powervro.tests"
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROPackage -Name "net.powervro.tests" | Get-vROPackagePermission
```

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

## INPUTS

### System.String

## OUTPUTS

### System.Management.Automation.PSObject.

## NOTES

## RELATED LINKS

