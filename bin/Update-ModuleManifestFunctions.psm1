function Update-ModuleManifestFunctions {
<#

.SYNOPSIS
Bump the version of a module manifest file

.DESCRIPTION
Increment the version number of a module manifest file by following the Semantic Versioning standard -> http://semver.org/

It is possible to update either the MAJOR,MINOR or PATCH patch version of the module depending on what changes have been made
to the module.

.PARAMETER Path
The path to the module manifest file

.PARAMETER Major
Increase the major version of the module by 1

.PARAMETER Minor
Increase the minor version of the module by 1

.PARAMETER Patch
Increase the patch version of the module by 1

.INPUTS
System.String
System.Diagnostics.Switch

.OUTPUTS
None

.EXAMPLE
Update-ModuleManifestVersion -Path .\ModuleManifest.psd1 -Major

.EXAMPLE
Update-ModuleManifestVersion -Path .\ModuleManifest.psd1 -Minor

.EXAMPLE
Update-ModuleManifestVersion -Path .\ModuleManifest.psd1 -Patch

#>

[CmdletBinding()]

    Param (

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$Path

    )

    Write-Verbose -Message "Working with manifest file $($Path)"

    if (!(Test-Path -Path $Path)) {

        throw "Could not find file: $($Path)"

    }

    $ModuleManifest = Get-Item -Path $Path

    Write-Verbose -Message "Searching for functions in $("$($ModuleManifest.DirectoryName)")"

    $ModuleRoot = $ModuleManifest.DirectoryName.Split("\")[-1]

    $Functions = Get-ChildItem -Path "$($ModuleManifest.DirectoryName)" -Filter '*.psm1' -Recurse | Sort-Object

    $FunctionsToExport  = $Functions | Select-Object -ExpandProperty BaseName | Sort-Object
    $NestedModules = $Functions | % {$_.FullName.Substring($_.FullName.IndexOf($ModuleRoot)+$ModuleRoot.Length).Trim("\")}

    Write-Verbose -Message "Found $($Functions.Count) function(s)"

    if (!$Functions) {

        throw "No functions found"

    }

    Update-ModuleManifest -Path $Path -NestedModules $NestedModules -FunctionsToExport $FunctionsToExport -CmdletsToExport * -AliasesToExport * -VariablesToExport * -Verbose:$VerbosePreference

}