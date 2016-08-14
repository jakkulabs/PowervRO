# Import-vROWorkflow

## SYNOPSIS
    
Import a vRO Workflow from a .workflow file

## SYNTAX
 Import-vROWorkflow [-CategoryId] <String> [-File] <String[]> [-Overwrite] [-PassThru] [-WhatIf] [-Confirm]  [<CommonParameters>]    

## DESCRIPTION

Import a vRO Workflow from a .workflow file

## PARAMETERS


### CategoryId

Specify the ID of the vRO Category to import the Workfow to

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: false

### File

Specify the Filename to import from - should be a .workflow file

* Required: true
* Position: 2
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Overwrite

Overwrite an existing vRO Workflow

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

### PassThru

If the name of the import file matches the name of the workflow then return imported workflow, e.g. if Test01.workflow 
matches a workflow name of Test01

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

### WhatIf


* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

### Confirm


* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

## INPUTS

System.String
System.IO.FileInfo
Switch

## OUTPUTS

System.Management.Automation.PSObject

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Import-vROWorkflow -CategoryId "40281e8654ddec6201553af63677146e" -File C:\Workflows\Test01.workflow -Overwrite







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Import-vROWorkflow -CategoryId "40281e8654ddec6201553af63677146e" -File C:\Workflows\Test01.workflow -PassThru 
-Confirm:$false







-------------------------- EXAMPLE 3 --------------------------

PS C:\>Get-ChildItem -Path C:\Workflows\*.workflow | Import-vROWorkflow -CategoryId "40281e8654ddec6201553af63677146e" 
-Confirm:$false
```

