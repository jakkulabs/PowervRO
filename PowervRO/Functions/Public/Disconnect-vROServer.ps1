function Disconnect-vROServer {
<#
    .SYNOPSIS
    Disconnect from a vRO server

    .DESCRIPTION
    Disconnect from a vRO server by removing the global vRAConnection variable from PowerShell

    .EXAMPLE
    Disconnect-vROServer

    .EXAMPLE
    Disconnect-vROServer -Confirm:$false
#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]

    Param ()

    # --- Test for existing connection to vRA
    if (-not $Global:vROConnection){

        throw "vRO Connection variable does not exist. Please run Connect-vROServer first to create it"
    }

    if ($PSCmdlet.ShouldProcess($Global:vROConnection.Server)){

        try {

            # --- Remove custom Security Protocol if it has been specified
            if ($Global:vROConnection.SslProtocol -ne 'Default'){

                if ($PSVersionTable.PSEdition -eq "Desktop" -or !$PSVersionTable.PSEdition) {

                    [System.Net.ServicePointManager]::SecurityProtocol -= [System.Net.SecurityProtocolType]::$($Global:vROConnection.SslProtocol)
                }
            }
        }
        catch [Exception]{

            $PSCmdlet.ThrowTerminatingError($PSitem)
        }
        finally {

            # --- Remove the global PowerShell variable
            Write-Verbose -Message "Removing vROConnection Global Variable"
            Remove-Variable -Name vROConnection -Scope Global -Force -ErrorAction SilentlyContinue
        }
    }
}