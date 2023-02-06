$InstallGroup = @{
    Default = "GPSoftware.DirectoryOpus,Nvidia.GeForceExperience,Microsoft.Office,Discord.Discord,Spotify.Spotify,VideoLAN.VLC,Olivia.VIA";
    Editing = "Microsoft.VisualStudioCode,Handbrake.Handbrake,KDE.Krita,KDE.KritaShellExtension";
    Launchers = "ElectronicArts.EADesktop,EpicGames.EpicGamesLauncher,Ubisoft.Connect,Valve.Steam,PrismLauncher.PrismLauncher";
    League = "Blitz.Blitz,RiotGames.LeagueOfLegends.NA";
    Tools = "Lexikos.AutoHotkey,Microsoft.PowerToys,PuTTY.PuTTY";
    Optional = "FlawlessWidescreen.FlawlessWidescreen,FlorianHoech.DisplayCAL,flux.flux,HakuNeko.HakuNeko,Klocman.BulkCrapUninstaller,Stardock.Fences"
}
function DefaultInstall
    {
        switch($proceed)
        {
            "y" {foreach($app in $InstallGroup.Default.split(',').trim()){winget install $app -h}}
            "n" {AltView}
            Default {AltView}
        }
    }
function AltView
    {
        Clear-Host
        Write-Host "Please select an application pack to view:`n" -f Magenta
        Write-Color -C Green -S Keys
        $AltSelect = Read-Host "`nEntry"
        Clear-Host
        Write-Host "Would you like to proceed with this choice?`n" -f Magenta
        switch($AltSelect)
        {
            "Default" {Write-Color -s Default -c Red,Green}
            "Editing" {Write-Color -s Editing -c Red,Green}
            "Tools" {Write-Color -s Tools -c Red,Green}
            "Launchers" {Write-Color -s Launchers -c Red,Green}
            "League" {Write-Color -s League -c Red,Green}
            "Optional" {Write-Color -s Optional -c Red,Green}
            Default {Write-Color -s Default -c Red,Green}
        }
        $ConfirmChoice = Read-Host "`ny/N"
        switch($ConfirmChoice)
        {
            "y" {AltInstall}
            "n" {AltView}
            Default {AltView}
        }
    }
function AltInstall
    {
        switch($AltSelect)
        {
            "Default" {foreach($app in $InstallGroup.Default.split(',').trim()){winget install $app -h}}
            "Editing" {foreach($app in $InstallGroup.Editing.split(',').trim()){winget install $app -h}}
            "Tools" {foreach($app in $InstallGroup.Tools.split(',').trim()){winget install $app -h}}
            "Launchers" {foreach($app in $InstallGroup.Launchers.split(',').trim()){winget install $app -h}}
            "League" {foreach($app in $InstallGroup.League.split(',').trim()){winget install $app -h}}
            "Optional" {foreach($app in $InstallGroup.Optional.split(',').trim()){winget install $app -h}}
            Default {foreach($app in $InstallGroup.Default.split(',').trim()){winget install $app -h}}
        }
        CompleteInstall
    }
function CompleteInstall
    {
        Write-Host "Would you like to install anything else?"
        $CompleteSelect = Read-Host "y/N"
        switch($CompleteSelect)
        {
            "y" {AltView}
            "n" {Write-Host "See you next time!"}
            Default {Write-Host "See you next time!"}
        }
    }
function Write-Color
    {
    param (
        [Parameter()]
        $MainGroup = $InstallGroup,
        [Parameter()]
        $SubGroup = $null,
        [Parameter(Mandatory)]
        [ConsoleColor[]]$Color
    )
    switch($MainGroup)
    {
        $InstallGroup {foreach($app in $MainGroup.$SubGroup.split(',')){Write-Host $app -f $Color}}
        Default {foreach($app in $MainGroup.split(',')){Write-Host $app -f $Color}}
    }
    }
Clear-Host
Write-Host "Welcome to the Setet script!`nThis is designed to help install some basic apps for new OS installs.`nWould you like to proceed with the default selection?`n" -f Magenta
Write-Color -S Default -C Red,Green
$proceed = Read-Host "`ny/N"
DefaultInstall