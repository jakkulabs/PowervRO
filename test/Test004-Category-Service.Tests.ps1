# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Startup
$ConnectionPassword = ConvertTo-SecureString $JSON.Connection.Password -AsPlainText -Force
$Connection = Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $ConnectionPassword -Port $JSON.Connection.Port -IgnoreCertRequirements

# --- Tests
Describe -Name 'Category Tests' -Fixture {

    It -Name "Return named Category by Id $($JSON.Category.PowervROTestId)" -Test {

        $CategoryA = Get-vROCategory -Id $JSON.Category.PowervROTestId
        $CategoryA.ID | Should Be $JSON.Category.PowervROTestId
    }

    It -Name "Return named Category by Type $($JSON.Category.WorkflowCategoryType)" -Test {

        $CategoriesB = Get-vROCategory -CategoryType $JSON.Category.WorkflowCategoryType

        foreach ($Category in $CategoriesB){

            $Category.Type | Should Be $JSON.Category.WorkflowCategoryType
        }
    }

    It -Name "Create named Workflow Category $($JSON.Category.WorkflowCategoryName)" -Test {

        $CategoryC = New-vROCategory -Name $JSON.Category.WorkflowCategoryName -Description $JSON.Category.WorkflowCategoryDescription -CategoryType $JSON.Category.WorkflowCategoryType
        $CategoryC.Name | Should Be $JSON.Category.WorkflowCategoryName
    }

    It -Name "Create named Script Module Category $($JSON.Category.ScriptModuleCategoryName)" -Test {

        $CategoryD = New-vROCategory -Name $JSON.Category.ScriptModuleCategoryName -Description $JSON.Category.ScriptModuleCategoryDescription -CategoryType $JSON.Category.ScriptModuleCategoryType
        $CategoryD.Name | Should Be $JSON.Category.ScriptModuleCategoryName
    }

    It -Name "Create named Resource Element Category $($JSON.Category.ResourceElementCategoryName)" -Test {

        $CategoryE = New-vROCategory -Name $JSON.Category.ResourceElementCategoryName -Description $JSON.Category.ResourceElementCategoryDescription -CategoryType $JSON.Category.ResourceElementCategoryType
        $CategoryE.Name | Should Be $JSON.Category.ResourceElementCategoryName
    }

    It -Name "Create named Configuration Element Category $($JSON.Category.ConfigurationElementCategoryName)" -Test {

        $CategoryF = New-vROCategory -Name $JSON.Category.ConfigurationElementCategoryName -Description $JSON.Category.ConfigurationElementCategoryDescription -CategoryType $JSON.Category.ConfigurationElementCategoryType
        $CategoryF.Name | Should Be $JSON.Category.ConfigurationElementCategoryName
    }

    It -Name "Create named Category Permissions by Category Id $($JSON.Category.PowervROTestId)" -Test {

        $CategoryPermissionsA = Get-vROCategory -Id $JSON.Category.PowervROTestId | Add-vROCategoryPermission -Principal $JSON.Category.PermissionsPrincipal -Rights $JSON.Category.PermissionsRights
        $CategoryPermissionsA.Principal | Should Be $JSON.Category.PermissionsPrincipal
    }

    It -Name "Return named Category Permissions by Category Id $($JSON.Category.PowervROTestId)" -Test {

        $CategoryPermissionsB = Get-vROCategoryPermission -Id $JSON.Category.PowervROTestId
        $CategoryPermissionsB.Principal | Should Be $JSON.Category.PermissionsPrincipal
    }

    It -Name "Return named Category Permissions by Pipeline for Category $($JSON.Category.PowervROTestId)" -Test {

        $CategoryPermissionsC = Get-vROCategory -Id $JSON.Category.PowervROTestId | Get-vROCategoryPermission
        $CategoryPermissionsC.Principal | Should Be $JSON.Category.PermissionsPrincipal
    }

    It -Name "Remove named Category Permissions by Category Id $($JSON.Category.PowervROTestId)" -Test {

        Get-vROCategory -Id $JSON.Category.PowervROTestId | Remove-vROCategoryPermission -Principal $JSON.Category.PermissionsPrincipal -Confirm:$false
        $CategoryPermissionsD = Get-vROCategoryPermission -Id $JSON.Category.PowervROTestId | Where-Object {$_.Principal -eq $JSON.Category.PermissionsPrincipal}
        $CategoryPermissionsD | Should Be $null
    }

    It -Name "Remove named Workflow Category $($JSON.Category.WorkflowCategoryName)" -Test {

        Get-vROCategory -CategoryType $JSON.Category.WorkflowCategoryType -Root | Where-Object {$_.Name -eq $JSON.Category.WorkflowCategoryName} | Remove-vROCategory -Confirm:$false
        try {
            $CategoryG = Get-vROCategory -CategoryType $JSON.Category.WorkflowCategoryType -Root | Where-Object {$_.Name -eq $JSON.Category.WorkflowCategoryName}
        }
        catch [Exception]{

            $Error[0].Exception | Should Be "The remote server returned an error: (404) Not Found."
        }
    }

    It -Name "Remove named Script Module Category $($JSON.Category.ScriptModuleCategoryName)" -Test {

        Get-vROCategory -CategoryType $JSON.Category.ScriptModuleCategoryType -Root | Where-Object {$_.Name -eq $JSON.Category.ScriptModuleCategoryName} | Remove-vROCategory -Confirm:$false
        try {
            $CategoryH = Get-vROCategory -CategoryType $JSON.Category.ScriptModuleCategoryType -Root | Where-Object {$_.Name -eq $JSON.Category.ScriptModuleCategoryName}
        }
        catch [Exception]{

            $Error[0].Exception | Should Be "The remote server returned an error: (404) Not Found."
        }
    }

    It -Name "Remove named Resource Element Category $($JSON.Category.ResourceElementCategoryName)" -Test {

        Get-vROCategory -CategoryType $JSON.Category.ResourceElementCategoryType -Root | Where-Object {$_.Name -eq $JSON.Category.ResourceElementCategoryName} | Remove-vROCategory -Confirm:$false
        try {
            $CategoryI = Get-vROCategory -CategoryType $JSON.Category.ResourceElementCategoryType -Root | Where-Object {$_.Name -eq $JSON.Category.ResourceElementCategoryName}
        }
        catch [Exception]{

            $Error[0].Exception | Should Be "The remote server returned an error: (404) Not Found."
        }
    }

    It -Name "Remove named Configuration Element Category $($JSON.Category.ConfigurationElementCategoryName)" -Test {

        Get-vROCategory -CategoryType $JSON.Category.ConfigurationElementCategoryType -Root | Where-Object {$_.Name -eq $JSON.Category.ConfigurationElementCategoryName} | Remove-vROCategory -Confirm:$false
        try {
            $CategoryJ = Get-vROCategory -CategoryType $JSON.Category.ConfigurationElementCategoryType -Root | Where-Object {$_.Name -eq $JSON.Category.ConfigurationElementCategoryName}
        }
        catch [Exception]{

            $Error[0].Exception | Should Be "The remote server returned an error: (404) Not Found."
        }
    }

    It -Name "Create named Workflow Category by CategoryId $($JSON.Category.WorkflowCategoryName)" -Test {

        $CategoryK = Get-vROCategory -Id $JSON.Category.PowervROTestId | New-vROCategory -Name $JSON.Category.WorkflowCategoryName -Description $JSON.Category.WorkflowCategoryDescription -CategoryType $JSON.Category.WorkflowCategoryType
        $CategoryK.Name | Should Be $JSON.Category.WorkflowCategoryName
        $CategoryK.Path | Should Be $JSON.Category.WorkflowCategoryPath
    }

    It -Name "Remove named Workflow Category by CategoryId $($JSON.Category.WorkflowCategoryName)" -Test {

        Get-vROCategory -CategoryType $JSON.Category.WorkflowCategoryType | Where-Object {$_.Name -eq $JSON.Category.WorkflowCategoryName} | Remove-vROCategory -Confirm:$false
        try {
            $CategoryL = Get-vROCategory -CategoryType $JSON.Category.WorkflowCategoryType | Where-Object {$_.Name -eq $JSON.Category.WorkflowCategoryName}
        }
        catch [Exception]{

            $Error[0].Exception | Should Be "The remote server returned an error: (404) Not Found."
        }
    }
}

# --- Cleanup
Disconnect-vROServer -Confirm:$false