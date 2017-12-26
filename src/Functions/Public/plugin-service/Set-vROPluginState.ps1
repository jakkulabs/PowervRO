function Set-vROPluginState {
<#
    .SYNOPSIS
    Sets the state of a vRO plugin
    
    .DESCRIPTION
    Sets the state of a vRO plugin
    
    .PARAMETER Name
    The name of the plugin

    .PARAMETER Enabled
    A boolean value to decide whether or not the plugin is enabled

    .INPUTS
    System.String.

    .OUTPUTS
    None

    .EXAMPLE
    Remove-vROPlugin -Name ExamplePlugin -Enabled:$True

    .EXAMPLE
    Remove-vROPlugin -Name ExamplePlugin -Enabled:$False

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]

    Param (

    [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelinebyPropertyName=$true)]
    [ValidateNotNullOrEmpty()]
    [String[]]$Name,

    [parameter(Mandatory=$true)]
    [bool]$Enabled

    )    

    begin {
    
    }
    
    process {    

        foreach ($PluginName in $Name){

            $URI = "/vco/api/plugins/$($PluginName)/state"

            try {

                $Body = @"

                    {

                        "enabled": $($Enabled.toString().toLower())

                    }

"@

                if ($PSCmdlet.ShouldProcess($PluginName)){

                    # --- Run vRO REST Request
                    Invoke-vRORestMethod -Uri $URI -Method PUT -Body $Body -Verbose:$VerbosePreference | Out-Null

                }

            }
            catch [Exception]{

                throw

            }

        }

    }
    end {
        
    }

}