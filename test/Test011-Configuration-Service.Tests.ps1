# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Startup
$Connection = Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $JSON.Connection.Password -Port $JSON.Connection.Port -IgnoreCertRequirements

# --- Create Category
$Category = New-vROCategory -Name $JSON.Configuration.CategoryName -CategoryType ConfigurationElementCategory 

# --- Tests
Describe -Name 'Configuration Element Tests' -Fixture {

    It -Name "Import named Configuration Element" -Test {

        Import-vROConfigurationElement -File $JSON.Configuration.FileName -CategoryId $Category.Id -Confirm:$False
        $ImportedConfigurationElement = Get-vROConfigurationElement | Where-Object {$_.Name -eq $JSON.Configuration.Name}
        $ImportedConfigurationElement.Name | Should Be $JSON.Configuration.Name

    }

    It -Name "Return named Configuration Element" -Test {

        $ConfigurationElement = Get-vROConfigurationElement | ? {$_.Name -eq $JSON.Configuration.Name}
        $ConfigurationElement.Name | Should Be $JSON.Configuration.Name
    }

    It -Name "Create named Configuration Element Permissions" -Test {

        $ConfigurationElement = Get-vROConfigurationElement | ? {$_.Name -eq $JSON.Configuration.Name}
        $Permission = Add-vROConfigurationElementPermission -Id $ConfigurationElement.Id -Principal $JSON.Configuration.PermissionsPrincipal -Rights $JSON.Configuration.PermissionsRights -Confirm:$False
        $Permission.Principal | Should be $JSON.Configuration.PermissionsPrincipal

    }

    It -Name "Return named Configuration Element Permissions" -Test {

        $ConfigurationElement = Get-vROConfigurationElement | Where-Object {$_.Name -eq $JSON.Configuration.Name}
        $Permissions = Get-vROConfigurationElementPermission -Id $ConfigurationElement.Id
        $Permissions.Principal | Should Be $JSON.Configuration.PermissionsPrincipal

    }

    It -Name "Return named Configuration Element Permissions by Pipeline" -Test {

        $ConfigurationElement = Get-vROConfigurationElement | Where-Object {$_.Name -eq $JSON.Configuration.Name}
        $Permissions = $ConfigurationElement | Get-vROConfigurationElementPermission
        $Permissions.Principal | Should Be $JSON.Configuration.PermissionsPrincipal

    }

    It -Name "Remove named Configuration Element Permissions" -Test {

        $ConfigurationElement = Get-vROConfigurationElement | Where-Object {$_.Name -eq $JSON.Configuration.Name}
        $ConfigurationElement | Remove-vROConfigurationElementPermission -Principal $JSON.Configuration.PermissionsPrincipal -Confirm:$False
        $Permission = $ConfigurationElement | Get-vROConfigurationElementPermission | Where-Object {$_.Principal -eq $JSON.Configuration.PermissionsPrincipal}
        $Permission | Should Be $Null

    }

    It -Name "Export named Configuration Element" -Test {

        $ConfigurationElement = Get-vROConfigurationElement | Where-Object {$_.Name -eq $JSON.Configuration.Name}
        $ExportedConfigurationElement = Export-vROConfigurationElement -Id $ConfigurationElement.Id -Path $JSON.Configuration.ExportPath
        $ExportedConfigurationElement | Should Not Be $Null

    }

    It -Name "Export named Configuration Element by Pipeline" -Test {

        $ConfigurationElement = Get-vROConfigurationElement | Where-Object {$_.Name -eq $JSON.Configuration.Name}
        $ExportedConfigurationELement = $ConfigurationElement | Export-vROConfigurationElement -Path $JSON.Configuration.ExportPath
        $ExportedConfigurationElement | Should Not Be $Null

    }

    It -Name "Remove named Configuration Element" -Test {

        $ConfigurationElement = Get-vROConfigurationElement | Where-Object {$_.Name -eq $JSON.Configuration.Name}
        Remove-vROConfigurationElement -Id $ConfigurationElement.Id -Confirm:$False

        $RemovedConfigurationElement = Get-vROConfigurationElement | Where-Object {$_.Name -eq $JSON.Configuration.Name}
        $RemovedConfigurationElement | Should Be $Null

    }

}

# --- Cleanup
Remove-vROCategory -Id $Category.ID -Confirm:$false
Remove-Item -Path "$($JSON.Configuration.ExportPath)\*" -Force -ErrorAction SilentlyContinue
Disconnect-vROServer -Confirm:$false