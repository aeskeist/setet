### Variable Initialization ###
$installGroup = "Discord.Discord,GPSoftware.DirectoryOpus,Microsoft.Office,Spotify.Spotify,Stardock.Fences,Valve.Steam,Microsoft.VisualStudioCode,Notepad++.Notepad++,Nvidia.GeForceExperience,Olivia.VIA,RiotGames.LeagueOfLegends.NA,Blitz.Blitz,CPUID.HWMonitor,Lexikos.AutoHotkey,Microsoft.PowerToys,Oracle.JavaRuntimeEnvironment,Google.Chrome"

### Computer Configuration Tasks ###
# Set hostname [INPUT REQUIRED]
$inputHost = Read-Host "Computer Name:"
Rename-Computer -NewName $inputHost

# Set network private
Set-NetConnectionProfile -InterfaceAlias Ethernet1 -NetworkCategory "Private"

# Set time zone
Set-TimeZone -Id "Eastern Standard Time"

### Computer Baseline Tasks ###
# Install NuGet Provider
Install-PackageProvider -Name NuGet -Force

# Install PSWindowsUpdate Module //
Install-Module PSWindowsUpdate

# Set Execution Policy for Untrusted Scripts //
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Start Windows Updates //
Get-WindowsUpdate -AcceptAll -Install

