#Variable initialization for groups
$primaryStart = $null
$secondaryStart = $null
$primarySelection = $null
$secondarySelection = $null
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

#Function initialization
Function ViewGroup
    {
        Param($group)
        foreach($app in $group.split(',').trim()){Write-Host $app}
        Write-Host "`n"
    }

Function ViewSelection
    {
        foreach($app in $secondarySelection.split(',').trim()){Write-Host $app}
        Write-Host "`n"
    }

Function StartInstall
    {
        Param($group)
        foreach($app in $group.split(',').trim()){winget install $app -h}
    }

Function SelectPack
    {
        Param($primary)
        if($primary -eq 1){$secondarySelection = $groupStart}
        elseif($primary -eq 2){$secondarySelection = $groupCode}
        elseif($primary -eq 3){$secondarySelection = $groupEditing}
        elseif($primary -eq 4){$secondarySelection = $groupFiles}
        elseif($primary -eq 5){$secondarySelection = $groupHardware}
        elseif($primary -eq 6){$secondarySelection = $groupLaunchers}
        elseif($primary -eq 7){$secondarySelection = $groupLeague}
        elseif($primary -eq 8){$secondarySelection = $groupMinecraft}
        elseif($primary -eq 9){$secondarySelection = $groupReading}
        elseif($primary -eq 10){$secondarySelection = $groupTools}
        elseif($primary -eq 11){$secondarySelection = $groupTorrent}
        elseif($primary -eq 12){$secondarySelection = $groupOptional}
        Write-Host "Test"
    }

#Begin execution of initial script
Write-Host "`nWelcome to the Winget-powered setup script! `nWould you like to proceed with the default selection?`n"
ViewGroup $groupStart
$primaryStart = Read-Host "y/n"

if($primaryStart -eq "y"){StartInstall $groupStart}
    elseif($primaryStart -eq "n"){$primarySelection = Read-Host "`nPlease select an alternative pack (1-12)"}

SelectPack
