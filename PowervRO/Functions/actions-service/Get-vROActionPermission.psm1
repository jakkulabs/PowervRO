function Get-vROActionPermission {
<#
    .SYNOPSIS
    Get vRO Action Permissions

    .DESCRIPTION
    Get vRO Action Permissions

    .PARAMETER Id
    Action Id

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROActionPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'

    .EXAMPLE
	Get-vROAction -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROActionPermission

#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param
    (   
    
    [Parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Id

    )

    begin {

    }

    process {

        try {

            foreach ($ActionId in $Id){

                # --- Send REST call and process results            
                $URI = "/vco/api/actions/$($ActionId)/permissions"

                $Action = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference

                foreach ($Permission in $Action.permissions){

                    $Rights = @()

                    switch -regex ($Permission.permission.rights)
                    {
                        "[r]" {$Rights += "View"}
                        "[x]" {$Rights += "Execute"}
                        "[i]" {$Rights += "Inspect"}
                        "[c]" {$Rights += "Edit"}
                        "[a]" {$Rights += "Admin"}

                        Default {}

                    }

                    # --- Get the permission href
                    [System.Uri]$Href = $permission.permission.href

                    [PSCustomObject]@{                
                    
                        Id = $href.segments[6].Trim("/")
                        Principal = $Permission.permission.principal
                        Rights = $Rights
                        ActionId = $ActionId

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