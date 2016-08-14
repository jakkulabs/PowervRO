# New-vROCategory

## SYNOPSIS
    
Create a vRO Category

## SYNTAX
 New-vROCategory [-CategoryId <String>] -JSON <String> [-WhatIf] [-Confirm] [<CommonParameters>] New-vROCategory -Name <String> [-Description <String>] -CategoryType <String> [-CategoryId <String>] [-WhatIf]  [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Create a vRO Category

## PARAMETERS


### Name

Category Name

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

### Description

Category Description

* Required: false
* Position: named
* Default value: 
* Accept pipeline input: false

### CategoryType

CategoryType

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: true (ByPropertyName)

### CategoryId

Id of the Category to create the new Category in - default is the root Category

* Required: false
* Position: named
* Default value: 
* Accept pipeline input: true (ByPropertyName)

### JSON

Body text to send in JSON format

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: true (ByValue)

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

System.String.

## OUTPUTS

System.Management.Automation.PSObject

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>New-vROCategory -Name Category01 -Description "This is Category01" -CategoryType WorkflowCategory







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROCategory -Id '40281e8654ddec6201553af63677146e' | New-vROCategory -Name "Category01" -Description "This 
is Category01"







-------------------------- EXAMPLE 3 --------------------------

PS C:\>$JSON = @"


{  
   "type":"WorkflowCategory",  
   "name":"Category01",  
   "description":"This is Category01"  
}  
"@
$JSON | New-vROCategory -CategoryId "40281e8654ddec6201553af63677146e"
```

