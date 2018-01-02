function Remove-vROConfigurationElement {
<#
    .SYNOPSIS
    Remove a vRO Configuration Element
    
    .DESCRIPTION
    Remove a vRO Configuration Element
    
    .PARAMETER Id
    Action ID

    .PARAMETER Force
    If the configuration element is referenced by some workflows, it is considered to be 'in use'and the delete operation will fail, unless the 'force' option is provided.

    .INPUTS
    System.String.
    Switch 

    .OUTPUTS
    None

    .EXAMPLE
    Remove-vROConfigurationElement -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea"

    .EXAMPLE
    Get-vROConfigurationElement -Id "3f92d2dc-a9fa-4323-900b-ef97196184ea" | Remove-vROConfigurationElement

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

        foreach ($ConfigurationId in $Id){

            try {    
                
                if ($PSBoundParameters.ContainsKey("Force")) {
                
                    $URI = "/vco/api/configurations/$($ConfigurationId)?force=true"
                    
                }
                else {

                    $URI = "/vco/api/configurations/$($ConfigurationId)"

                }

                if ($PSCmdlet.ShouldProcess($ConfigurationId)){

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