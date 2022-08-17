#Variable initialization for groups

$inputUser = $null
$inputView = $null
$inputGroup = $null
$inputStart = $null
$inputBegin = $null
$groupStart = "CentStudio.CentBrowser,Discord.Discord,GPSoftware.DirectoryOpus,Microsoft.Office,Nvidia.GeForceExperience,Spotify.Spotify,Stardock.Fences,Valve.Steam,VideoLAN.VLC"
$groupCode = "acaudwell.Gource,JackieLiu.NotepadsApp,Microsoft.VisualStudioCode,Notepad++.Notepad++,Obsidian.Obsidian"
$groupEditing = "Audacity.Audacity,GIMP.GIMP,Meltytech.Shotcut,OBSProject.OBSStudio"
$groupFiles = "7zip.7zip,RARLab.WinRAR,CodeSector.TeraCopy"
$groupHardware = "Logitech.LGS,Olivia.VIA"
$groupLaunchers = "BlueStack.BlueStacks,ElectronicArts.EADesktop,EpicGames.EpicGamesLauncher,Ubisoft.Connect"
$groupLeague = "RiotGames.LeagueOfLegends.NA,Blitz.Blitz"
$groupMinecraft = "Mojang.MinecraftLauncher,PolyMC.PolyMC"
$groupReading = "Calibre.Calibre,Sigil-Ebook.Sigil"
$groupTools = "CPUID.HWMonitor,Lexikos.AutoHotkey,Microsoft.PowerToys,PuTTY.PuTTY"
$groupTorrent = "PopcornTime.Popcorn-Time,qBittorrent.qBittorrent"
$groupOptional = "Klocman.BulkCrapUninstaller,Qalculate.Qalculate,HakuNeko.HakuNeko,Tenpi.Waifu2xGUI,VentisMedia.MediaMonkey,Handbrake.Handbrake,flux.flux,Oracle.JavaRuntimeEnvironment,Google.Chrome,KristenMcWilliam.Nyrna,SomePythonThings.WingetUIStore,RustemMussabekov.Raindrop,FlawlessWidescreen.FlawlessWidescreen,"

#Lists out installation options for user to select individual groups (Initial Version 1.2)
foreach ($app in $groupStart.split(',').trim()){Write-Host $app}
Write-Host "Would you like to install the default group?"
$inputStart = Read-Host "Select: y/n"

if($inputStart -eq 'y')
    {
        foreach ($app in $groupStart.split(',').trim())
            {
                winget install $app -h
            }
    }
    else
    {
        $inputView = Read-Host "Select a pack to view: `n 1. Default `n 2. Code `n 3. Editing `n 4. Files `n 5. Hardware `n 6. Launchers `n 7. League `n 8. Minecraft `n 9. Reading `n 10. Tools `n 11. Torrent `n 12. Optional `n Input"
    }

#Display application list after user input
if($inputView -eq '1')
    {
        foreach ($app in $groupStart.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '2')
    {
        foreach ($app in $groupCode.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '3')
    {
        foreach ($app in $groupEditing.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '4')
    {
        foreach ($app in $groupFiles.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '5')
    {
        foreach ($app in $groupHardware.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '6')
    {
        foreach ($app in $groupLaunchers.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '7')
    {
        foreach ($app in $groupLeague.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '8')
    {
        foreach ($app in $groupMinecraft.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '9')
    {
        foreach ($app in $groupReading.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '10')
    {
        foreach ($app in $groupTools.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '11')
    {
        foreach ($app in $groupTorrent.split(',').trim()){Write-Host $app}
    }
    elseif($inputView -eq '12')
    {
        foreach ($app in $groupOptional.split(',').trim()){Write-Host $app}
    }
    else
    {
       $inputGroup = $null 
    }

$inputStart = Read-Host "Would you like to begin?"

#Begin installation of apps in selected group following user input
if($inputStart -eq "y")
    {
        foreach ($app in $inputGroup.split(',').trim())
    {
        winget install $app -h
    }
}
else{
    Write-Host "`n 1. Default `n 2. Code `n 3. Editing `n 4. Files `n 5. Hardware `n 6. Launchers `n 7. League `n 8. Minecraft `n 9. Reading `n 10. Tools `n 11. Torrent `n 12. Optional"
    $inputView = Read-Host "Select a pack to view"
    
}