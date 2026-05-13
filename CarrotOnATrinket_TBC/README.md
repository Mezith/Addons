# CarrotOnATrinket
A World of Warcraft addon. This project is archived and no longer actively maintained.

## 📘 Overview
**CarrotOnATrinket** is a lightweight World of Warcraft addon designed to automatically swap your trinket when mounting or dismounting.

It was originally built during the Burning Crusade era, when players commonly used the Riding Crop or similar mount‑speed trinkets. The addon detects when you mount, equips your chosen “mount trinket,” and 
restores your normal trinket when you dismount or leave combat.

The addon includes a simple in‑game configuration window and slash commands.

## ✨ Features
- Automatically equips a mount‑speed trinket when you mount
- Automatically restores your normal trinket when you dismount
- Detects mounts via:
  - Aura scanning (UNIT_AURA)
  - Action bar changes (ACTIONBAR_SLOT_CHANGED)
  - Loot closing / combat ending events
- Configurable:
  - Trinket name to equip when not mounted
  - On/Off toggle
- Reset button to clear saved variables
- Simple UI panel with scrollable layout
- Slash commands for quick access

## 🧩 How It Works
The addon listens to several game events:

- UNIT_AURA  
  Detects mount buffs by comparing them to a large list of known mount spell names.

- ACTIONBAR_SLOT_CHANGED  
  Detects mount items being used directly from the action bar.

- PLAYER_REGEN_ENABLED / LOOT_CLOSED  
  Used to safely re‑equip your normal trinket after combat or looting.

- PLAYER_ENTERING_WORLD  
  Initializes saved variables and opens the config menu if no settings exist.

When a mount is detected, the addon equips the mount trinket (Riding Crop by default).
When the mount buff disappears, it equips your configured normal trinket.

## 📦 Installation
1. Download the addon folder
2. Place it in:
```
World of Warcraft/_retail_/Interface/AddOns/
```
3. Restart WoW or type /reload

## 💬 Slash Commands
```
/coat config   – Opens the configuration menu
/coat help     – Shows help information
```
## ⚙️ Configuration Menu
The in‑game options window allows you to:
- Enter the name of your normal trinket
- Toggle the addon On/Off
- Reset saved variables
- View labels for “Swapping” and “Trinket” fields

The UI is built using Blizzard templates (UIPanelDialogTemplate, GameMenuButtonTemplate, etc.) and includes a scroll frame for future expansion.

## 📁 File Structure
```
CarrotOnATrinket/
  ├─ CarrotOnATrinket.toc
  ├─ CarrotOnATrinketConfig.lua   # UI and saved variable configuration
  └─ CarrotOnATrinketInit.lua     # Core logic, event handling, trinket swapping
```
## 🛠️ Notes for Developers
- Written for WoW’s older API (pre‑Cataclysm).
- Uses global saved variables:
  - CarrotOnATrinketSavpLyrTrinKeT
  - CarrotOnATrinketSavpLyrTrinKeTOnOff
- Mount detection relies on a large static list of spell names and item IDs.
- Modern WoW APIs for mounts and equipment have changed significantly.
- Anyone wishing to modernize the addon will need to:
  - Replace mount detection with C_MountJournal
  - Replace trinket swapping with EquipmentManager
  - Update event logic for retail WoW

Forks and rewrites are welcome.

## 📜 Status
This addon is archived and preserved for historical/portfolio purposes.
It may not function correctly on modern WoW clients.
