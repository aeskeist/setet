# Setet
Winget Install Script

Setet is a concantenation of "Setup" and "Winget". 

This script is intended to help facilitate quick & simple batch installations using Winget.

The script allows users to select 'packs' or 'groups' of applications to install.

Upon selecting and confirming a group, the script will begin automatically downloading and "silently" installing the applications within said group. 
  "Silently" is marked in quotes as the installs are not always silent. Due to UAC prompts, and the lack of a "silent" installation option for some apps,
  prompts will still most likely be seen by the user. UAC prompts can be mitigated by running the script "as Administrator," but this does not affect
  applications without a "silent" installation option. 
  
Planned features:

"Cycle-back" - Re-prompt for user selection following successful group install.

"Multiple group selection" - Allow user to select multiple groups for batch installation.

"Individual selection" - Allow user to select individual applications from specific groups and create unique "batches" for installation.
