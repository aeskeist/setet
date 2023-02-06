#Define various groups for simple user selection of desired applications
$groupStart = "Blitz.Blitz,CPUID.HWMonitor,Discord.Discord,Google.Chrome,GPSoftware.DirectoryOpus,Microsoft.Office,Microsoft.VisualStudioCode,Nvidia.GeForceExperience,Obsidian.Obsidian,Olivia.VIA,RiotGames.LeagueOfLegends.NA,Spotify.Spotify,Stardock.Fences,Valve.Steam,VideoLAN.VLC"
$groupEditing = "Audacity.Audacity,GIMP.GIMP,Handbrake.Handbrake,Meltytech.Shotcut,OBSProject.OBSStudio"
$groupFiles = "7zip.7zip,RARLab.WinRAR,CodeSector.TeraCopy"
$groupLaunchers = "ElectronicArts.EADesktop,EpicGames.EpicGamesLauncher,Ubisoft.Connect"
$groupMinecraft = "EclipseAdoptium.Temurin.17.JRE,PolyMC.PolyMC"
$groupTools = "Lexikos.AutoHotkey,Microsoft.PowerToys,PuTTY.PuTTY"
$groupOptional = "FlawlessWidescreen.FlawlessWidescreen,FlorianHoech.DisplayCAL,flux.flux,HakuNeko.HakuNeko,Klocman.BulkCrapUninstaller,Qalculate.Qalculate,Tenpi.Waifu2xGUI"
$altGroupMaster = "1. Default Selection, 2. Editing, 3. Files, 4. Launchers, 5. Minecraft, 6. Tools, 7. Optional"
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
                elseif($altSelection -eq 2){"You selected the Editing pack:`n"
                    $script:altGroupSelection = $groupEditing}
                elseif($altSelection -eq 3){"You selected the Files pack:`n"
                    $script:altGroupSelection = $groupFiles}
                elseif($altSelection -eq 4){"You selected the Launchers pack:`n"
                    $script:altGroupSelection = $groupLaunchers}
                elseif($altSelection -eq 5){"You selected the Minecraft pack:`n"
                    $script:altGroupSelection = $groupMinecraft}
                elseif($altSelection -eq 6){"You selected the Tools pack:`n"
                    $script:altGroupSelection = $groupTools}
                elseif($altSelection -eq 7){"You selected the Optional pack:`n"
                    $script:altGroupSelection = $groupOptional}
            else{}
        ViewGroup
        ProceedSetet
    }
Clear-Host
Write-Host "`nWelcome to the Windows Setup Script, Setet."
Write-Host "By default, this script installs the following apps:`n"
InitializeSetet