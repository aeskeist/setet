#Variable initialization for groups
$userInput = $null
$groupSet = $null
$groupCore = "7zip.7zip,notepad++.notepad++,GPSoftware.DirectoryOpus,CentStudio.CentBrowser,Nvidia.GeForceExperience,Microsoft.Office,Microsoft.VisualStudioCode"
$groupAV = "VideoLAN.VLC,Spotify.Spotify,OBSProject.OBSStudio"
$groupHardware = "Logitech.LGS,Olivia.VIA"
$groupEntertainment = "Discord.Discord,Valve.Steam,EpicGames.EpicGamesLauncher,ElectronicArts.EADesktop,Blitz.Blitz,RiotGames.LeagueOfLegends.NA,FlawlessWidescreen.FlawlessWidescreen"
$groupTools = "CPUID.HWMonitor,Lexikos.AutoHotkey,Microsoft.PowerToys,Stardock.Fences,PuTTY.PuTTY"
$groupOptional = "Klocman.BulkCrapUninstaller,Qalculate.Qalculate,HakuNeko.HakuNeko,Tenpi.Waifu2xGUI,VentisMedia.MediaMonkey,Handbrake.Handbrake,flux.flux,Oracle.JavaRuntimeEnvironment,Google.Chrome,calibre.calibre,Sigil-Ebook.Sigil"

#Lists out installation options for user to select individual groups (Initial Version 1.1)
Write-Host `n 1. Core: `n
foreach ($app in $groupCore.split(',').trim()){Write-Host $app}
Write-Host `n 2. AV: `n
foreach ($app in $groupAV.split(',').trim()){Write-Host $app}
Write-Host `n 3. Hardware: `n
foreach ($app in $groupHardware.split(',').trim()){Write-Host $app}
Write-Host `n 4. Entertainment: `n
foreach ($app in $groupEntertainment.split(',').trim()){Write-Host $app}
Write-Host `n 5. Tools: `n
foreach ($app in $groupTools.split(',').trim()){Write-Host $app}
Write-Host `n 6. Optional: `n
foreach ($app in $groupOptional.split(',').trim()){Write-Host $app}
"`n"

#Prompt for user input
$userInput = Read-Host "Select an option"

#Variable formatting after user selection for script use
if($userInput -eq '1')
    {
        $groupSet = $groupCore
    }
elseif($userInput -eq '2')
    {
        $groupSet = $groupAV
    }
elseif($userInput -eq '3')
    {
        $groupSet = $groupHardware
    }
elseif($userInput -eq '4')
    {
        $groupSet = $groupEntertainment
    }
elseif($userInput -eq '5')
    {
        $groupSet = $groupTools
    }
elseif($userInput -eq '6')
    {
        $groupSet = $groupOptional
    }
else
    {
       $groupSet = $null 
    }

#Begin installation of apps in selected group following user input
foreach ($application in $groupSet.split(',').trim())
    {
        winget install $application -h
    }
