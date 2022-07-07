#Variable initialization for groups
$primaryStart = $null
$secondaryStart = $null
$primarySelection = $null
$secondarySelection = $null
$groupStart = "CentStudio.CentBrowser,Discord.Discord,GPSoftware.DirectoryOpus,Microsoft.Office,Spotify.Spotify,Stardock.Fences,Valve.Steam,VideoLAN.VLC"
$groupCode = "acaudwell.Gource,JackieLiu.NotepadsApp,Microsoft.VisualStudioCode,Notepad++.Notepad++,Obsidian.Obsidian"
$groupEditing = "Audacity.Audacity,GIMP.GIMP,Meltytech.Shotcut,OBSProject.OBSStudio"
$groupFiles = "7zip.7zip,RARLab.WinRAR,CodeSector.TeraCopy"
$groupHardware = "Nvidia.GeForceExperience,Logitech.LGS,Olivia.VIA"
$groupLaunchers = "BlueStack.BlueStacks,ElectronicArts.EADesktop,EpicGames.EpicGamesLauncher,Ubisoft.Connect"
$groupLeague = "RiotGames.LeagueOfLegends.NA,Blitz.Blitz"
$groupMinecraft = "Mojang.MinecraftLauncher,PolyMC.PolyMC"
$groupReading = "Calibre.Calibre,Sigil-Ebook.Sigil"
$groupTools = "CPUID.HWMonitor,Lexikos.AutoHotkey,Microsoft.PowerToys,PuTTY.PuTTY"
$groupTorrent = "PopcornTime.Popcorn-Time,qBittorrent.qBittorrent"
$groupOptional = "Klocman.BulkCrapUninstaller,Qalculate.Qalculate,HakuNeko.HakuNeko,Tenpi.Waifu2xGUI,VentisMedia.MediaMonkey,Handbrake.Handbrake,flux.flux,Oracle.JavaRuntimeEnvironment,Google.Chrome,KristenMcWilliam.Nyrna,SomePythonThings.WingetUIStore,RustemMussabekov.Raindrop,FlawlessWidescreen.FlawlessWidescreen,"

#Function initialization
Function script:ViewGroup
    {
        Param($group)
        foreach($app in $group.split(',').trim()){Write-Host $app}
        Write-Host "`n"
    }

Function script:ViewSelectedApps
    {
        foreach($app in $secondarySelection.split(',').trim()){Write-Host $app}
        Write-Host "`n"
    }

Function script:StartInstall
    {
        Param($group)
        foreach($app in $group.split(',').trim()){winget install $app -h}
    }

Function script:SelectPack
    {
        $script:primarySelection = Read-Host "`nPlease select an alternative pack (1-12)"
        "`n"
    }

Function script:SetSecondaryPack
    {
        if($primarySelection -eq 1){$script:secondarySelection = $groupStart}
            elseif($primarySelection -eq 2){$script:secondarySelection = $groupCode}
            elseif($primarySelection -eq 3){$script:secondarySelection = $groupEditing}
            elseif($primarySelection -eq 4){$script:secondarySelection = $groupFiles}
            elseif($primarySelection -eq 5){$script:secondarySelection = $groupHardware}
            elseif($primarySelection -eq 6){$script:secondarySelection = $groupLaunchers}
            elseif($primarySelection -eq 7){$script:secondarySelection = $groupLeague}
            elseif($primarySelection -eq 8){$script:secondarySelection = $groupMinecraft}
            elseif($primarySelection -eq 9){$script:secondarySelection = $groupReading}
            elseif($primarySelection -eq 10){$script:secondarySelection = $groupTools}
            elseif($primarySelection -eq 11){$script:secondarySelection = $groupTorrent}
            elseif($primarySelection -eq 12){$script:secondarySelection = $groupOptional}
            else{}
    }

Function script:DisplaySelectedGroup
    {
        if($primarySelection -eq 1){"You selected the default pack:"}
            elseif($primarySelection -eq 2){"You selected the Code pack:"}
            elseif($primarySelection -eq 3){"You selected the Editing pack:"}
            elseif($primarySelection -eq 4){"You selected the Files pack:"}
            elseif($primarySelection -eq 5){"You selected the Hardware pack:"}
            elseif($primarySelection -eq 6){"You selected the Launchers pack:"}
            elseif($primarySelection -eq 7){"You selected the League pack:"}
            elseif($primarySelection -eq 8){"You selected the Minecraft pack:"}
            elseif($primarySelection -eq 9){"You selected the Reading pack:"}
            elseif($primarySelection -eq 10){"You selected the Tools pack:"}
            elseif($primarySelection -eq 11){"You selected the Torrent pack:"}
            elseif($primarySelection -eq 12){"You selected the Optional pack:"}
            else{}
        "`n"
    }

#Begin execution of initial script
Write-Host "`nWelcome to the Winget-powered setup script! `nWould you like to proceed with the default selection?`n"
ViewGroup $groupStart
$primaryStart = Read-Host "y/n"

if($primaryStart -eq "y"){StartInstall $groupStart}
    elseif($primaryStart -eq "n")
        {
            SelectPack
            SetSecondaryPack
            DisplaySelectedGroup
            ViewSelectedApps
        }

Write-Host "`nWould you like to proceed with this selection?`n"
$secondaryStart = Read-Host "y/n"

While($secondaryStart -eq "n" -or "$null")
    {
        SelectPack
        SetSecondaryPack
        DisplaySelectedGroup
        ViewSelectedApps
        Write-Host "`nWould you like to proceed with this selection?`n"
        $secondaryStart = Read-Host "y/n"
    }

if($secondaryStart -eq "y"){StartInstall $secondarySelection}
