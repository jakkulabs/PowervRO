function Get-vROAPIEndpoint {
<#
    .SYNOPSIS
    Lists the available top-level service entry points.
    
    .DESCRIPTION
    Lists the available top-level service entry points.

    .INPUTS
    None

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
    Get-vROApiServiceEntryPoint  
#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param ()
                
    try {
    
        $URI = "/vco/api/"
        $Response = Invoke-vRORestMethod -URI $URI -Method GET

        foreach ($Service in $Response.service) {

            [pscustomobject] @{

                Href = $Service.href
                Description = $Service.description

            }

        }

    }
    catch [Exception]{

        throw $_.Exception.Message

    }

}