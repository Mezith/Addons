local hatNamEs = true

local function eventHandler(self, event, ...)
   if event == "TRADE_SKILL_SHOW" then
      local itEmId2234 = GetInventoryItemID("player", 1)
      local cooKnIg2, _ = GetTradeSkillTools(GetNumTradeSkills())
      if cooKnIg2 == "Cooking Fire" then
          if itEmId2234 then
             local sNameXz32, _, _, _, _, _, _, _ = GetItemInfo(itEmId2234)
              if sNameXz32 ~= "Chef's Hat" then
                hatNamEs = sNameXz32
                EquipItemByName("Chef's Hat", 1)
			  end  
		  end
      end
   end
   if event == "TRADE_SKILL_CLOSE" then
       if hatNamEs ~= true then
           local itEmId23234 = GetInventoryItemID("player", 1)
           if itEmId23234 then
             local sName2Xz32, _, _, _, _, _, _, _ = GetItemInfo(itEmId23234)
              if sName2Xz32 == "Chef's Hat" then
                EquipItemByName(hatNamEs, 1)
                hatNamEs = true
			  end
		   end
	   end
   end 
end

local frame = CreateFrame("FRAME", "FooAddonFrame");
frame:RegisterEvent("TRADE_SKILL_SHOW");
frame:RegisterEvent("TRADE_SKILL_CLOSE");
frame:SetScript("OnEvent", eventHandler);