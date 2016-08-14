# Add-vROWorkflowPermission

## SYNOPSIS
    
Add a Permission to a vRO Workflow

## SYNTAX
 Add-vROWorkflowPermission [-Id] <String[]> [-Principal] <String> [-Rights] <String[]> [-WhatIf] [-Confirm]  [<CommonParameters>]    

## DESCRIPTION

Add a Permission to a vRO Workflow

## PARAMETERS


### Id

Workflow Id

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Principal

Specify the Permission Principal. Needs to be in the format user@domain or domain\user

* Required: true
* Position: 2
* Default value: 
* Accept pipeline input: false

### Rights

Specify the Permission Rights

* Required: true
* Position: 3
* Default value: 
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

## OUTPUTS

System.Management.Automation.PSObject.

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Add-vROWorkflowPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' -Principal vRO_Users@vrademo.local -Rights 
'View','Execute','Inspect'







-------------------------- EXAMPLE 2 --------------------------

PS C:\>$Permissions = Get-vROWorkflowPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'


Get-vROWorkflow -Id '5af6c1fd-3d12-4418-8542-0afad165cc08' | Add-vROWorkflowPermission -Principal 
$Permissions[0].Principal -Rights $Permissions[0].Rights
```

