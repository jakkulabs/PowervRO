function Remove-vROPackage {
<#
    .SYNOPSIS
    Remove a vRO Package
    
    .DESCRIPTION
    Remove a vRO Package
    
    .PARAMETER Name
    Package Name

    .PARAMETER DeletePackageWithContent
    Deletes the package along with the content. If other packages share elements with this package, they will be deleted

    .PARAMETER DeletePackageKeepingShared
    Deletes the package along with the content. If other packages share elements with this package, the elements will not be removed.

    .INPUTS
    System.String.
    Switch

    .OUTPUTS
    None

    .EXAMPLE
    Remove-vROPackage -Name "net.powervro.tests"

    .EXAMPLE
    Get-vROPackage -Name "net.powervro.tests" | Remove-vROPackage -Confirm:$false
#>
[CmdletBinding(DefaultParametersetName="DeletePackage",SupportsShouldProcess,ConfirmImpact="High")]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Name,

    [parameter(Mandatory=$false,ParametersetName="DeletePackageWithContent")]
    [Switch]$DeletePackageWithContent,

    [parameter(Mandatory=$false,ParametersetName="DeletePackageKeepingShared")]
    [Switch]$DeletePackageKeepingShared
    )    

    begin {
    
    }
    
    process {    

        foreach ($PackageName in $Name){

            try {    
                
                switch ($PsCmdlet.ParameterSetName){ 

                    “DeletePackage”  {

                        $URI = "/vco/api/packages/$($PackageName)/";
                        break
                    }

                    “DeletePackageWithContent”  {

                        $URI = "/vco/api/packages/$($PackageName)/?option=deletePackageWithContent";
                        break
                    }
                    “DeletePackage”  {

                        $URI = "/vco/api/packages/$($PackageName)/?option=deletePackageKeepingShared";
                        break
                    } 

                } 

                if ($PSCmdlet.ShouldProcess($PackageName)){

                    # --- Run vRO REST Request
                    Invoke-vRORestMethod -Uri $URI -Method DELETE -Verbose:$VerbosePreference
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