# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Startup
$ConnectionPassword = ConvertTo-SecureString $JSON.Connection.Password -AsPlainText -Force
$Connection = Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $ConnectionPassword -Port $JSON.Connection.Port -IgnoreCertRequirements

# --- Create Category
$Category = New-vROCategory -Name $JSON.Configuration.CategoryName -CategoryType ResourceElementCategory

# --- Tests
Describe -Name 'Resource Element Tests' -Fixture {

    It -Name "Import named Resource Element" -Test {

        Import-vROResourceElement -File $JSON.Resource.FileName -CategoryId $Category.Id -Confirm:$False
        $ImportedResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        $ImportedResourceElement.Name | Should Be $JSON.Resource.Name

    }

    It -Name "Return named Resource Element" -Test {

        $ResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        $ResourceElement.Name | Should Be $JSON.Resource.Name
    }

    It -Name "Create named Resource Element Permissions" -Test {

        $ResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        $Permission = Add-vROResourceElementPermission -Id $ResourceElement.Id -Principal $JSON.Resource.PermissionsPrincipal -Rights $JSON.Resource.PermissionsRights -Confirm:$False
        $Permission.Principal | Should be $JSON.Resource.PermissionsPrincipal

    }

    It -Name "Return named Resource Element Permissions" -Test {

        $ResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        $Permissions = Get-vROResourceElementPermission -Id $ResourceElement.Id
        $Permissions.Principal | Should Be $JSON.Resource.PermissionsPrincipal

    }

    It -Name "Return named Resource Element Permissions by Pipeline" -Test {

        $ResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        $Permissions = $ResourceElement | Get-vROResourceElementPermission
        $Permissions.Principal | Should Be $JSON.Resource.PermissionsPrincipal

    }

    It -Name "Remove named Resource Element Permissions" -Test {

        $ResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        $ResourceElement | Remove-vROResourceElementPermission -Principal $JSON.Resource.PermissionsPrincipal -Confirm:$False
        $Permission = $ResourceElement | Get-vROResourceElementPermission | Where-Object {$_.Principal -eq $JSON.Resource.PermissionsPrincipal}
        $Permission | Should Be $Null

    }

    It -Name "Export named Resource Element" -Test {

        $ResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        $ExportedResourceElement = Export-vROResourceElement -Id $ResourceElement.Id -Path $JSON.Resource.ExportPath
        $ExportedResourceElement | Should Not Be $Null

    }

    It -Name "Export named Resource Element by Pipeline" -Test {

        $ResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        $ExportedResourceELement = $ResourceElement | Export-vROResourceElement -Path  $JSON.Resource.ExportPath
        $ExportedResourceElement | Should Not Be $Null

    }

    It -Name "Remove named Resource Element" -Test {

        $ResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        Remove-vROResourceElement -Id $ResourceElement.Id -Confirm:$False

        $RemovedResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        $RemovedResourceElement | Should Be $Null

    }
    
    It -Name "Set named Resource Element" -Test {

        Set-vROResourceElement -File $JSON.Resource.FileName -ResourceID $Resource.Id -Confirm:$False
        $SetResourceElement = Get-vROResourceElement | Where-Object {$_.Name -eq $JSON.Resource.Name}
        $SetResourceElement.Name | Should Be $JSON.Resource.Name

    }

}

# --- Cleanup
Remove-vROCategory -Id $Category.ID -Confirm:$false
Remove-Item -Path "$($JSON.Resource.ExportPath)\*" -Force -ErrorAction SilentlyContinue
Disconnect-vROServer -Confirm:$false
