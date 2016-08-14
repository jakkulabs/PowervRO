function Remove-vROWorkflowPermission {
<#
    .SYNOPSIS
    Remove a Permission from a vRO Workflow
    
    .DESCRIPTION
    Remove a Permission from a vRO Workflow
    
    .PARAMETER Id
    Workflow Id

    .PARAMETER Principal
    Specify the Permission Principal. Needs to be in the format user@domain or domain\user

    .INPUTS
    System.String

    .OUTPUTS
    None
    
    .EXAMPLE
    Remove-vROWorkflowPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' -Principal vRO_Users@vrademo.local

    .EXAMPLE
    Get-vROWorkflow -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' | Remove-vROWorkflowPermission -Principal vRO_Users@vrademo.local
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

        foreach ($WorkflowId in $Id){
                
            try {

                if ($PSCmdlet.ShouldProcess($WorkflowId)){

                    # --- Get Permission Rule
                    $WorkflowPermission = Get-vROWorkflowPermission -Id $WorkflowId | Where-Object {$_.Principal -match $Username}
                    
                    if (!$WorkflowPermission){

                        throw "Unable to find Workflow Permission with Principal $($Principal)"
                    }
                    else {
                        
                        $Index = $WorkflowPermission.WorkflowHref.IndexOf("/vco")
                        $URI = $WorkflowPermission.WorkflowHref.Substring($Index)
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