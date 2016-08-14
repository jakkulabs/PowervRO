# Get-vROConfigurationElement

## SYNOPSIS
    
Retrieves a list of all configuration elements

## SYNTAX
 Get-vROConfigurationElement [-WithAttributes] [<CommonParameters>] Get-vROConfigurationElement -Id <String[]> [<CommonParameters>]    

## DESCRIPTION

Retrieves a list of all configuration elements

## PARAMETERS


### Id

The id of the configuration elements

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: true (ByValue)

### WithAttributes

By default when listing all configuration elements attributes are not returned.
Using this parameter will return attributes for each configuration element found. It
could potentially be an expensive operation depending on the number of elements returned.

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

## INPUTS

System.String
System.Switch

## OUTPUTS

System.Management.Automation.PSObject.

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Get-vROConfigurationElement







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Get-vROConfigurationElement -Id f2193849-89e9-4136-8607-526eb196ee4c
```

