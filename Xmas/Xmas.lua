local function eventHandler(self, event, ...)
   if event == "UNIT_INVENTORY_CHANGED" or "LOOT_SLOT_CLEARED" or "UNIT_SPELLCAST_SUCCEEDED" then
      local itEmId234 = GetInventoryItemID("player", 1)
      if itEmId234 then
         local sNameXz2, _, _, _, _, _, _, _ = GetItemInfo(itEmId234)
         if sNameXz2 == "Green Winter Hat" then
            EquipItemByName("Red Winter Hat", 1)
            EquipItemByName("Green Winter Clothes", 5)
         end
         if sNameXz2 == "Red Winter Hat" then
            EquipItemByName("Green Winter Hat", 1)
            EquipItemByName("Red Winter Clothes", 5)
         end
      end
   end
end

local frame = CreateFrame("FRAME", "FooAddonFrame");
frame:RegisterEvent("UNIT_INVENTORY_CHANGED");
frame:RegisterEvent("LOOT_SLOT_CLEARED");
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
frame:SetScript("OnEvent", eventHandler);