function Get-vROPackagePermission {
<#
    .SYNOPSIS
    Get vRO Package Permissions

    .DESCRIPTION
    Get vRO Package Permissions

    .PARAMETER Name
    Package Name

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROPackagePermission -Name "net.powervro.tests"

    .EXAMPLE
	Get-vROPackage -Name "net.powervro.tests" | Get-vROPackagePermission
#>
[CmdletBinding()][OutputType('System.Management.Automation.PSObject')]

    Param
    (   
    
    [parameter(Mandatory=$true,ValueFromPipeline,ValueFromPipelinebyPropertyName=$true)]
    [String[]]$Name

    )

    begin {

    }

    process {

        try {

            foreach ($PackageName in $Name){

                # --- Send REST call and process results            
                $URI = "/vco/api/packages/$($PackageName)/permissions"

                $Package= Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference

                foreach ($Permission in $Package.permissions){

                    $Rights = @()

                    switch -regex ($Permission.permission.rights)
                    {
                        "[r]" {$Rights += "View"}
                        "[i]" {$Rights += "Inspect"}
                        "[c]" {$Rights += "Edit"}
                        "[a]" {$Rights += "Admin"}

                        Default {}
                    }

                    [pscustomobject]@{                
                    
                        Principal = $Permission.permission.principal
                        Rights = $Rights
                        Package = $PackageName
                        PackageHref = $Permission.permission.href
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