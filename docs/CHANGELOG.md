# Version 2.1.0

## Features
* Feature #19 - Added CategoryId parameter to Get-vROWorkflow
* Feature #17 - Added Set-vROResourceElement function (@roniyako)

## Fixes
* Fixed #21 - Issue with Execution Property Output from Invoke-vROWorkflow

# Version 2.0.3

## Fixes
* Fixed #15 - Object returned by Invoke-vROWorkflow can not be pipelined to other cmdlets (@voroniys)

# Version 2.0.2

## Fixes
* Fixed #12 - Export-vROResourceElement not UTF8 friendly

# Version 2.0.1

## Features
* Feature - Listed as PS Core compatible module in PS Gallery

## Fixes
* Fixed #9 - Typo: $Global:vRAConnection

# Version 2.0.0

## Breaking Changes
**WARNING: This release contains breaking changes**
* The minmum supported PowerShell Versions have been raised to the following:
  * Windows PowerShell: 5.1
  * PowerShell Core: 6.0.0-rc**

## Features
* Feature - Updates to support PowerShell Core
* Feature - Set the default Security Protocol on Windows PS to be Tls12
* Feature - Updates to use $IsCoreCLR inbuilt variable
* Feature - Module restructured to single PSM1 file
