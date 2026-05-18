local mOunTlIst = {}
local AFSDcsa2 = true

function eventHandler(self, event, ...)
    if event == "ADDON_LOADED" then
		mOuNteDeRLiSt_maker()
    end
    if event == "UNIT_INVENTORY_CHANGED" then
		setVariB()
    end
    if event == "PLAYER_TARGET_CHANGED" then
        if UnitCanAttack("player", "target") then
		    AFSDcsa2 = false
            if not InCombatLockdown() then
                EquipIfNeeded(tRiNkeTsAv)
			end
        else
            AFSDcsa2 = true
            gETAuraUnitbUfF()
		end
	end
    if AFSDcsa2 == true then
        if event == "COMBAT_TEXT_UPDATE" then
            local _, bnngdsa2_A = ...
            if bnngdsa2_A == "Rest" then
	            gRoUnDeR()
		    end
	    end
        if event == "COMPANION_LEARNED" then
	        mOuNteDeRLiSt_maker()
	    end
        if event == "PLAYER_ENTERING_WORLD" or event == "UNIT_AURA" then
	        gETAuraUnitbUfF()
	    end
        if event == "UNIT_SPELLCAST_STOP" or event == "UNIT_SPELLCAST_CHANNEL_STOP" or event == "UPDATE_SHAPESHIFT_FORM" then
			gRoUnDeR()
        end
        if event == "COMPANION_UPDATE" then
            local arg1 = ...
            if arg1 == "MOUNT" then
                gETAuraUnitbUfF()
            end
        end
        if event == "PLAYER_REGEN_ENABLED" or event == "LOOT_CLOSED" then
            gRoUnDeR()
        end
	end
end

function gETAuraUnitbUfF()
    if not isCastingOrChanneling() and not UnitIsDeadOrGhost("player") then
        local mountFound = false
        for booFNuM = 1, 40 do
            local nameX3 = UnitBuff("player", booFNuM)
            if nameX3 ~= nil then
                for _, vsX3 in ipairs(mOunTlIst) do
                    if vsX3 == nameX3 then
                        mOuNteDeR()
                        mountFound = true
                        break
                    end
                end
            end
        end
        if not mountFound then
            gRoUnDeR()
        end
	end
end

function gRoUnDeR()
    if not InCombatLockdown() and not IsMounted() and not UnitIsDeadOrGhost("player") then
        EquipIfNeeded(tRiNkeTsAv)
    end
end

function mOuNteDeR()
    setVariB()
    if UnitLevel("player") == 70 then
        EquipIfNeeded("Skybreaker Whip")
        EquipIfNeeded("Riding Crop")
        EquipIfNeeded("Stick on a Carrot")
    elseif UnitLevel("player") >= 40 and UnitLevel("player") < 70 then
        EquipIfNeeded("Stick on a Carrot")
        EquipIfNeeded("Carrot on a Stick")
    else
        EquipIfNeeded("Stick on a Carrot")
	end
end

function mOuNteDeRLiSt_maker()
    mOuNteDeRLiSt_clear()
    for i=1,GetNumCompanions("MOUNT") do
        local _, creatureName, _, _, _ = GetCompanionInfo("MOUNT", i);
        table.insert(mOunTlIst, creatureName)
    end
end

function mOuNteDeRLiSt_clear() 
	wipe(mOunTlIst)
end

function EquipIfNeeded(itemName)
    for slot = 13, 14 do
        local link = GetInventoryItemLink("player", slot)
        if link and link:find(itemName) then return end
    end
    EquipItemByName(itemName)
end

function isCastingOrChanneling()
    return UnitCastingInfo("player") ~= nil or UnitChannelInfo("player") ~= nil
end

function setVariB()
    local link = GetInventoryItemLink("player", 13)
    if link then
        local name = GetItemInfo(link)
        if name and not (
            name == "Skybreaker Whip" or
            name == "Riding Crop" or
            name == "Stick on a Carrot" or
            name == "Carrot on a Stick"
        ) then
            tRiNkeTsAv = link
        end
    end
    return tRiNkeTsAv
end

local MYfraMe = CreateFrame("FRAME"); MYfraMe:RegisterEvent("ADDON_LOADED"); MYfraMe:RegisterEvent("PLAYER_TARGET_CHANGED"); MYfraMe:RegisterEvent("UNIT_AURA"); MYfraMe:RegisterEvent("ITEM_USED");
MYfraMe:RegisterEvent("UNIT_SPELLCAST_SENT"); MYfraMe:RegisterEvent("UNIT_SPELLCAST_STOP"); MYfraMe:RegisterEvent("COMBAT_TEXT_UPDATE"); MYfraMe:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START");
MYfraMe:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP"); MYfraMe:RegisterEvent("UNIT_INVENTORY_CHANGED"); MYfraMe:RegisterEvent("PLAYER_ENTERING_WORLD"); MYfraMe:RegisterEvent("COMPANION_LEARNED");
MYfraMe:RegisterEvent("COMPANION_UPDATE"); MYfraMe:RegisterEvent("PLAYER_REGEN_ENABLED"); MYfraMe:RegisterEvent("LOOT_CLOSED");MYfraMe:RegisterEvent("UPDATE_SHAPESHIFT_FORM"); 
MYfraMe:SetScript("OnEvent", eventHandler);