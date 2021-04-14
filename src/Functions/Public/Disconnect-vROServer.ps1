﻿function Disconnect-vROServer {
<#
    .SYNOPSIS
    Disconnect from a vRO server

    .DESCRIPTION
    Disconnect from a vRO server by removing the vROConnection script variable from PowerShell

    .EXAMPLE
    Disconnect-vROServer

    .EXAMPLE
    Disconnect-vROServer -Confirm:$false
#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]

    Param ()

    # --- Test for existing connection to vRA
    if (-not $Script:vROConnection){

        throw "vRO Connection variable does not exist. Please run Connect-vROServer first to create it"
    }

    if ($PSCmdlet.ShouldProcess($Script:vROConnection.Server)){

        try {

            # --- Remove custom Security Protocol if it has been specified
            if ($Script:vROConnection.SslProtocol -ne 'Default'){

                if (!$IsCoreCLR) {

                    [System.Net.ServicePointManager]::SecurityProtocol -= [System.Net.SecurityProtocolType]::$($Script:vROConnection.SslProtocol)
                }
            }
        }
        catch [Exception]{

            $PSCmdlet.ThrowTerminatingError($PSitem)
        }
        finally {

            # --- Remove the vROConnection script variable
            Write-Verbose -Message "Removing vROConnection script variable"
            Remove-Variable -Name vROConnection -Scope Script -Force -ErrorAction SilentlyContinue
        }
    }
}