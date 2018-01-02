# Invoke-vRORestMethod

## SYNOPSIS
Wrapper for Invoke-RestMethod with vRO specifics

## SYNTAX

```
Invoke-vRORestMethod [-Method] <String> [-URI] <String> [[-Body] <Object>] [-WebRequest]
 [[-Headers] <IDictionary>] [[-OutFile] <String>]
```

## DESCRIPTION
Wrapper for Invoke-RestMethod with vRO specifics

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Invoke-vRORestMethod -Method GET -URI '/vco/api/workflows'
```

### -------------------------- EXAMPLE 2 --------------------------
```
$URI = "/vco/api/workflows/$($ID)/executions/"
```

$JSON =  @"
{"parameters":
\[
    {
        "value": {"string":{ "value": "Apple"}},
        "type": "string",
        "name": "a",
        "scope": "local"
    },
    {
        "value": {"number":{ "value": 20}},
        "type": "number",
        "name": "b",
        "scope": "local"
    }
\]
}
"@
$InvokeRequest = Invoke-vRORestMethod -Method POST -URI $URI -Body $Body -WebRequest

## PARAMETERS

### -Method
REST Method: GET, POST, PUT or DELETE

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -URI
API URI, e.g.
/vco/api/workflows

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
REST Body in JSON format

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WebRequest
Use Invoke-WebRequest instead of Invoke-RestMethod

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

### -Headers
Optionally supply custom headers

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutFile
Saves the response body in the specified output file

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String
System.Collections.IDictionary
Switch

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

