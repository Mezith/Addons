# MaybeMount
An addon for Project Ascension (based on WoW patch 3.3.5a).
This project is archived and no longer actively maintained.

## 📘 Overview
**MaybeMount** is a fully automatic trinket‑swapping addon originally built for Project Ascension, a classless custom server running on the Wrath of the Lich King 3.3.5a client.

The addon detects when the player mounts or dismounts and equips the appropriate trinket based on the player’s level and mount type. It dynamically builds a list of the player’s learned mounts using the 3.3.5 companion API.

No configuration window, no slash commands — **it just works**.

## ✨ Features
- Automatically equips mount‑speed trinkets when mounting
- Automatically restores your normal trinket when dismounted
- Dynamically builds a mount list using:
  - GetNumCompanions("MOUNT")
  - GetCompanionInfo("MOUNT", index)
- Detects mounting through multiple event paths:
  - UNIT_AURA
  - COMPANION_UPDATE
  - COMPANION_LEARNED
  - Spellcast start/stop events
  - Combat text (“Rest”)
  - Shapeshift form changes
- Automatically saves your normal trinket
- Level‑based trinket logic:
  - Level 70: Skybreaker Whip → Riding Crop → Stick on a Carrot
  - Level 40–69: Stick on a Carrot → Carrot on a Stick
  - Below 40: Stick on a Carrot
- Fully automatic — no UI required

## 🧩 How It Works
Mount Detection
MaybeMount listens to a wide range of 3.3.5a events:
- UNIT_AURA
- COMPANION_UPDATE
- COMPANION_LEARNED
- UNIT_SPELLCAST_*
- PLAYER_TARGET_CHANGED
- PLAYER_ENTERING_WORLD
- COMBAT_TEXT_UPDATE
- UPDATE_SHAPESHIFT_FORM
- UNIT_INVENTORY_CHANGED

When a mount aura or mount companion is detected, the addon calls:
```
mOuNteDeR()
```
When no mount is detected, it calls:
```
gRoUnDeR()
```
Trinket Logic
The addon checks trinket slots 13 and 14:
- If the correct trinket is already equipped → do nothing
- If not → EquipItemByName(itemName)
Your normal trinket is automatically saved.

## 📦 Installation
1. Download the addon folder
2. Place it in:
```
ProjectAscension/Interface/AddOns/
```
(Or your equivalent 3.3.5a client path.)
3. Restart the game or type /reload

## 📁 File Structure
```
MaybeMount/
  ├─ MaybeMount.lua        # Core logic, event handling, mount detection, trinket swapping
  └─ MaybeMount.toc        # Addon metadata
```
## 🛠️ Notes for Developers
- Written specifically for Project Ascension and the 3.3.5a client.
- Uses the Wrath‑era companion API (GetCompanionInfo), which does not exist in modern retail WoW.
- Modern WoW uses C_MountJournal instead.
- Anyone modernizing this addon will need to:
- Replace mount detection
- Replace trinket swapping
- Update event handling
- Remove deprecated API calls

Forks and rewrites are welcome.

## 📜 Status
This addon is archived and preserved for historical/portfolio purposes.
It is intended for Project Ascension / 3.3.5a private server environments.
