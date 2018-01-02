# Import-vROWorkflow

## SYNOPSIS
Import a vRO Workflow from a .workflow file

## SYNTAX

```
Import-vROWorkflow [-CategoryId] <String> [-File] <String[]> [-Overwrite] [-PassThru] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Import a vRO Workflow from a .workflow file

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Import-vROWorkflow -CategoryId "40281e8654ddec6201553af63677146e" -File C:\Workflows\Test01.workflow -Overwrite
```

### -------------------------- EXAMPLE 2 --------------------------
```
Import-vROWorkflow -CategoryId "40281e8654ddec6201553af63677146e" -File C:\Workflows\Test01.workflow -PassThru -Confirm:$false
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-ChildItem -Path C:\Workflows\*.workflow | Import-vROWorkflow -CategoryId "40281e8654ddec6201553af63677146e" -Confirm:$false
```

## PARAMETERS

### -CategoryId
Specify the ID of the vRO Category to import the Workfow to

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -File
Specify the Filename to import from - should be a .workflow file

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Overwrite
Overwrite an existing vRO Workflow

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
If the name of the import file matches the name of the workflow then return imported workflow, e.g.
if Test01.workflow matches a workflow name of Test01

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
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
System.IO.FileInfo
Switch

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES
Thanks to @burkeazbill for a few hints with this one https://github.com/burkeazbill/vroClientScripts

## RELATED LINKS

