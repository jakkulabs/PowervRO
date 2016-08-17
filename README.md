# Welcome to PowervRO
PowervRO is a PowerShell module built on top of the services exposed by the vRealize Orchestrator REST API.

Note: this module is not in any way developed or supported by anyone officially affiliated with VMware

## Compatibility

**vRO: version 6.1, 7.0 and 7.0.1**

**PowerShell: version 4 and 5**

## Authentication

Currently PowervRO only supports basic Authentication. If you are using one of the other supported methods let us know.

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

Alternatively check out our [Read the Docs site](http://powervro.readthedocs.org/en/latest/ "Title")
