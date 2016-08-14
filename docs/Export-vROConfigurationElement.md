# Export-vROConfigurationElement

## SYNOPSIS
    
Exports a configuration element by its ID.

## SYNTAX
 Export-vROConfigurationElement [-Id] <String> [[-Path] <String>] [<CommonParameters>]    

## DESCRIPTION

Exports a configuration element by its ID.

## PARAMETERS


### Id

The id of the action

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Path

The path of the exported file. If this parameter is not passed, the resource element
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

PS C:\>Get-vROConfigurationElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 | Export-vROConfigurationElement -Path 
C:\Configurations







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Export-vROConfigurationElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133
```

