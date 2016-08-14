# --- Tests
Describe -Name 'Module Tests' -Fixture {

    It -Name "Attempting to import the PowervRO Module" -Test {

        $Module = Import-Module PowervRO -PassThru
        $Module.Name | Should be "PowervRO"
    }
}
