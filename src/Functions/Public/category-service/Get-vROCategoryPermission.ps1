function Get-vROCategoryPermission {
<#
    .SYNOPSIS
    Get vRO Category Permissions

    .DESCRIPTION
    Get vRO Category Permissions

    .PARAMETER Id
    Category Id

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e'

    .EXAMPLE
	Get-vROCategory -Id '40281e8654ddec6201553af63677146e' | Get-vROCategoryPermission
#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param
    (   
    
    [parameter(Mandatory=$true,ValueFromPipeline,ValueFromPipelinebyPropertyName=$true)]
    [String[]]$Id

    )

    begin {

    }

    process{

        try {

            foreach ($CategoryId in $Id){

                # --- Send REST call and process results            
                $URI = "/vco/api/categories/$($CategoryId)/permissions"

                $Category = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference

                foreach ($Permission in $Category.permissions){

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

                    [pscustomobject]@{                
                    
                        Principal = $Permission.permission.principal
                        Rights = $Rights
                        CategoryID = $CategoryId
                        CategoryHref = $Permission.permission.href
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