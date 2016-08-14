# Export-vROWorkflowSchema

## SYNOPSIS
    
Export a vRO Workflow Schema as a PNG file

## SYNTAX
 Export-vROWorkflowSchema [-Id] <String> [-File] <String> [<CommonParameters>]    

## DESCRIPTION

Export a vRO Workflow Schema as a PNG file

## PARAMETERS


### Id

Specify the ID of the vRO Workfow

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### File

Specify the Filename to export to - should be a PNG file

* Required: true
* Position: 2
* Default value: 
* Accept pipeline input: false

## INPUTS

System.String

## OUTPUTS

System.IO.FileInfo

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Export-vROWorkflowSchema -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea" -File C:\Schemata\Test01.png







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROWorkflow -Name Test01 | Export-vROWorkflowSchema -File C:\Schemata\Test01.png
```

