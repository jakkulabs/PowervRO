# Export-vROPlugin

## SYNOPSIS
    
Exports a plugin.

## SYNTAX
 Export-vROPlugin [-Name] <String> [[-Path] <String>] [<CommonParameters>]    

## DESCRIPTION

Exports a plugin.

## PARAMETERS


### Name

The name of the plugin

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Path

The path of the exported file. If this parameter is not passed, the plugin
will be exported to the current working directory.

* Required: false
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

PS C:\>Export-vROPlugin -Name ExamplePlugin







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Export-vROPlugin -Name ExamplePlugin -Path C:\plugins
```

