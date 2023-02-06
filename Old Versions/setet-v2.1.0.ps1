#Define various groups for simple user selection of desired applications
$groupStart = "CentStudio.CentBrowser,Discord.Discord,GPSoftware.DirectoryOpus,Microsoft.Office,Spotify.Spotify,Stardock.Fences,Valve.Steam,VideoLAN.VLC"
$groupCode = "Microsoft.VisualStudioCode,Notepad++.Notepad++"
$groupEditing = "Audacity.Audacity,GIMP.GIMP,Meltytech.Shotcut,OBSProject.OBSStudio"
$groupFiles = "7zip.7zip,RARLab.WinRAR,CodeSector.TeraCopy"
$groupHardware = "Nvidia.GeForceExperience,Logitech.LGS,Olivia.VIA"
$groupLaunchers = "BlueStack.BlueStacks,ElectronicArts.EADesktop,EpicGames.EpicGamesLauncher,Ubisoft.Connect"
$groupLeague = "RiotGames.LeagueOfLegends.NA,Blitz.Blitz"
$groupMinecraft = "Mojang.MinecraftLauncher,PolyMC.PolyMC"
$groupReading = "Calibre.Calibre,Sigil-Ebook.Sigil"
$groupTools = "CPUID.HWMonitor,Lexikos.AutoHotkey,Microsoft.PowerToys,PuTTY.PuTTY"
$groupTorrent = "PopcornTime.Popcorn-Time,qBittorrent.qBittorrent"
$groupOptional = "Obsidian.Obsidian,acaudwell.Gource,JackieLiu.NotepadsApp,FlorianHoech.DisplayCAL,Klocman.BulkCrapUninstaller,Qalculate.Qalculate,HakuNeko.HakuNeko,Tenpi.Waifu2xGUI,VentisMedia.MediaMonkey,Handbrake.Handbrake,flux.flux,Oracle.JavaRuntimeEnvironment,Google.Chrome,KristenMcWilliam.Nyrna,SomePythonThings.WingetUIStore,RustemMussabekov.Raindrop,FlawlessWidescreen.FlawlessWidescreen,"
$altGroupMaster = "1. Default Selection, 2. Coding, 3. Editing, 4. Files, 5. Hardware, 6. Launchers, 7. League, 8. Minecraft, 9. Reading, 10. Tools, 11. Torrenting, 12. Optional"
$altGroupSelection = $groupStart

#Function initialization
Function ViewGroup
    {
        foreach($app in $altGroupSelection.split(',').trim())
            {Write-Host $app}
    }
Function StartInstall
    {
        Param($group)
        foreach($app in $group.split(',').trim())
            {winget install $app -h}
        TerminateSetet
    }
Function InitializeSetet
    {
        ViewGroup
        $script:userInstallInput = Read-Host "`nWould you like to proceed with the default selection? (y/n)"
        if($userInstallInput -eq "y")
            {StartInstall $groupStart}
        elseif($userInstallInput -eq "n")
            {SelectPack}
    }
Function ProceedSetet
    {
        $script:userProceedInput = Read-Host "`nWould you like to proceed with the current selection? (y/n)"
        "`n"
        if($userProceedInput -eq "y")
            {StartInstall $altGroupSelection}
        elseif($userProceedInput -eq "n")
            {SelectPack}
    }
Function TerminateSetet
    {
        $script:userTerminateInput = Read-Host "`nWould you like to install anything further? (y/n)"
        if($userTerminateInput -eq "y")
            {SelectPack}
        elseif($userTerminateInput -eq "n")
            {"See ya next time!"
            Pause}
    }
Function SelectPack
    {
        Clear-Host
        Write-Host "Please select an alternative pack from the following list:`n"
        foreach($group in $altGroupMaster.split(',').trim()){Write-Host $group}
        $script:altSelection = Read-Host "`nPlease select an alternative pack (1-12)"
        Clear-Host
            if($altSelection -eq 1){"You selected the default pack:`n"
                    $script:altGroupSelection = $groupStart}
                elseif($altSelection -eq 2){"You selected the Code pack:`n"
                    $script:altGroupSelection = $groupCode}
                elseif($altSelection -eq 3){"You selected the Editing pack:`n"
                    $script:altGroupSelection = $groupEditing}
                elseif($altSelection -eq 4){"You selected the Files pack:`n"
                    $script:altGroupSelection = $groupFiles}
                elseif($altSelection -eq 5){"You selected the Hardware pack:`n"
                    $script:altGroupSelection = $groupHardware}
                elseif($altSelection -eq 6){"You selected the Launchers pack:`n"
                    $script:altGroupSelection = $groupLaunchers}
                elseif($altSelection -eq 7){"You selected the League pack:`n"
                    $script:altGroupSelection = $groupLeague}
                elseif($altSelection -eq 8){"You selected the Minecraft pack:`n"
                    $script:altGroupSelection = $groupMinecraft}
                elseif($altSelection -eq 9){"You selected the Reading pack:`n"
                    $script:altGroupSelection = $groupReading}
                elseif($altSelection -eq 10){"You selected the Tools pack:`n"
                    $script:altGroupSelection = $groupTools}
                elseif($altSelection -eq 11){"You selected the Torrent pack:`n"
                    $script:altGroupSelection = $groupTorrent}
                elseif($altSelection -eq 12){"You selected the Optional pack:`n"
                    $script:altGroupSelection = $groupOptional}
            else{}
        ViewGroup
        ProceedSetet
    }
Clear-Host
Write-Host "`nWelcome to the Windows Setup Script, Setet."
Write-Host "By default, this script installs the following apps:`n"
InitializeSetet