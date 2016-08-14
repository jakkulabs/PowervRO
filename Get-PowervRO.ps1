function Get-PowervRO {
<#
    .SYNOPSIS
    Install PowervRO
    
    .DESCRIPTION
    Install PowervRO
    
    .PARAMETER Global
    Install for all users
    
    .PARAMETER ImportAfterInstall
    Import the module after a succesfull installation

    .PARAMETER InstallFromRepo
    Install latest release from github repo 

    .INPUTS
    None

    .OUTPUTS
    None

    .EXAMPLE
    Get-PowervRO

    .EXAMPLE
    Get-PowervRO -Global

    .EXAMPLE
    Get-PowervRO -Global -ImportAfterInstall

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact="High",DefaultParameterSetName="Standard")]

    Param (

    [parameter(Mandatory=$false,ParameterSetName="Standard")]
    [ValidateNotNullOrEmpty()]
    [String]$URI,

    [parameter(Mandatory=$false,ParameterSetName="Standard")]
    [ValidateNotNullOrEmpty()]
    [Switch]$Global,

    [parameter(Mandatory=$false,ParameterSetName="Standard")]
    [ValidateNotNullOrEmpty()]
    [Switch]$ImportAfterInstall

    )    

    begin {

     $Header = @"
 _____                             _____   ____  
|  __ \                           |  __ \ / __ \ 
| |__) |____      _____ _ ____   _| |__) | |  | |
|  ___/ _ \ \ /\ / / _ \ '__\ \ / /  _  /| |  | |
| |  | (_) \ V  V /  __/ |   \ V /| | \ \| |__| |
|_|   \___/ \_/\_/ \___|_|    \_/ |_|  \_\\____/                                                                                                                                                    
"@                                                                                                                

    Write-Output $Header
    Write-Output "Jakku Labs $([char]0x00A9) 2016"           
    
    }
    
    process {

        try {

            # --- Set the installtion directory
            $InstallationDir = "C:\Users\$($env:USERNAME)\Documents\WindowsPowerShell\Modules\PowervRO\"
    
            if ($PSBoundParameters.ContainsKey('Global')) {

                $InstallationDir = "C:\Program Files\WindowsPowerShell\Modules\PowervRO\"
        
            }

            Write-Verbose -Message "Intallation directory is: $($InstallationDir)"

            # --- Download and unpack the latest release

            Write-Verbose -Message "Downloading latest release from $($URI)"

            $Response = Invoke-RestMethod -Method Get -Uri $URI

            $ZipUrl = $Response.zipball_url

            $GUID = ([guid]::NewGuid()).ToString()

            $OutputFile = "$($env:TEMP)\PowervRO-$($GUID).zip"

            Invoke-RestMethod -Method Get -Uri $ZipUrl -OutFile $OutputFile

            Add-Type -assembly “system.io.compression.filesystem”

            $PowervROModulePath = $OutputFile.Substring(0, $OutputFile.LastIndexOf('.'))

            Write-Verbose -Message "Unpacking module to $($PowervROModulePath)"

            [io.compression.zipfile]::ExtractToDirectory($OutputFile, $PowervROModulePath)
          
            if ($PSCmdlet.ShouldProcess($InstallationDir)){

                # --- Remove module if it is present
                if ((Test-Path -Path $InstallationDir)){

                    Write-Verbose -Message "Removing old module"    

                    Remove-Item -Path $InstallationDir -Recurse -Force

                }

                # --- Install PowervRO
                Write-Verbose -Message "Installing PowervRO to $($InstallationDir)"

                Copy-Item -Path "$($PowervROModulePath)\*\PowervRO" -Destination $InstallationDir -Force -Recurse

                if ($PSBoundParameters.ContainsKey('ImportAfterInstall')) {

                    Write-Verbose -Message "Attempting to remove old module from session"
                    Remove-Module -Name "PowervRO" -Force -ErrorAction SilentlyContinue

                    Write-Verbose -Message "Importing module"
                    Import-Module -Name "PowervRO" -Force

                }

                Write-Verbose -Message "Installation complete"

            }
        }
        catch [Exception]{

            throw
        }
    }
    end {

        Write-Verbose -Message "Removing temporary file $($OutputFile)"
        Remove-item -Path $OutputFile -Recurse -Force -ErrorAction SilentlyContinue -Confirm:$false

        Write-Verbose -Message "Removing temporary directory $($PowervROModulePath)"
        Remove-Item -Path $PowervROModulePath -Recurse -Force -ErrorAction SilentlyContinue -Confirm:$false

        }            
 
}

# --- Install PowervRO for the current user
Get-PowervRO -URI "https://api.github.com/repos/jakkulabs/PowervRO/releases/latest" -ImportAfterInstall -Verbose