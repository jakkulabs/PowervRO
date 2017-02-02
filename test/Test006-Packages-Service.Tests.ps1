# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Startup
$Connection = Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $JSON.Connection.Password -Port $JSON.Connection.Port -IgnoreCertRequirements

# --- Tests
Describe -Name 'Package Tests' -Fixture {

    It -Name "Return named Package by Name $($JSON.Package.Name)" -Test {

        $PackageA = Get-vROPackage -Name $JSON.Package.Name
        $PackageA.Name | Should Be $JSON.Package.Name
    }

    It -Name "Create named Package Permissions by Package Name $($JSON.Package.Name)" -Test {

        $PackagePermissionsA = Get-vROPackage -Name $JSON.Package.Name | Add-vROPackagePermission -Principal $JSON.Package.PermissionsPrincipal -Rights $JSON.Package.PermissionsRights
        $PackagePermissionsA.Principal | Should Be $JSON.Package.PermissionsPrincipal
    }

    It -Name "Return named Package Permissions by Package Name $($JSON.Package.Name)" -Test {

        $PackagePermissionsB = Get-vROPackagePermission -Name $JSON.Package.Name
        $PackagePermissionsB.Principal | Should Be $JSON.Package.PermissionsPrincipal
    }

    It -Name "Return named Package Permissions by Pipeline for Package $($JSON.Package.Name)" -Test {

        $PackagePermissionsC = Get-vROPackage -Name $JSON.Package.Name | Get-vROPackagePermission
        $PackagePermissionsC.Principal | Should Be $JSON.Package.PermissionsPrincipal
    }

    It -Name "Remove named Package Permissions by Package Name $($JSON.Package.Name)" -Test {

        Get-vROPackage -Name $JSON.Package.Name | Remove-vROPackagePermission -Principal $JSON.Package.PermissionsPrincipal -Confirm:$false
        $PackagePermissionsD = Get-vROPackagePermission -Name $JSON.Package.Name| Where-Object {$_.Principal -eq $JSON.Package.PermissionsPrincipal}
        $PackagePermissionsD | Should Be $null
    }

    It -Name "Export named Package by Name $($JSON.Package.Name)" -Test {

        $ExportedPackageA = Export-vROPackage -Name $JSON.Package.Name -File $JSON.Package.PackageOutputFile
        $ExportedPackageA.FullName | Should Be $JSON.Package.PackageOutputFile
    }

    It -Name "Export named Package by Pipeline for Package $($JSON.Package.Name)" -Test {

        $ExportedPackageB = Get-vROPackage -Name $JSON.Package.Name | Export-vROPackage -File $JSON.Package.PackageOutputFile
        $ExportedPackageB.FullName | Should Be $JSON.Package.PackageOutputFile
    }

    It -Name "Remove named Package by Package Name $($JSON.Package.Name)" -Test {

        Remove-vROPackage -Name $JSON.Package.Name -Confirm:$false
        try {

            $PackageB = Get-vROPackage -Name $JSON.Package.Name
        }
        catch [Exception]{

        }
        $PackageB | Should Be $null
    }

    It -Name "Import named Package by Name $($JSON.Package.Name)" -Test {

        $ImportedPackageA = Import-vROPackage -File $JSON.Package.PackageOutputFile -Confirm:$false
        $ImportedPackageA.Name | Should Be $JSON.Package.Name
    }
}

# --- Cleanup
Disconnect-vROServer -Confirm:$false