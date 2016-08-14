<#

.SYNOPSIS
Wrapper for PSake build file

#>

[cmdletbinding()]

Param (

    [Parameter(Mandatory=$false)]
    [ValidateSet('Build','Release')]
    [String]$Task = 'Build', 

    [Parameter(Mandatory=$false)]
    [ValidateSet('Major','Minor','Patch')]
    [String]$BuildVersion = 'Patch'

)

# --- Build Parameters
$BaseDirectory = (Resolve-Path -Path .).Path
$BinDirectory = "$($BaseDirectory)\bin"
$ModulePath = "$($BaseDirectory)\PowervRO"
$ModuleManifest = "$($ModulePath)\PowervRO.psd1"

$Parameters = @{

    BaseDirectory = $BaseDirectory
    BinDirectory = $BinDirectory
    ModulePath = $ModulePath
    ModuleManifest = $ModuleManifest
    BuildVersion = $BuildVersion

}

# --- Build Dependencies
$Dependencies = @(

    "PSake",
    "Pester",
    "PSScriptAnalyzer",
    "$($BinDirectory)\Update-MKDocsYML.psm1",
    "$($BinDirectory)\Update-ModuleDocumentation.psm1",
    "$($BinDirectory)\Update-ModuleManifestVersion.psm1",
    "$($BinDirectory)\Update-ModuleManifestFunctions.psm1"

)

$Dependencies | % {Import-Module -Name $_ -Force}

# --- Start Build
Invoke-psake -buildFile "$($PSScriptRoot)\bin\psake.build.ps1" -taskList $Task -parameters $Parameters -nologo -Verbose:$VerbosePreference