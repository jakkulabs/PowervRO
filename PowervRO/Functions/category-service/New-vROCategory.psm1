function New-vROCategory {
<#
    .SYNOPSIS
    Create a vRO Category
    
    .DESCRIPTION
    Create a vRO Category
        
    .PARAMETER Name
    Category Name
    
    .PARAMETER Description
    Category Description

    .PARAMETER CategoryType
    CategoryType

    .PARAMETER CategoryId
    Id of the Category to create the new Category in - default is the root Category

    .PARAMETER JSON
    Body text to send in JSON format

    .INPUTS
    System.String.

    .OUTPUTS
    System.Management.Automation.PSObject

    .EXAMPLE
    New-vROCategory -Name Category01 -Description "This is Category01" -CategoryType WorkflowCategory

    .EXAMPLE
    Get-vROCategory -Id '40281e8654ddec6201553af63677146e' | New-vROCategory -Name "Category01" -Description "This is Category01"
    
    .EXAMPLE
    $JSON = @"
    {  
       "type":"WorkflowCategory",  
       "name":"Category01",  
       "description":"This is Category01"  
    }  
    "@
    $JSON | New-vROCategory -CategoryId "40281e8654ddec6201553af63677146e"
#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="Low",DefaultParameterSetName="JSON")][OutputType('System.Management.Automation.PSObject')]

    Param (

    [parameter(Mandatory=$true,ParameterSetName="Standard")]
    [ValidateNotNullOrEmpty()]
    [String]$Name,
    
    [parameter(Mandatory=$false,ParameterSetName="Standard")]
    [ValidateNotNullOrEmpty()]
    [String]$Description,

    [parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true,ParameterSetName="Standard")]
    [ValidateSet("WorkflowCategory","ScriptModuleCategory","ConfigurationElementCategory","ResourceElementCategory")]
    [alias("Type")]
    [String]$CategoryType,

    [parameter(Mandatory=$false,ValueFromPipelineByPropertyName=$true,ParameterSetName="Standard")]
    [parameter(Mandatory=$false,ValueFromPipelineByPropertyName=$true,ParameterSetName="JSON")]
    [alias("Id")]
    [ValidateNotNullOrEmpty()]
    [String]$CategoryId,

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ParameterSetName="JSON")]
    [ValidateNotNullOrEmpty()]
    [String]$JSON
    )    

    begin {
    
    }
    
    process {
    
        # --- Set Body for REST request depending on ParameterSet
        if ($PSBoundParameters.ContainsKey("JSON")){
        
            $Data = ($JSON | ConvertFrom-Json)
            
            $Body = $JSON
            $Name = $Data.name     
        }
        else {
        
            $Body = @"
            {
                "type": "$($CategoryType)",
                "name": "$($Name)",
                "description": "$($Description)"
            }
"@
        }   
           
        try {
            if ($PSCmdlet.ShouldProcess($Name)){

                if ($PSBoundParameters.ContainsKey("CategoryId")){

                    $URI = "/vco/api/categories/$($CategoryId)"
                }
                else {

                    $URI = "/vco/api/categories"
                }

                # --- Run vRO REST Request
                $Category = Invoke-vRORestMethod -Method POST -URI $URI -Body $Body -Verbose:$VerbosePreference

                # --- Output the Successful Result
                [pscustomobject]@{                        
                    
                    Name = $Category.name
                    ID = $Category.id
                    Description = $Category.description
                    Type = $Category.type
                    Path = $Category.path
                    Href = $null
               }
            }
        }
        catch [Exception]{

            throw
        }
    }
    end {
        
    }
}