# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Startup
$ConnectionPassword = ConvertTo-SecureString $JSON.Connection.Password -AsPlainText -Force
$Connection = Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $ConnectionPassword -Port $JSON.Connection.Port -IgnoreCertRequirements

# --- Tests
Describe -Name 'Plugin Tests' -Fixture {

    It -Name "Return Installed Plugins $($JSON.Plugin.Name)" -Test {

        $InstalledPlugins = Get-vROPlugin
        $InstalledPlugins.Count | Should Not Be 0

    }

    It -Name "Export Plugin" -Test {

        $ExportedPlugin = Export-vROPlugin -Name $JSON.Plugin.ExportedPluginName -Path $JSON.Plugin.ExportPath
        $ExportedPlugin | Should Not Be $null

    }

    It -Name "Import Plugin" -Test {

        Import-vROPlugin -File $JSON.Plugin.ImportedPluginFile -Format $JSON.Plugin.ImportedPluginFormat -Overwrite -Confirm:$false
        $ImportedPlugin = Get-vROPlugin | Where-Object {$_.Name -eq $JSON.Plugin.ImportedPluginName}
        $ImportedPlugin | Should Not Be $null
        $ImportedPlugin.Name | Should Be $JSON.Plugin.ImportedPluginName

    }

    It -Name "Disable Plugin" -Test {

        Set-vROPluginState -Name $JSON.Plugin.ImportedPluginName -Enabled:$False -Confirm:$False
        $ImportedPlugin = Get-vROPlugin | Where-Object {$_.Name -eq $JSON.Plugin.ImportedPluginName}
        $ImportedPlugin.Enabled | Should Be "False"

    }

    It -Name "Enable Plugin" -Test {

        Set-vROPluginState -Name $JSON.Plugin.ImportedPluginName -Enabled:$True -Confirm:$False
        $ImportedPlugin = Get-vROPlugin | Where-Object {$_.Name -eq $JSON.Plugin.ImportedPluginName}
        $ImportedPlugin.Enabled | Should Be "True"

    }

}

# --- Cleanup
Remove-Item -Path "$($JSON.Plugin.ExportPath)\*" -Force -ErrorAction SilentlyContinue
Disconnect-vROServer -Confirm:$false