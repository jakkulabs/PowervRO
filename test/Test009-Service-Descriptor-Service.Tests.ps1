# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Startup
$Connection = Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $JSON.Connection.Password -Port $JSON.Connection.Port -IgnoreCertRequirements

# --- Tests
Describe -Name 'Service Descriptor Tests' -Fixture {

    It -Name "Get Available API Endpoints" -Test {

        $APIEndpoints = Get-vROAPIEndpoint
        $APIEndpoints.Count | Should BeGreaterThan 0

    }

    It -Name "Get vRO Version" -Test {

        [Version]$Version = (Get-vROVersion).Version
        $Version.Major | Should BeGreaterThan 5

    }

}

# --- Cleanup
Disconnect-vROServer -Confirm:$false