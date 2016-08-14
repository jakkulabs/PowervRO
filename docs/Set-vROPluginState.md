# Set-vROPluginState

## SYNOPSIS
    
Sets the state of a vRO plugin

## SYNTAX
 Set-vROPluginState [-Name] <String[]> [-Enabled] <Boolean> [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Sets the state of a vRO plugin

## PARAMETERS


### Name

The name of the plugin

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Enabled

A boolean value to decide whether or not the plugin is enabled

* Required: true
* Position: 2
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

System.String.

## OUTPUTS

None

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Remove-vROPlugin -Name ExamplePlugin -Enabled:$True







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Remove-vROPlugin -Name ExamplePlugin -Enabled:$False
```

