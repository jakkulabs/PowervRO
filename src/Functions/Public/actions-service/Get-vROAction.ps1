function Get-vROAction {
<#
    .SYNOPSIS
    Retrieves a list of all actions

    .DESCRIPTION
    Retrieves a list of all actions

    .PARAMETER Id
    The id of the action

    .PARAMETER Name
    The name of the action
    
    .PARAMETER Category
    The category that the action is in. This must be used with the name parameter

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROAction

    .EXAMPLE
	Get-vROAction -Id f2193849-89e9-4136-8607-526eb196ee4c

    .EXAMPLE
    Get-vROAction -Name Test01 -Category com.company.test    

#>
[CmdletBinding(DefaultParameterSetName="All")][OutputType('System.Management.Automation.PSObject')]

    Param(

        [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true,ParameterSetName="Id")]
        [ValidateNotNullOrEmpty()]
        [String]$Id,

        [Parameter(Mandatory=$true,ParameterSetName="Name")]
        [ValidateNotNullOrEmpty()]
        [String]$Name,

        [Parameter(Mandatory=$true,ParameterSetName="Name")]
        [ValidateNotNullOrEmpty()]
        [String]$Category

    )

    begin {

    }

    process {

        try {

            switch ($PSCmdlet.ParameterSetName) {
                'Id' {

                    $URI = "/vco/api/actions/$($Id)"

                    Write-Verbose -Message "GET : $($URI)"

                    $Response = Invoke-vRORestMethod -Method GET -URI $URI

                    Write-Verbose -Message "SUCCESS"

                    [PSCustomObject]@{

                        Id = $Response.id
                        Name = $Response.name
                        Description = $Response.Description
                        FQN = $Response.fqn
                        Version = $Response.version
                        InputParameters = $Response.'input-parameters'
                        OutputType = $Response.'output-type'
                        Href = $Response.href
                        Relations = $Response.relations

                    }

                    break

                }
                'Name' {

                    $URI = "/vco/api/actions/$($Category)/$Name"

                    $Response = Invoke-vRORestMethod -Method GET -URI $URI -Verbose:$VerbosePreference

                    [PSCustomObject]@{

                        Id = $Response.id
                        Name = $Response.name
                        Description = $Response.Description
                        FQN = $Response.fqn
                        Version = $Response.version
                        InputParameters = $Response."input-parameters"
                        OutputType = $Response."output-type"
                        Href = $Response.href
                        Relations = $Response.relations

                    }

                    break

                }
                'All' {

                    $URI = "/vco/api/actions"
                    
                    $Response = Invoke-vRORestMethod -Method GET -URI $URI -Verbose:$VerbosePreference

                    foreach ($Action in $Response.link) {
                        
                        [PSCustomObject]@{

                            Id = ($Action.attributes | Where-Object {$_.name -eq "id"}).value
                            Name = ($Action.attributes | Where-Object {$_.name -eq "name"}).value
                            Description = ($Action.attributes | Where-Object {$_.name -eq "description"}).value
                            FQN = ($Action.attributes | Where-Object {$_.name -eq "fqn"}).value
                            Version = ($Action.attributes | Where-Object {$_.name -eq "version"}).value
                            InputParameters = $null
                            OutputType = $null
                            Href = $null
                            Relations = $null

                        }                

                    }

                    break

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