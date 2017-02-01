function Get-vROPlugin {
<#
    .SYNOPSIS
    Retrieves a list of all installed plugins

    .DESCRIPTION
    Retrieves a list of all installed plugins

    .INPUTS
    None.

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROPlugin

#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param()

    begin {

    }

    process {

        try {

            $URI = "/vco/api/plugins"

            $Response = Invoke-vRORestMethod -Method GET -URI $URI -Verbose:$VerbosePreference

            foreach ($Item in $Response.plugin) {

                [PSCustomObject]@{

                    Name = $Item.moduleName
                    DisplayName = $Item.displayName
                    Enabled = $Item.enabled
                    URL = $Item.url
                    Version = $Item.version
                    BuildNumber = $Item.buildNumber
                    InfoText = $Item.infoText
                    HasValidation = $Item.hasValidation
                    Configurable = $Item.configurable
                    HasInstallActions = $Item.hasInstallActions

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