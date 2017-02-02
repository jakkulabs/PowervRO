# --- Expose each Public function as part of the module
foreach ($Publicfunction in Get-ChildItem -Path "$($PSScriptRoot)\Functions\Public\*.ps1" -Recurse -Verbose:$VerbosePreference) {

    . $PublicFunction.FullName
}

# --- Clean up variables on module removal
$ExecutionContext.SessionState.Module.OnRemove = {

    Remove-Variable -Name vROConnection -Force -ErrorAction SilentlyContinue

}