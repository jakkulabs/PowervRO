# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Tests
Describe -Name 'Connectivity Tests' -Fixture {

    It -Name "Attempting to ping the vRO Server $($JSON.Connection.vROServer)" -Test {

        $Ping = Test-Connection -ComputerName $JSON.Connection.vROServer -Quiet
        $Ping | Should be $true
    }

    It -Name 'Connects to a vRO Server and generates a connection variable' -Test {

        Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $JSON.Connection.Password -IgnoreCertRequirements
        $($Global:vROConnection.Version) | Should Be $true
    }
}

Describe -Name 'Disconnectivity Tests' -Fixture {

    It -Name 'Disconnects from a vRO Server' -Test {

        Disconnect-vROServer -Confirm:$false
        $($Global:vROConnection.Token) | Should Be $null
    }
}