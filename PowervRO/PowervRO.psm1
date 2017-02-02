# --- Expose each Public and Private function as part of the module
foreach ($PrivateScript in Get-ChildItem -Path "$($PSScriptRoot)\Functions\Private\*.ps1" -Recurse -Verbose:$VerbosePreference) {

    . $PrivateScript.FullName
}

foreach ($Publicfunction in Get-ChildItem -Path "$($PSScriptRoot)\Functions\Public\*.ps1" -Recurse -Verbose:$VerbosePreference) {

    . $PublicFunction.FullName
}

# --- Clean up variables on module removal
$ExecutionContext.SessionState.Module.OnRemove = {

    Remove-Variable -Name vROConnection -Force -ErrorAction SilentlyContinue

}