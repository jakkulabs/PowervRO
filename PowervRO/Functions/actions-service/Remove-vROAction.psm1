function Remove-vROAction {
<#
    .SYNOPSIS
    Remove a vRO Action
    
    .DESCRIPTION
    Remove a vRO Action
    
    .PARAMETER Id
    Action ID

    .PARAMETER Force
    If the action is referenced by some workflows, it is considered to be 'in use'and the delete operation will fail, unless the 'force' option is provided.

    .INPUTS
    System.String.
    Switch 

    .OUTPUTS
    None

    .EXAMPLE
    Remove-vROAction -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea"

    .EXAMPLE
    Get-vROAction -Name Test01 -Category com.company.test | Remove-vROAction -Confirm:$false

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Id,

    [parameter(Mandatory=$false)]
    [Switch]$Force

    )    

    begin {
    
    }
    
    process {    

        foreach ($ActionId in $Id){

            try {    
                
                if ($PSBoundParameters.ContainsKey("Force")) {
                
                    $URI = "/vco/api/actions/$($ActionId)?force=true"
                    
                }
                else {

                    $URI = "/vco/api/actions/$($ActionId)"

                }

                if ($PSCmdlet.ShouldProcess($ActionId)){

                    # --- Run vRO REST Request

                    Invoke-vRORestMethod -Uri $URI -Method DELETE -Verbose:$VerbosePreference | Out-Null


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