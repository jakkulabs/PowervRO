# Export-vROResourceElement

## SYNOPSIS
    
Exports a resource element by its ID.

## SYNTAX
 Export-vROResourceElement [-Id] <String> [[-Path] <String>] [<CommonParameters>]    

## DESCRIPTION

Exports a resource element by its ID.

## PARAMETERS


### Id

The id of the resource element

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

PS C:\>Get-vROResourceElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 | Export-vROResourceElement -Path C:\Resources







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Export-vROResourceElement -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133
```

