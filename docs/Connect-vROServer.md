# Connect-vROServer

## SYNOPSIS
    
Connect to a vRO Server

## SYNTAX
 Connect-vROServer -Server <String> [-Port <Int32>] -Username <String> -Password <String> [-IgnoreCertRequirements]  [<CommonParameters>] Connect-vROServer -Server <String> [-Port <Int32>] -Credential <PSCredential> [-IgnoreCertRequirements]  [<CommonParameters>]    

## DESCRIPTION

Connect to a vRO Server and generate a connection object with Servername, Token etc

## PARAMETERS


### Server

vRO Server to connect to

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

### Port

Optionally specify the server port. Default is 8281

* Required: false
* Position: named
* Default value: 8281
* Accept pipeline input: false

### Username

Username to connect with

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

### Password

Password to connect with

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

### Credential

Credential object to connect with

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

### IgnoreCertRequirements

Ignore requirements to use fully signed certificates

* Required: false
* Position: named
* Default value: False
* Accept pipeline input: false

## INPUTS

System.String
Management.Automation.PSCredential
Switch

## OUTPUTS

System.Management.Automation.PSObject.

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

PS C:\>Connect-vROServer -Server vro01.domain.local -Username TenantAdmin01 -Password P@ssword -IgnoreCertRequirements







-------------------------- EXAMPLE 2 --------------------------

PS C:\>Connect-vROServer -Server vro01.domain.local -Credential (Get-Credential)







-------------------------- EXAMPLE 3 --------------------------

PS C:\>Connect-vROServer -Server vro01.domain.local -Port 443 -Credential (Get-Credential)
```

