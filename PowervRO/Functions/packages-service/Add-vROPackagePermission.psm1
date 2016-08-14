function Add-vROPackagePermission {
<#
    .SYNOPSIS
    Add a Permission to a vRO Package
    
    .DESCRIPTION
    Add a Permission to a vRO Package
    
    .PARAMETER Name
    Package Name

    .PARAMETER Principal
    Specify the Permission Principal. Needs to be in the format user@domain or domain\user

    .PARAMETER Rights
    Specify the Permission Rights

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.
    
    .EXAMPLE
    Add-vROPackagePermission -Name "net.powervro.tests" -Principal vRO_Users@vrademo.local -Rights 'View','Inspect'

    .EXAMPLE
    $Permissions = Get-vROPackagePermission -Name "net.powervro.tests"
    Get-vROPackage -Name "net.powervro.tests2" | Add-vROWorkflowPermission -Principal $Permissions[0].Principal -Rights $Permissions[0].Rights
#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="Low")][OutputType('System.Management.Automation.PSObject')]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Name,
    
    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$Principal,  
    
    [parameter(Mandatory=$true)]
    [ValidateSet("View","Inspect","Edit","Admin")]
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
            "Inspect" {$APIRights += "i"}
            "Edit" {$APIRights += "c"}
            "Admin" {$APIRights += "a"}

            Default {}
        }
    }

    process {

        foreach ($PackageName in $Name){
                
            try {

                if ($PSCmdlet.ShouldProcess($PackageName)){

                    # --- Create JSON Body
                    $Body = @"
    {
      "permissions": [
        {
          "permission": {
            "principal": "$($Domain)\\$($Username)",
            "rights": "$($APIRights -join "")"
          }
        }
      ]
    }
"@
                    # --- Send REST call and process results            
                    $URI = "/vco/api/packages/$($PackageName)/permissions"

                    Invoke-vRORestMethod -Method POST -Uri $URI -Body $Body -Verbose:$VerbosePreference | Out-Null
        
                    # --- Output the Successful Result
                    Get-vROPackagePermission -Name $PackageName | Where-Object {$_.Principal -match $Username}
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