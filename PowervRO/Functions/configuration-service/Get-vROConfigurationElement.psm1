function Get-vROConfigurationElement {
<#
    .SYNOPSIS
    Retrieves a list of all configuration elements

    .DESCRIPTION
    Retrieves a list of all configuration elements

    .PARAMETER Id
    The id of the configuration elements

    .PARAMETER WithAttributes
    By default when listing all configuration elements attributes are not returned.
    Using this parameter will return attributes for each configuration element found. It
    could potentially be an expensive operation depending on the number of elements returned.

    .INPUTS
    System.String
    System.Switch

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROConfigurationElement

    .EXAMPLE
	Get-vROConfigurationElement -Id f2193849-89e9-4136-8607-526eb196ee4c

#>
[CmdletBinding(DefaultParameterSetName="All")][OutputType('System.Management.Automation.PSObject')]

    Param(

        [parameter(Mandatory=$true,ValueFromPipeline=$true,ParameterSetName="Id")]
        [ValidateNotNullOrEmpty()]
        [String[]]$Id,

        [Parameter(Mandatory=$false,ParameterSetName="All")]
        [Switch]$WithAttributes

    )

    begin {

    }

    process {

        try {

            switch ($PSCmdlet.ParameterSetName) {

                'Id' {

                    foreach ($ConfigurationId in $Id) {

                        $Response = Invoke-vRORestMethod -Method Get -URI "/vco/api/configurations/$($ConfigurationId)" -Verbose:$VerbosePreference
                        
                        [PSCustomObject]@{

                            Id = $Response.id
                            Name = $Response.name
                            Description = $Response.description
                            Version = $Response.version
                            Attributes = $Response.attributes
                            Href = $Response.href

                        }                        

                    }

                    break

                }
                'All' {

                    $URI = "/vco/api/configurations"

                    $Response = Invoke-vRORestMethod -Method GET -URI $URI -Verbose:$VerbosePreference

                    if ($WithAttributes) {

                        foreach ($Item in $Response.link) {

                            [URI]$Href = $Item.href
                            $Id = $Href.Segments[-1].Trim("/")
                            
                            getConfiguration($Id)

                        }

                    }
                    else {

                        foreach ($Item in $Response.link) {

                            [PSCustomObject]@{

                                Id = ($Item.attributes | Where-Object {$_.Name -eq "id"}).value
                                Name = ($Item.attributes | Where-Object {$_.Name -eq "name"}).value
                                Description = ($Item.attributes | Where-Object {$_.Name -eq "description"}).value
                                Version = ($Item.attributes | Where-Object {$_.Name -eq "version"}).value
                                Attributes = $null
                                Href = $Item.href

                            }

                        }

                    }

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

function getConfiguration($Id){
<#
    Private function for retrieving configurations elements
#>    

    $Response = Invoke-vRORestMethod -Method Get -URI "/vco/api/configurations/$($Id)" -Verbose:$VerbosePreference

    $Object = [PSCustomObject]@{

        Id = $Response.id
        Name = $Response.name
        Description = $Response.description
        Version = $Response.version
        Attributes = $Response.attributes
        Href = $Response.href

    }

    return $Object

}