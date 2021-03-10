function Get-vROWorkflow {
<#
    .SYNOPSIS
    Get vRO Workflows

    .DESCRIPTION
    Get vRO Workflows

    .PARAMETER CategoryName
    Retrieve workflow by Category Name

    .PARAMETER CategoryId
    Retrieve workflow by Category Id

    .PARAMETER Id
    Retrieve workflow by Id

    .PARAMETER Name
    Retrieve workflow by Name

    .PARAMETER Wildcard
    Perform a wildcard search when using the Name parameter

    .PARAMETER Tag
    Retrieve workflow by Tag

    .INPUTS
    System.String
    System.Switch

    .OUTPUTS
    System.Management.Automation.PSObject.

    .EXAMPLE
    Get-vROWorkflow

    .EXAMPLE
    Get-vROWorkflow -CategoryName Dev

    .EXAMPLE
    Get-vROWorkflow -CategoryId 2c94c8b464fa5d6e0164ff48ac54070a

    .EXAMPLE
    Get-vROWorkflow -Id '3f92d2dc-a9fa-4323-900b-ef97196184ea'

    .EXAMPLE
    Get-vROWorkflow -Name 'New-DRSRule'

    .EXAMPLE
    Get-vROWorkflow -Name 'New' -Wildcard
#>
[CmdletBinding(DefaultParametersetName="All")][OutputType('System.Management.Automation.PSObject')]

    Param
    (

    [parameter(Mandatory=$false,ParameterSetName="CategoryName")]
    [Alias("Category")]
    [String]$CategoryName,

    [parameter(Mandatory=$false,ParameterSetName="CategoryId")]
    [String]$CategoryId,

    [parameter(Mandatory=$false,ParameterSetName="Id")]
    [String]$Id,

    [parameter(Mandatory=$false,ParameterSetName="Name")]
    [String]$Name,

    [parameter(Mandatory=$false,ParameterSetName="Name")]
    [Switch]$Wildcard,

    [parameter(Mandatory=$false,ParameterSetName="All")]
    [parameter(Mandatory=$false,ParameterSetName="CategoryName")]
    [parameter(Mandatory=$false,ParameterSetName="Category")]
    [String[]]$Tag

    )

    begin {

        # --- Verify vRO version supports tagging
        if ($PSBoundParameters.ContainsKey('Tag') -and $Script:vROConnection.Version -like '7.*') {

            throw "Tagging is not supported with vRO $($Script:vroConnection.Version)."
        }
    }

    process {

        try {

            # --- Send REST call and process results
            switch ($PsCmdlet.ParameterSetName){
    
                "All" {
    
                    $URI = "/vco/api/workflows"
                    break
                }
    
                "CategoryName" {
    
                    $URI = "/vco/api/workflows/?conditions=categoryName=$($CategoryName)"
                    break
                }
    
                "CategoryId" {
    
                    $URI = "/vco/api/catalog/System/WorkflowCategory/$($CategoryId)/workflows"
                    break
                }
    
                "Id" {
    
                    $URI = "/vco/api/workflows/$($Id)"
                    break
    
                }
    
                "Name" {
    
                    if ($PSBoundParameters.ContainsKey('Wildcard')){
    
                        $URI = "/vco/api/workflows/?conditions=name~$($Name)"
                    }
                    else {
    
                        $URI = "/vco/api/workflows/?conditions=name=$($Name)"
                    }
                    break
                }
            }

            # filter by tag
            if ($PSBoundParameters.ContainsKey('Tag')) {
                $URI += if ($PSCmdlet.ParameterSetName -eq 'All') { '?' } else { '&' }
    
                $newParams = @()
                foreach ($tagAttr in $Tag) {
                    $newParams += "tags=$($tagAttr)"
                }
    
                $URI += $newParams -join '&'
            }
    
            switch ($PsCmdlet.ParameterSetName){
    
                "Id" {
    
                    $Workflow = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference
    
                    [pscustomobject]@{
    
                        Name = $Workflow.name
                        ID = $Workflow.id
                        Description = $Workflow.description
                        ItemHref = $Workflow.href
                        Version = $Workflow.version
                        CategoryName = $null
                        CategoryHref = $null
                        CustomIcon = $Workflow.'customized-icon'
                        CanExecute = $null
                        CanEdit = $null
                    }
                }
    
                "CategoryId" {
    
                    $Workflows = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference
    
                    foreach ($Workflow in $Workflows.link){
    
                        [pscustomobject]@{
    
                            Name = ($Workflow.attributes | Where-Object {$_.name -eq 'name'}).value
                            ID = ($Workflow.attributes | Where-Object {$_.name -eq 'id'}).value
                            Description = ($Workflow.attributes | Where-Object {$_.name -eq 'description'}).value
                            ItemHref = $Workflow.href
                            Version = ($Workflow.attributes | Where-Object {$_.name -eq 'version'}).value
                            CategoryName = ($Workflow.attributes | Where-Object {$_.name -eq 'categoryName'}).value
                            CategoryHref = ($Workflow.attributes | Where-Object {$_.name -eq 'categoryHref'}).value
                            CustomIcon = ($Workflow.attributes | Where-Object {$_.name -eq 'customIcon'}).value
                            CanExecute = ($Workflow.attributes | Where-Object {$_.name -eq 'canExecute'}).value
                            CanEdit = ($Workflow.attributes | Where-Object {$_.name -eq 'canEdit'}).value
                        }
                    }
                }
    
                default {
    
                    $Workflows = Invoke-vRORestMethod -Method Get -Uri $URI -Verbose:$VerbosePreference
    
                    foreach ($Workflow in $Workflows.link){
    
                        [pscustomobject]@{
    
                            Name = ($Workflow.attributes | Where-Object {$_.name -eq 'name'}).value
                            ID = ($Workflow.attributes | Where-Object {$_.name -eq 'id'}).value
                            Description = ($Workflow.attributes | Where-Object {$_.name -eq 'description'}).value
                            ItemHref = ($Workflow.attributes | Where-Object {$_.name -eq 'itemHref'}).value
                            Version = ($Workflow.attributes | Where-Object {$_.name -eq 'version'}).value
                            CategoryName = ($Workflow.attributes | Where-Object {$_.name -eq 'categoryName'}).value
                            CategoryHref = ($Workflow.attributes | Where-Object {$_.name -eq 'categoryHref'}).value
                            CustomIcon = ($Workflow.attributes | Where-Object {$_.name -eq 'customIcon'}).value
                            CanExecute = ($Workflow.attributes | Where-Object {$_.name -eq 'canExecute'}).value
                            CanEdit = ($Workflow.attributes | Where-Object {$_.name -eq 'canEdit'}).value
                        }
                    }
                }
            }
        }
        catch [Exception]{
    
            throw
        }
    }
}