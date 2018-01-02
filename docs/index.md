# Welcome to PowervRO
PowervRO is a PowerShell module built on top of the services exposed by the vRealize Orchestrator REST API.

Note: this module is not in any way developed or supported by anyone officially affiliated with VMware

## Compatibility

### vRealize Orchestrator

* 6.1
* 7.0
* 7.0.1

### PowerShell Editions

#### Desktop

* 5.1

#### Core

* 6.0.0-rc**

** To get up and running with PowerShell Core follow the instructions for your operating system [here](https://github.com/PowerShell/PowerShell/blob/master/README.md#get-powershell).

## Authentication

Currently PowervRO only supports basic Authentication. If you are using one of the other supported methods let us know.

## Download

PowerShell v5.1 & v6 users: You grab the latest version of the module from the PowerShell Gallery by running the following command:

```

Install-Module -Name PowervRO -Scope CurrentUser

```
## Documentation

Documentation for each command can be viewed with Get-Help, e.g.:

```
Get-Help Get-vROWorkflow
```

Alternatively check out our [Read the Docs site](http://powervro.readthedocs.org/en/latest/ "Title")
