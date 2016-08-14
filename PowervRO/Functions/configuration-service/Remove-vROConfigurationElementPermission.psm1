function Remove-vROConfigurationElementPermission {
<#
    .SYNOPSIS
    Remove a Permission from a vRO Configuration Element
    
    .DESCRIPTION
    Remove a Permission from a vRO Configuration Element
    
    .PARAMETER Id
    Configuration Element Id

    .PARAMETER Principal
    Specify the Permission Principal. Needs to be in the format user@domain or domain\user

    .INPUTS
    System.String

    .OUTPUTS
    None
    
    .EXAMPLE
    Remove-vROConfigurationElementPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' -Principal vRO_Users@vrademo.local

    .EXAMPLE
    Get-vROConfigurationElement -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Remove-vROConfigurationElementPermission -Principal vRO_Users@vrademo.local

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

        foreach ($ConfigurationId in $Id){
                
            try {

                if ($PSCmdlet.ShouldProcess($ConfigurationId)){

                    # --- Get Permission Rule
                    $Permission = Get-vROConfigurationElementPermission -Id $ConfigurationId | Where-Object {$_.Principal -match $Username}
                    
                    if (!$Permission){

                        throw "Unable to find Permission with Principal $($Principal)"
                    }
                    else {
                        
                        $URI = "/vco/api/configurations/$($ConfigurationId)/permissions/$($Permission.Id)"

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