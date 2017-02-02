# Export-vROWorkflow

## SYNOPSIS
Export a vRO Workflow to a .workflow file

## SYNTAX

```
Export-vROWorkflow [-Id] <String> [-File] <String>
```

## DESCRIPTION
Export a vRO Workflow to a .workflow file

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Export-vROWorkflow -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea" -File C:\Workflows\Test01.workflow
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROWorkflow -Name Test01 | Export-vROWorkflow -File C:\Workflows\Test01.workflow
```

## PARAMETERS

### -Id
Specify the ID of the vRO Workfow

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -File
Specify the Filename to export to - should be a .workflow file

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

## INPUTS

### System.String

## OUTPUTS

### System.IO.FileInfo

## NOTES
Thanks to @burkeazbill for a few hints with this one https://github.com/burkeazbill/vroClientScripts

## RELATED LINKS

