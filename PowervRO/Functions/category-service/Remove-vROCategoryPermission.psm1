function Remove-vROCategoryPermission {
<#
    .SYNOPSIS
    Remove a Permission from a vRO Category
    
    .DESCRIPTION
    Remove a Permission from a vRO Category
    
    .PARAMETER Id
    Category Id

    .PARAMETER Principal
    Specify the Permission Principal. Needs to be in the format user@domain or domain\user

    .INPUTS
    System.String

    .OUTPUTS
    None
    
    .EXAMPLE
    Remove-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e' -Principal vRO_Users@vrademo.local

    .EXAMPLE
    Get-vROCategory -Id '40281e8654ddec6201553af63677146e' | Remove-vROWorkflowPermission -Principal vRO_Users@vrademo.local
#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Id,
    
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

        foreach ($CategoryId in $Id){
                
            try {

                if ($PSCmdlet.ShouldProcess($CategoryId)){

                    # --- Get Permission Rule
                    $CategoryPermission = Get-vROCategoryPermission -Id $CategoryId | Where-Object {$_.Principal -match $Username}
                    
                    if (!$CategoryPermission){

                        throw "Unable to find Category Permission with Principal $($Principal)"
                    }
                    else {
                        
                        $Index = $CategoryPermission.CategoryHref.IndexOf("/vco")
                        $URI = $CategoryPermission.CategoryHref.Substring($Index)
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