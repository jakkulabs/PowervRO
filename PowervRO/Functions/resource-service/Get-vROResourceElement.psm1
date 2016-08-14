function Get-vROResourceElement {
<#
    .SYNOPSIS
    Retrieves a list of all resource elements

    .DESCRIPTION
    Retrieves a list of all resource elements

    .PARAMETER Id
    The id of the resource element

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROResourceElement

    .EXAMPLE
	Get-vROResourceElement -Id f2193849-89e9-4136-8607-526eb196ee4c

#>
[CmdletBinding(DefaultParameterSetName="All")][OutputType('System.Management.Automation.PSObject')]

    Param(

        [parameter(Mandatory=$true,ValueFromPipeline=$true,ParameterSetName="Id")]
        [ValidateNotNullOrEmpty()]
        [String[]]$Id

    )

    begin {

    }

    process {

        try {

            switch ($PSCmdlet.ParameterSetName) {

                'Id' {

                    foreach ($ResourceId in $Id) {

                        $Response = Invoke-vRORestMethod -Method Get -URI "/vco/api/resources/$($ResourceId)" -Verbose:$VerbosePreference
                        
                        [PSCustomObject]@{

                            Id = $Response.id
                            Name = $Response.name
                            Description = $Response.description
                            Version = $Response.version
                            MimeType = $Response."mime-type"
                            Href = $Response.href

                        }                        

                    }

                    break

                }
                'All' {

                    $URI = "/vco/api/resources"

                    $Response = Invoke-vRORestMethod -Method GET -URI $URI -Verbose:$VerbosePreference

                    foreach ($Item in $Response.link) {

                        [PSCustomObject]@{

                            Id = ($Item.attributes | Where-Object {$_.Name -eq "id"}).value
                            Name = ($Item.attributes | Where-Object {$_.Name -eq "name"}).value
                            Description = ($Item.attributes | Where-Object {$_.Name -eq "description"}).value
                            Version = ($Item.attributes | Where-Object {$_.Name -eq "version"}).value
                            MimeType = ($Item.attributes | Where-Object {$_.Name -eq "mime-type"}).value
                            Href = $Item.href

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