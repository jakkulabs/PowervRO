# Connect-vROServer

## SYNOPSIS
Connect to a vRO Server

## SYNTAX

### Username (Default)
```
Connect-vROServer -Server <String> [-Port <Int32>] -Username <String> -Password <SecureString>
 [-IgnoreCertRequirements] [-SslProtocol <String>]
```

### Credential
```
Connect-vROServer -Server <String> [-Port <Int32>] -Credential <PSCredential> [-IgnoreCertRequirements]
 [-SslProtocol <String>]
```

## DESCRIPTION
Connect to a vRO Server and generate a connection object with Servername, Token etc

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Connect-vROServer -Server vro01.domain.local -Credential (Get-Credential)
```

### -------------------------- EXAMPLE 2 --------------------------
```
$SecurePassword = ConvertTo-SecureString "P@ssword" -AsPlainText -Force
```

Connect-vROServer -Server vro01.domain.local -Username TenantAdmin01 -Password $SecurePassword -IgnoreCertRequirements

### -------------------------- EXAMPLE 3 --------------------------
```
Connect-vROServer -Server vro01.domain.local -Port 443 -Credential (Get-Credential)
```

## PARAMETERS

### -Server
vRO Server to connect to

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Port
Optionally specify the server port.
Default is 8281

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 8281
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
Username to connect with

```yaml
Type: String
Parameter Sets: Username
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Password to connect with

```yaml
Type: SecureString
Parameter Sets: Username
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Credential object to connect with

```yaml
Type: PSCredential
Parameter Sets: Credential
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IgnoreCertRequirements
Ignore requirements to use fully signed certificates

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SslProtocol
Alternative Ssl protocol to use from the default
Requires vRA 7.x and above
Windows PowerShell: Ssl3, Tls, Tls11, Tls12
PowerShell Core: Tls, Tls11, Tls12

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String
System.SecureString
Management.Automation.PSCredential
Switch

## OUTPUTS

### System.Management.Automation.PSObject.

## NOTES

## RELATED LINKS

