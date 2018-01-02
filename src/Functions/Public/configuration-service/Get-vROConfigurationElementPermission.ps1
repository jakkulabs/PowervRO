function Get-vROConfigurationElementPermission {
<#
    .SYNOPSIS
    Get vRO Configuration Element Permissions

    .DESCRIPTION
    Get vRO Configuration Element Permissions

    .PARAMETER Id
    Configuration Element Id

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROConfigurationElementPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'

    .EXAMPLE
	Get-vROConfigurationElement -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Get-vROConfigurationElementPermission

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

            foreach ($ConfigurationId in $Id){

                # --- Send REST call and process results            
                $URI = "/vco/api/configurations/$($ConfigurationId)/permissions"

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
                    
                        Id = $Href.segments[-1].Trim("/")
                        Principal = $Permission.permission.principal
                        Rights = $Rights
                        ConfigurationId = $ConfigurationId

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