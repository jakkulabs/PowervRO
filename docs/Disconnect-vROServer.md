# Disconnect-vROServer

## SYNOPSIS
    
Disconnect from a vRO server

## SYNTAX
 Disconnect-vROServer [-WhatIf] [-Confirm] [<CommonParameters>]    

## DESCRIPTION

Disconnect from a vRO server by removing the global vRAConnection variable from PowerShell

## PARAMETERS


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
## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Disconnect-vROServer







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Disconnect-vROServer -Confirm:$false
```

