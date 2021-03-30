![Process PS Module](https://github.com/jakkulabs/PowervRO/actions/workflows/ps-module.yml/badge.svg) ![](https://img.shields.io/powershellgallery/v/PowervRO) ![](https://img.shields.io/powershellgallery/dt/PowervRO)

# Welcome to PowervRO
PowervRO is a PowerShell module built on top of the services exposed by the vRealize Orchestrator REST API.

Note: this module is not in any way developed or supported by anyone officially affiliated with VMware

## Compatibility

### vRealize Orchestrator

||||
| --- | --- | --- |
|6.1|7.0|7.0.1|

### PowerShell Editions

|Edition|Version|
| --- | --- |
|Desktop|5.1|
|Core|6.0.0-rc**|

** To get up and running with PowerShell Core follow the instructions for your operating system [here](https://github.com/PowerShell/PowerShell/blob/master/README.md#get-powershell).

## Authentication

Currently PowervRO only supports basic Authentication. If you are using one of the other supported methods let us know.

## Download

PowerShell v5.1 & v6 users: You grab the latest version of the module from the PowerShell Gallery by running the following command:

```PowerShell
Install-Module -Name PowervRO -Scope CurrentUser
```

## Running Locally
When developing, use the provided build script and import the module that is inside the Release directory.

You **do not** have to manually edit src\PowervRO.psd1 when adding new functions

```PowerShell
# --- Run the build script
.\tools\build.ps1

# --- Import release module
Import-Module .\Release\PowervRO\PowervRO.psd1 -Force
```
The default build will run some quick tests to catch any errors before you push your changes.
## Documentation

Documentation for each command can be viewed with Get-Help, e.g.:

```PowerShell
Get-Help Get-vROWorkflow
```

or online [here](https://jakkulabs.github.io/PowervRO/).
