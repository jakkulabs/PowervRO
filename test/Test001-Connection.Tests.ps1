# --- Get data for the tests
$JSON = Get-Content .\Variables.json -Raw | ConvertFrom-JSON

# --- Tests
Describe -Name 'Connectivity Tests' -Fixture {

    It -Name "Attempting to connect to the vR0 Appliance $($JSON.Connection.vROServer) on port 8281" -Test {

        $Connection = New-Object Net.Sockets.TcpClient
        $Connection.ConnectASync($JSON.Connection.vROServer,8281) | Out-Null
        $Connection | Should Be $true

    }

    It -Name 'Connects to a vRO Server and generates a connection variable' -Test {

        $ConnectionPassword = ConvertTo-SecureString $JSON.Connection.Password -AsPlainText -Force
        Connect-vROServer -Server $JSON.Connection.vROServer -Username $JSON.Connection.Username -Password $ConnectionPassword -IgnoreCertRequirements
        $($Global:vROConnection.Version) | Should Be $true
    }
}

Describe -Name 'Disconnectivity Tests' -Fixture {

    It -Name 'Disconnects from a vRO Server' -Test {

        Disconnect-vROServer -Confirm:$false
        $($Global:vROConnection.Token) | Should Be $null
    }
}