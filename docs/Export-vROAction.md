# Export-vROAction

## SYNOPSIS
    
Exports an action by its ID.

## SYNTAX
 Export-vROAction [-Id] <String> [[-Path] <String>] [<CommonParameters>]    

## DESCRIPTION

Exports an action by its ID.

## PARAMETERS


### Id

The id of the action

* Required: true
* Position: 1
* Default value: 
* Accept pipeline input: true (ByValue, ByPropertyName)

### Path

The resulting path. If this parameter is not passed the action will be exported to
the current working directory.

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

PS C:\>Get-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 | Export-vROAction -File C:\Actions\Test01.action







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROAction -Name Test01 -Category com.company.test | Export-vROAction
```

