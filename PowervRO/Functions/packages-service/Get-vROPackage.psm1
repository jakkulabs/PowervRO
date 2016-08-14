function Get-vROPackage {
<#
    .SYNOPSIS
    Get vRO Packages

    .DESCRIPTION
    Get vRO Packages

    .PARAMETER Name
    Retrieve Package by Name

    .INPUTS
    System.String
    System.Switch

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROPackage

    .EXAMPLE
	Get-vROPackage -Name 'com.vmware.library.powershell'
#>
[CmdletBinding(DefaultParametersetName="All")][OutputType('System.Management.Automation.PSObject')]

    Param
    (   
    
    [parameter(Mandatory=$true,ParameterSetName="Name")]
    [String]$Name

    )

    try {

        # --- Send REST call and process results            
        switch ($PsCmdlet.ParameterSetName) {

            "All"  { 
                
                $URI = "/vco/api/packages"

                $Packages = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference

                foreach ($Package in $Packages.link){

                    [pscustomobject]@{                        
                    
                        Name = ($Package.attributes | Where-Object {$_.name -eq 'name'}).value
                        ID = ($Package.attributes | Where-Object {$_.name -eq 'id'}).value
                        Description = ($Package.attributes | Where-Object {$_.name -eq 'description'}).value
                        Href = $Package.href
                        Workflows = $null
                        Actions = $null
                    }
                }

                break
            }

            "Name"  {
            
                $URI = "/vco/api/packages/$($Name)/"

                $Package = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference

                [pscustomobject]@{                        
                    
                    Name = $Package.name
                    ID = $Package.id
                    Description = $Package.description
                    Href = $Package.href
                    Workflows = $Package.workflows
                    Actions = $Package.actions
               }

               break
            }
        }
    }
    catch [Exception]{
        
        throw
    }
}