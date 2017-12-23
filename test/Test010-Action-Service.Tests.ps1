# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Startup
$ConnectionPassword = ConvertTo-SecureString $JSON.Connection.Password -AsPlainText -Force
$Connection = Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $ConnectionPassword -Port $JSON.Connection.Port -IgnoreCertRequirements

# --- Create Category
$Category = New-vROCategory -Name $JSON.Action.CategoryName -CategoryType ScriptModuleCategory

# --- Tests
Describe -Name 'Action Tests' -Fixture {

    It -Name "Import named Action" -Test {

        Import-vROAction -File $JSON.Action.FileName -CategoryName $JSON.Action.CategoryName -Confirm:$False
        $ImportedAction = Get-vROAction -Name $JSON.Action.Name -Category $Category.Name
        $ImportedAction.Name | Should Be $JSON.Action.Name

    }

    It -Name "Return named Action" -Test {

        $Action = Get-vROAction -Name $JSON.Action.Name -Category $Category.Name
        $Action.Name | Should Be $JSON.Action.Name

    }

    It -Name "Create named Action Permissions" -Test {

        $Action = Get-vROAction -Name $JSON.Action.Name -Category $Category.Name
        $Permission = Add-vROActionPermission -Id $Action.Id -Principal $JSON.Action.PermissionsPrincipal -Rights $JSON.Action.PermissionsRights -Confirm:$False
        $Permission.Principal | Should Be $JSON.Action.PermissionsPrincipal

    }

    It -Name "Return named Action Permissions" -Test {

        $Action = Get-vROAction -Name $JSON.Action.Name -Category $Category.Name
        $Permissions = Get-vROActionPermission -Id $Action.Id
        $Permissions.Principal | Should Be $JSON.Action.PermissionsPrincipal

    }

    It -Name "Return named Action Permissions by Pipeline" -Test {

        $Action = Get-vROAction -Name $JSON.Action.Name -Category $Category.Name
        $Permissions = $Action | Get-vROActionPermission
        $Permissions.Principal | Should Be $JSON.Action.PermissionsPrincipal

    }

    It -Name "Remove named Action Permissions" -Test {

        $Action = Get-vROAction -Name $JSON.Action.Name -Category $Category.Name
        $Action | Remove-vROActionPermission -Principal $JSON.Action.PermissionsPrincipal -Confirm:$False
        $Permission = $Action | Get-vROActionPermission | Where-Object {$_.Principal -eq $JSON.Resource.PermissionsPrincipal}
        $Permission | Should Be $Null

    }

    It -Name "Export named Action" -Test {

        $Action = Get-vROAction -Name $JSON.Action.Name -Category $Category.Name
        $ExportedAction = Export-vROAction -Id $Action.Id -Path $JSON.Action.ExportPath
        $ExportedAction | Should Not Be $Null

    }

    It -Name "Export named Action by Pipeline" -Test {

        $Action = Get-vROAction -Name $JSON.Action.Name -Category $Category.Name
        $ExportedAction = $Action | Export-vROAction -Path $JSON.Action.ExportPath
        $ExportedAction | Should Not Be $Null

    }

    It -Name "Invoke Action" -Test {

        $Parameter = New-vROParameterDefinition -Name $JSON.Action.ParameterName -Value $JSON.Action.ParameterValue -Type $JSON.Action.ParameterType
        $Action = Get-vROAction -Name $JSON.Action.Name -Category $Category.Name
        $Result = $Action | Invoke-vROAction -Parameters $Parameter

        $($Result.Value | Select-Object -ExpandProperty $JSON.Action.ParameterType).value | Should Be $JSON.Action.ExpectedResult

    }

    It -Name "Remove named Action" -Test {

        $Action = Get-vROAction -Name $JSON.Action.Name -Category $Category.Name
        $Action | Remove-vROAction -Confirm:$false

        $RemovedAction = Get-vROAction | Where-Object {$_.Name -eq $JSON.Action.Name}
        $RemovedAction | Should Be $Null

    }

}

# --- Cleanup
Remove-vROCategory -Id $Category.ID -Confirm:$false
Remove-Item -Path "$($JSON.Action.ExportPath)\*" -Force -ErrorAction SilentlyContinue
Disconnect-vROServer -Confirm:$false