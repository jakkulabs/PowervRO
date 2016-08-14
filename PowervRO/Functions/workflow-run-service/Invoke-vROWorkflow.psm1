function Invoke-vROWorkflow {
<#
    .SYNOPSIS
    Invoke a vRO Workflow

    .DESCRIPTION
    Invoke a vRO Workflow

    .PARAMETER ID
    vRO Workflow ID

    .PARAMETER ItemHref
    vRO ItemHref

    .PARAMETER ParameterName
    Supply a single parameter to the workflow

    .PARAMETER ParameterValue
    Supply the value of the single parameter

    .PARAMETER ParameterType
    Supply the type of the single parameter

    .PARAMETER Parameters
    Supply workflow parameters via JSON or New-vROParameterDefinition

    .PARAMETER NoParameters
    Required when using ItemHref and supplying no parameters

    .INPUTS
    System.String
    System.Switch

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Invoke-vROWorkflow -ID c0278910-9ae2-46c5-bb45-2292fe88e3ab

    .EXAMPLE
	Invoke-vROWorkflow -ItemHref https://vRO01.vrademo.local:8281/vco/api/workflows/c0278910-9ae2-46c5-bb45-2292fe88e3ab/

    .EXAMPLE
	Invoke-vROWorkflow -ID c0278910-9ae2-46c5-bb45-2292fe88e3ab -ParameterName 'text' -ParameterValue 'Apple' -ParameterType 'String'

    .EXAMPLE
    $Parameters =  @"
{"parameters":
	[
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
	]
}
"@
	Invoke-vROWorkflow -ID c0278910-9ae2-46c5-bb45-2292fe88e3ab -Parameters ($Parameters | ConvertFrom-Json).parameters

    .EXAMPLE
    $Param1 = New-vROParameterDefinition -Name a -Value Apple -Type String -Scope LOCAL
    Invoke-vROWorkflow -Id c0278910-9ae2-46c5-bb45-2292fe88e3ab -Parameters $Param1

    .EXAMPLE
    Get-vROWorkflow -Name 'Test-Workflow' | Invoke-vROWorkflow -ParameterName a -ParameterValue 'Nature' -ParameterType String

    .EXAMPLE
    Get-vROWorkflow -Name 'Test-Workflow' | Select ItemHref | Invoke-vROWorkflow -ParameterName a -ParameterValue 'Junior' -ParameterType String
#>
[CmdletBinding(DefaultParametersetName="A")][OutputType('System.Management.Automation.PSObject')]

    Param
    (   
    
    [parameter(Mandatory=$true,ValueFromPipelinebyPropertyName=$true,ParameterSetName="A")]
    [parameter(Mandatory=$true,ParameterSetName="B")]
    [ValidateNotNullOrEmpty()]
    [String]$ID,

    [parameter(Mandatory=$true,ValueFromPipelinebyPropertyName=$true,ParameterSetName="C")]
    [parameter(Mandatory=$true,ValueFromPipelinebyPropertyName=$true,ParameterSetName="D")]
    [parameter(Mandatory=$true,ValueFromPipelinebyPropertyName=$true,ParameterSetName="E")]
    [ValidateNotNullOrEmpty()]
    [String]$ItemHref,

    [parameter(Mandatory=$false,ParameterSetName="A")]
    [parameter(ParameterSetName="C")]
    [ValidateNotNullOrEmpty()]
    [String]$ParameterName,

    [parameter(Mandatory=$false,ParameterSetName="A")]
    [parameter(ParameterSetName="C")]
    [String]$ParameterValue,

    [parameter(Mandatory=$false,ParameterSetName="A")]
    [parameter(ParameterSetName="C")]
    [ValidateNotNullOrEmpty()]
    [String]$ParameterType,

    [parameter(Mandatory=$false,ParameterSetName="B")]
    [parameter(ParameterSetName="D")]
    [ValidateNotNullOrEmpty()]
    [PSCustomObject[]]$Parameters,

    [parameter(Mandatory=$false,ParameterSetName="E")]
    [ValidateNotNullOrEmpty()]
    [Switch]$NoParameters
    )

    try {

        if ($PSBoundParameters.ContainsKey('ParameterType')){

            $ParameterType = $ParameterType.ToLower()

            $Body = @"
{"parameters":
	[
        {
            "value": {"$($ParameterType)":{ "value": "$($ParameterValue)"}},
            "type": "$($ParameterType)",
            "name": "$($ParameterName)",
            "scope": "local"
        }	
	]
}
"@
        }

        elseif ($PSBoundParameters.ContainsKey('Parameters')){

            $Object = [PSCustomObject]@{

                parameters = @()

            }

            foreach ($Parameter in $Parameters) {

                $Object.parameters += $Parameter
                    
            }

            $Body = $Object | ConvertTo-Json -Depth 100
        }

        else { 
          
            $Body = @"
{"parameters":
	[
	
	]
}
"@                  
        }

        if ($PSBoundParameters.ContainsKey('ItemHref')){

            $URI = ("$($ItemHref)executions/" -split "8281")[1]
        }
        else {

            $URI = "/vco/api/workflows/$($ID)/executions/"
        }

        $InvokeRequest = Invoke-vRORestMethod -Method POST -URI $URI -Body $Body -WebRequest -Verbose:$VerbosePreference                 
        
        [pscustomobject]@{
                    
            StatusCode = $InvokeRequest.StatusCode
            StatusDescription = $InvokeRequest.StatusDescription
            Execution = $InvokeRequest.Headers.Location
        }
    }
    catch [Exception]{
        
        throw
    }
}