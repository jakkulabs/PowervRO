function Get-vROCategory {
<#
    .SYNOPSIS
    Get vRO Categories

    .DESCRIPTION
    Get vRO Categories

    .PARAMETER CategoryType
    Retrieve Category by CategoryType

    .PARAMETER Id
    Retrieve Category by Id

    .PARAMETER Root
    Retrieve only Categories in the top-level folder root

    .INPUTS
    System.String
    System.Switch

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
	Get-vROCategory

    .EXAMPLE
	Get-vROCategory -CategoryType Workflow

    .EXAMPLE
	Get-vROCategory -Id '40281e8b555889520155588bc4c10f1c'

    .EXAMPLE
	Get-vROCategory -CategoryType ResourceElement -Root
#>
[CmdletBinding(DefaultParametersetName="All")][OutputType('System.Management.Automation.PSObject')]

    Param
    (   
    
    [parameter(Mandatory=$true,ParameterSetName="CategoryType")]
    [ValidateSet("WorkflowCategory","ScriptModuleCategory","ConfigurationElementCategory","ResourceElementCategory")]
    [String]$CategoryType,

    [parameter(Mandatory=$true,ParameterSetName="Id")]
    [String]$Id,

    [parameter(Mandatory=$false,ParameterSetName="All")]
    [parameter(Mandatory=$false,ParameterSetName="CategoryType")]
    [Switch]$Root

    )

    try {

        # --- Send REST call and process results            
        switch ($PsCmdlet.ParameterSetName) {

            "All"  { 
                
                if ($PSBoundParameters.ContainsKey("Root")) {

                    $URI = "/vco/api/categories?isRoot=true"
                }
                else {

                    $URI = "/vco/api/categories"
                }

                break
            }

            "CategoryType"  {

                if ($PSBoundParameters.ContainsKey("Root")) {

                    $URI = "/vco/api/categories?categoryType=$($CategoryType)&isRoot=true"
                }
                else {

                    $URI = "/vco/api/categories?categoryType=$($CategoryType)"
                }

                break
            }

            "Id"  {
            
                $URI = "/vco/api/categories/$($Id)"
                break
            }
        }

        if ($PsCmdlet.ParameterSetName -eq 'Id'){

            $Category = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference

            [pscustomobject]@{                        
                    
                Name = $Category.name
                ID = $Category.id
                Description = $Category.description
                Type = $Category.type
                Path = $Category.path
                Href = $Category.href
           }
        }
        else {
         
            $Categories = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference

            foreach ($Category in $Categories.link){

                [pscustomobject]@{                        
                    
                    Name = ($Category.attributes | Where-Object {$_.name -eq 'name'}).value
                    ID = ($Category.attributes | Where-Object {$_.name -eq 'id'}).value
                    Description = ($Category.attributes | Where-Object {$_.name -eq 'description'}).value
                    Type = ($Category.attributes | Where-Object {$_.name -eq 'type'}).value
                    Path = $null
                    Href = $Category.href
                }
            }
        } 
    }
    catch [Exception]{
        
        throw
    }
}