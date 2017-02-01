function Remove-vROResourceElement {
<#
    .SYNOPSIS
    Remove a vRO Resource Element
    
    .DESCRIPTION
    Remove a vRO Resource Element
    
    .PARAMETER Id
    Action ID

    .PARAMETER Force
    If the resource element is referenced by some workflows, it is considered to be 'in use'and the delete operation will fail, unless the 'force' option is provided.

    .INPUTS
    System.String.
    Switch 

    .OUTPUTS
    None

    .EXAMPLE
    Remove-vROResourceElement -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea"

    .EXAMPLE
    Get-vROResourceElement -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea" | Remove-vROResourceElement

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

        foreach ($ResourceId in $Id){

            try {    
                
                if ($PSBoundParameters.ContainsKey("Force")) {
                
                    $URI = "/vco/api/resources/$($ResourceId)?force=true"
                    
                }
                else {

                    $URI = "/vco/api/resources/$($ResourceId)"

                }

                if ($PSCmdlet.ShouldProcess($ResourceId)){

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