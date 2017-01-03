function Get-vROResourceElementPermission {
<#
    .SYNOPSIS
    Get vRO Resource Element Permissions

    .DESCRIPTION
    Get vRO Resource Element Permissions

    .PARAMETER Id
    Resource Element Id

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROResourceElementPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'

    .EXAMPLE
	Get-vROResourceElement -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROResourceElementPermission

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

            foreach ($ResourceId in $Id){

                # --- Send REST call and process results            
                $URI = "/vco/api/resources/$($ResourceId)/permissions"

                $Response = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference

                foreach ($Permission in $Response.permissions){

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
                    
                        Id = $href.segments[-1].Trim("/")
                        Principal = $Permission.permission.principal
                        Rights = $Rights
                        ResourceId = $ResourceId

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