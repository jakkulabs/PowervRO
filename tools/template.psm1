<#
  _____                             _____   ____  
 |  __ \                           |  __ \ / __ \ 
 | |__) |____      _____ _ ____   _| |__) | |  | |
 |  ___/ _ \ \ /\ / / _ \ '__\ \ / /  _  /| |  | |
 | |  | (_) \ V  V /  __/ |   \ V /| | \ \| |__| |
 |_|   \___/ \_/\_/ \___|_|    \_/ |_|  \_\\____/ 
#>

# --- Clean up vRAConnection variable on module remove
$ExecutionContext.SessionState.Module.OnRemove = {

    Remove-Variable -Name vRAConnection -Force -ErrorAction SilentlyContinue

}