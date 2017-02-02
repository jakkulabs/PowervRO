# New-vROCategory

## SYNOPSIS
Create a vRO Category

## SYNTAX

### JSON (Default)
```
New-vROCategory [-CategoryId <String>] -JSON <String> [-WhatIf] [-Confirm]
```

### Standard
```
New-vROCategory -Name <String> [-Description <String>] -CategoryType <String> [-CategoryId <String>] [-WhatIf]
 [-Confirm]
```

## DESCRIPTION
Create a vRO Category

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
New-vROCategory -Name Category01 -Description "This is Category01" -CategoryType WorkflowCategory
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROCategory -Id '40281e8654ddec6201553af63677146e' | New-vROCategory -Name "Category01" -Description "This is Category01"
```

### -------------------------- EXAMPLE 3 --------------------------
```
$JSON = @"
```

{  
   "type":"WorkflowCategory",  
   "name":"Category01",  
   "description":"This is Category01"  
}  
"@
$JSON | New-vROCategory -CategoryId "40281e8654ddec6201553af63677146e"

## PARAMETERS

### -Name
Category Name

```yaml
Type: String
Parameter Sets: Standard
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Category Description

```yaml
Type: String
Parameter Sets: Standard
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CategoryType
CategoryType

```yaml
Type: String
Parameter Sets: Standard
Aliases: Type

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -CategoryId
Id of the Category to create the new Category in - default is the root Category

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -JSON
Body text to send in JSON format

```yaml
Type: String
Parameter Sets: JSON
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
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

