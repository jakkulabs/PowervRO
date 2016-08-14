# Welcome to PowervRO
PowervRO is a PowerShell module built on top of the services exposed by the vRealize Orchestrator REST API.

Note: this module is not in any way developed or supported by anyone officially affiliated with VMware

## Compatibility

**vRO: versions 6.0.1, 6.0.4 and 7.0.1 have been tested**

**PowerShell: version 4** is required.  We haven't tested yet with version 5, although we wouldn't expect significant issues.

## Download

PowerShell v5 users: You grab the latest version of the module from the PowerShell Gallery by running the following command:

```
Install-Module -Name PowervRO
```

PowerShell v4 users: Try this handy one liner to download and install the module:

```
(new-object Net.WebClient).DownloadString("https://raw.githubusercontent.com/jakkulabs/PowervRO/master/Get-PowervRO.ps1") | iex
```
## Documentation

Documentation for each command can be viewed with Get-Help, e.g.:

```
Get-Help Get-vROWorkflow
```