function Add-vROCategoryPermission {
<#
    .SYNOPSIS
    Add a Permission to a vRO Category
    
    .DESCRIPTION
    Add a Permission to a vRO Category
    
    .PARAMETER Id
    Category Id

    .PARAMETER Principal
    Specify the Permission Principal. Needs to be in the format user@domain or domain\user

    .PARAMETER Rights
    Specify the Permission Rights

    .INPUTS
    System.String

    .OUTPUTS
    System.Management.Automation.PSObject.
    
    .EXAMPLE
    Add-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e' -Principal vRO_Users@vrademo.local -Rights 'View','Execute','Inspect'

    .EXAMPLE
    $Permissions = Get-vROCategoryPermission -Id '40281e8654ddec6201553af63677146e'
    Get-vROCategory -Id '40281e8654ddec6201554f5836651514' | Add-vROCategoryPermission -Principal $Permissions[0].Principal -Rights $Permissions[0].Rights
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

        foreach ($CategoryId in $Id){
                
            try {

                if ($PSCmdlet.ShouldProcess($CategoryId)){

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
                    $URI = "/vco/api/categories/$($CategoryId)/permissions"

                    $Request = Invoke-vRORestMethod -Method POST -Uri $URI -Body $Body -Verbose:$VerbosePreference
        
                    # --- Output the Successful Result
                    foreach ($Permission in $Request.permissions){

                        $Rights = @()

                        switch -regex ($Permission.permission.rights)
                        {
                            "[r]" {$Rights += "View"}
                            "[x]" {$Rights += "Execute"}
                            "[i]" {$Rights += "Inspect"}
                            "[c]" {$Rights += "Edit"}
                            "[a]" {$Rights += "Admin"}

                            Default {}
                        }

                        [pscustomobject]@{                
                    
                            Principal = $Permission.permission.principal
                            Rights = $Rights
                            CategoryID = $CategoryId
                            CategoryHref = $Permission.permission.href
                        }
                    }
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