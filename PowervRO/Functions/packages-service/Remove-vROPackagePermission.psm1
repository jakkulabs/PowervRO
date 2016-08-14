function Remove-vROPackagePermission {
<#
    .SYNOPSIS
    Remove a Permission from a vRO Package
    
    .DESCRIPTION
    Remove a Permission from a vRO Package
    
    .PARAMETER Name
    Package Name

    .PARAMETER Principal
    Specify the Permission Principal. Needs to be in the format user@domain or domain\user

    .INPUTS
    System.String

    .OUTPUTS
    None
    
    .EXAMPLE
    Remove-vROPackagePermission -Name "net.powervro.tests" -Principal vRO_Users@vrademo.local

    .EXAMPLE
    Get-vROPackage -Name "net.powervro.tests" | Remove-vROPackagePermission -Principal vRO_Users@vrademo.local
#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Name,
    
    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Principal
    )

    begin {

        # --- Break out the Username and Domain from the Principal
        if ($Principal -match "@"){

            $Username = ($Principal -split "@")[0]
        }
        elseif ($Principal -match "\\"){

            $Username = ($Principal -split "@")[1]
        }
        else {

            throw "Principal needs to be in the format user@domain or domain\user"
        }
    }

    process {

        foreach ($PackageName in $Name){
                
            try {

                if ($PSCmdlet.ShouldProcess($PackageName)){

                    # --- Get Permission Rule
                    $PackagePermission = Get-vROPackagePermission -Name $PackageName | Where-Object {$_.Principal -match $Username}
                    
                    if (!$PackagePermission){

                        throw "Unable to find Workflow Permission with Principal $($Principal)"
                    }
                    else {
                        
                        $Index = $PackagePermission.PackageHref.IndexOf("/vco")
                        $URI = $PackagePermission.PackageHref.Substring($Index)
                    }

                    # --- Send REST call and process results            
                    Invoke-vRORestMethod -Method DELETE -Uri $URI -Verbose:$VerbosePreference | Out-Null        
                }
            }
            catch [Exception]{

                throw
            }
        }
    }

    end {

    }
}