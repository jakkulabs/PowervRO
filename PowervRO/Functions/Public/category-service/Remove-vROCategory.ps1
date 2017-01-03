function Remove-vROCategory {
<#
    .SYNOPSIS
    Remove a vRO Category
    
    .DESCRIPTION
    Remove a vRO Category
    
    .PARAMETER Id
    Category ID

    .PARAMETER Force
    If the contains any content such as Workflows, Actions, Resource Elements or Configuration Elements the delete operation will fail, unless the 'force' option is provided. USE WITH CAUTION!

    .INPUTS
    System.String.
    Switch

    .OUTPUTS
    None

    .EXAMPLE
    Remove-vROCategory -Id "40281e8654ddec620155df5563fc1800"

    .EXAMPLE
    Get-vROCategory -Id '40281e8b555889520155588bc4c10f1c' | Remove-vROCategory -Confirm:$false
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

        foreach ($CategoryId in $Id){

            try {    
                
                if ($PSBoundParameters.ContainsKey("Force")) {
                
                    $URI = "/vco/api/categories/$($CategoryId)?deleteNonEmptyContent=true"
                }
                else {

                    $URI = "/vco/api/categories/$($CategoryId)"
                }

                if ($PSCmdlet.ShouldProcess($CategoryId)){

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