function Add-vROConfigurationElementPermission {
<#
    .SYNOPSIS
    Add a Permission to a vRO Configuration Element
    
    .DESCRIPTION
    Add a Permission to a vRO Configuration Element
    
    .PARAMETER Id
    Configuration Element Id

    .PARAMETER Principal
    Specify the Permission Principal. Needs to be in the format user@domain or domain\user

    .PARAMETER Rights
    Specify the Permission Rights

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.
    
    .EXAMPLE
    Add-vROConfigurationElementPermission -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea' -Principal vRO_Users@vrademo.local -Rights 'View','Execute','Inspect'

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="Low")][OutputType('System.Management.Automation.PSObject')]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Id,
    
    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Principal,  
    
    [parameter(Mandatory=$true)]
    [ValidateSet("View","Execute","Inspect","Edit","Admin")]
    [String[]]$Rights

    )

    begin {

        # --- Break out the Username and Domain from the Principal
        if ($Principal -match "@"){

            $Username = ($Principal -split "@")[0]
            $Domain = ($Principal -split "@")[1]

        }
        elseif ($Principal -match "\\"){

            $Username = ($Principal -split "\\")[1]
            $Domain = ($Principal -split "\\")[0]

        }
        else {

            throw "Principal needs to be in the format user@domain or domain\user"

        }

        # --- Convert Rights to API required digit(s)
        $APIRights = @()

        switch ($Rights)
        {
            "View" {$APIRights += "r"}
            "Execute" {$APIRights += "x"}
            "Inspect" {$APIRights += "i"}
            "Edit" {$APIRights += "c"}
            "Admin" {$APIRights += "a"}

            Default {}

        }

    }

    process {

        foreach ($ConfigurationId in $Id){
                
            try {

                if ($PSCmdlet.ShouldProcess($ConfigurationId)){

                    # --- Create JSON Body
                    $Body = @"
                        {
                            "permissions": [
                                {
                                    "permission": {
                                        "principal": "$($Domain)\\$($Username)",
                                        "relations": null,
                                        "rights": "$($APIRights -Join(""))"
                                    }
                                }
                            ]
                        }
"@

                    # --- Send REST call and process results            
                    $URI = "/vco/api/configurations/$($ConfigurationId)/permissions"

                    Invoke-vRORestMethod -Method POST -Uri $URI -Body $Body -Verbose:$VerbosePreference | Out-Null
        
                    # --- Output the Successful Result
                    Get-vROConfigurationElementPermission -Id $ConfigurationId | Where-Object {$_.Principal -match $Username}

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