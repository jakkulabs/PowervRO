function New-vROParameterDefinition {
<#
    .SYNOPSIS
    Create a parameter definition for use with workflows such as Invoke-vROWorkflow and Invoke-vROAction
    
    .DESCRIPTION
    Create a parameter definition for use with workflows such as Invoke-vROWorkflow and Invoke-vROAction

    .PARAMETER Name
    Name of the workflow or action parameter

    .PARAMETER Value
    Value of the workflow or action parameter

    .PARAMETER Type
    Type of the workflow or action parameter
    
    .PARAMETER Scope
    Scope of the workflow or action parameter

    .INPUTS
    System.String.

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    $Param1 = New-vROParameterDefinition -Name a -Value Apple -Type String -Scope LOCAL
    Invoke-vROWorkflow -Id c0278910-9ae2-46c5-bb45-2292fe88e3ab -Parameters $Param1

    .EXAMPLE
    $Param1 = New-vROParameterDefinition -Name Location -Value UK -Type String -Scope LOCAL
    Invoke-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 -Parameters $Param1
#>
[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact="Low")][OutputType('System.Management.Automation.PSObject')]

    Param (

    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Name,

    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Value,

    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Type,
    
    [parameter(Mandatory=$false)]
    [ValidateSet("LOCAL", "TOKEN")]
    [String]$Scope = "LOCAL"

    )    

    begin {
    
    }
    
    process {

        try {

            if ($PSCmdlet.ShouldProcess("WorkflowParameterDefinition")){

                # --- Define object
                $ParameterDefinition = @"
        
                    {
                        "name": "$($Name)",
                        "type": "$($Type.ToLower())",
                        "scope": "$($Scope.ToLower())",
                        "value": {
                            "$($Type.ToLower())":{ "value": "$($Value)"}
                        }
                    }
"@
            
                $ParameterDefinition | ConvertFrom-Json

            }

        }
        catch [Exception]{

            throw

        }

    }
    end {
        
    }

}