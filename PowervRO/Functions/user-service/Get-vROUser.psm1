function Get-vROUser {
<#
    .SYNOPSIS
    Returns the solution user and whether the current user has admin rights as well as its member groups

    .DESCRIPTION
    Returns the solution user and whether the current user has admin rights as well as its member groups

    .INPUTS
    None

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROUser
#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param()

    begin {

    }

    process {

        try {

            $URI = "/vco/api/users"
            
            Write-Verbose -Message "GET : $($URI)"

            $Response = Invoke-vRORestMethod -Method GET -URI $URI

            Write-Verbose -Message "SUCCESS"

            [PSCustomObject]@{

                AdminRights = $Response."admin-rights"
                SolutionUser = $Response."solution-user"
                MemberGroups = $Response."member-groups"

            }

        }
        catch [Exception]{
        
            throw
        }
    }

    end {

    }
}