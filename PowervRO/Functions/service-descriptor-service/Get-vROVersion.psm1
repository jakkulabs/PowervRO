function Get-vROVersion {
<#
    .SYNOPSIS
    Retrieve vRO version information
    
    .DESCRIPTION
    Retrieve vRO version information

    .INPUTS
    None

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
    Get-vROVersion  
#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param ()
                
    try {

        $URI = "/vco/api/about"
        $Response = Invoke-vRORestMethod -Method GET -URI $URI

        if ($Response.version.StartsWith("6")){

            $Version = ($Response.version -split " ")[0]
        }
        else {

            $Version = $Response.version
        }

        [pscustomobject] @{

            Version = $Version
            BuildNumber = $Response."build-number"
            BuildDate = $Response."build-date"
            APIVersion = $Response."api-version"

        }

    }
    catch [Exception]{

        throw $_.Exception.Message

    }

}