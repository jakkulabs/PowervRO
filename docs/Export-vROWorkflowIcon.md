# Export-vROWorkflowIcon

## SYNOPSIS
Export a vRO Workflow Icon as a PNG file

## SYNTAX

```
Export-vROWorkflowIcon [-Id] <String> [-File] <String>
```

## DESCRIPTION
Export a vRO Workflow Icon as a PNG file

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Export-vROWorkflowIcon -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea" -File C:\Icons\Test01.png
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vROWorkflow -Name Test01 | Export-vROWorkflowIcon -File C:\Icons\Test01.png
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
Specify the Filename to export to - should be a PNG file

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

## RELATED LINKS

