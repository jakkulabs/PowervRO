function Invoke-vROAction {
<#
    .SYNOPSIS
    Invoke a vRO Action

    .DESCRIPTION
    Invoke a vRO Action

    .PARAMETER Id
    The id of the action requesting an action by id will return additional information

    .PARAMETER Name
    The name of the action
    
    .PARAMETER Category
    The category that the action is in. This must be used with the name parameter

    .PARAMETER Parameters
    The parameters, if any, that the action expects. The input expects an array of New-vROParameterDefinition

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
    $Param1 = New-vROParameterDefinition -Name Location -Value UK -Type String -Scope LOCAL
    Invoke-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 -Parameters $Param1

    .EXAMPLE
    $Param1 = New-vROParameterDefinition -Name Location -Value UK -Type String -Scope LOCAL
    Invoke-vROAction -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133 -Parameters $Param1 | ConvertTo-Json    

    .EXAMPLE
    Invoke-vROACtion -Id 92768e86-d7bc-400d-bb6d-11e6e10eb133

#>
[CmdletBinding(DefaultParameterSetName="Id")][OutputType('System.Management.Automation.PSObject')]

    Param(

        [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true,ParameterSetName="Id")]
        [ValidateNotNullOrEmpty()]
        [String]$Id,

        [Parameter(Mandatory=$true,ParameterSetName="Name")]
        [ValidateNotNullOrEmpty()]
        [String]$Name,

        [Parameter(Mandatory=$true,ParameterSetName="Name")]
        [ValidateNotNullOrEmpty()]
        [String]$Category,

        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject[]]$Parameters

    )

    begin {

    }

    process {

        try {

            switch ($PSCmdlet.ParameterSetName) {

                'Id' {

                    $URI = "/vco/api/actions/$($Id)/executions"

                    break

                }
                'Name' {

                    $URI = "/vco/api/actions/$($Category)/$Name/executions"

                    break

                }

            }

            if ($PSBoundParameters.ContainsKey("Parameters")) {

                $Object = [PSCustomObject]@{

                    parameters = @()

                }

                foreach ($Parameter in $Parameters) {

                    $Object.parameters += $Parameter
                    
                }

                $Body = $Object | ConvertTo-Json -Depth 100

            }
            else {

                $Body = "{}"

            }

            $Response = Invoke-vRORestMethod -Method POST -URI $URI -Body $Body -Verbose:$VerbosePreference

            if ($Response) {

                [PSCustomObject]@{

                    Type = $Response.type
                    Value = $Response.value

                }

            }

        }
        catch [Exception]{
        
            throw
            
        }

    }

    end {

    }

}