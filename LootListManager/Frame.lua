-- Author      : Mezith
-- Create Date : 4/25/2023 4:45:09 PM

local _, core = ...;
core.Config = {};

local Config = core.Config;

function Config:Toggle2()
    local menu = Frame_3;
	menu:SetShown(not menu:IsShown());
end

function Config:Toggle()
	local menu = Frame_1;
	menu:SetShown(not menu:IsShown());
end

table_23 = {
    "Green Items & Above",
    "Blue Items & Above",
    "Purple Items",
}

completelist = {}
comparelist = {}
pointslist = {}
plaYerRolllist = {}
plaYrsShorTlist = {}
pLaYRspointslist = {}
plaYerRollamount = {}
num_43 = 0
winnerList = {}
InDeX = 0
asda_IndEx = 0
lootIcon2 = ""
itsaboolL_23 = true
itsaboXolL_23 = true
it_sa_boo_lL_23 = true
ib_32 = 1

if disEnchAnTe_R == nil then
    disEnchAnTe_R = UnitName("player")
end
		
if type(LootlistbackUp23) ~=  "table" then
    LootlistbackUp23 = {}
end

if type(LootlistTest23) ~=  "table" then
    LootlistTest23 = {}
end

local function OnClick_dropDown(self)
    UIDropDownMenu_SetSelectedID(DropDownMenuTest, self:GetID())
    disEnchAnTe_R = PartPlYRList[self:GetID()]
end

local function initialize(self, level)
    local iNuM = GetNumGroupMembers();
    if iNuM ~= 0 then
        CreatePLyRList()
	else 
        PartPlYRList = {}
        local arg21 = UnitName("player")
        table.insert(PartPlYRList, arg21)
	end
   local info = UIDropDownMenu_CreateInfo()
   for k,v in pairs(PartPlYRList) do
      info = UIDropDownMenu_CreateInfo()
      info.text = v
      info.value = v
      info.func = OnClick_dropDown
      UIDropDownMenu_AddButton(info, level)
   end
    if disEnchAnTe_R ~= UnitName("player") then
        for i, v in pairs(PartPlYRList) do
            if v == disEnchAnTe_R then
                local id_if = i
			end
		end
        if id_if ~= nil then
	        UIDropDownMenu_SetSelectedID(DropDownMenuTest, id_if)
		else
            PartPlYRList = {}
            local arg_21 = UnitName("player")
            table.insert(PartPlYRList, arg_21)
		end
	end
end

local function OnClick_dropDown2(self)
    UIDropDownMenu_SetSelectedID(DropDownMenuTest2, self:GetID())
    looTThResHolD = self:GetID()
end

local function initialize2(self, level)
   local info = UIDropDownMenu_CreateInfo()
   for k,v in pairs(table_23) do
      info = UIDropDownMenu_CreateInfo()
      info.text = v
      info.value = v
      info.func = OnClick_dropDown2
      UIDropDownMenu_AddButton(info, level)
   end
    if looTThResHolD ~= nil then
        UIDropDownMenu_SetSelectedID(DropDownMenuTest2, looTThResHolD)
    end
end

function Frame_3_OnLoad()
    if not DropDownMenuTest then
    CreateFrame("Button", "DropDownMenuTest", Frame_3, "UIDropDownMenuTemplate")
    end
     if not DropDownMenuTest2 then
    CreateFrame("Button", "DropDownMenuTest2", Frame_3, "UIDropDownMenuTemplate")
	 end
    DropDownMenuTest2:ClearAllPoints()
    DropDownMenuTest2:SetPoint("CENTER", 0, -50)
    DropDownMenuTest2:Show()
    DropDownMenuTest:ClearAllPoints()
    DropDownMenuTest:SetPoint("CENTER", 0, 0)
    DropDownMenuTest:Show()
    Frame_3:Hide()
end

function Frame_3_OnShow()
    UIDropDownMenu_Initialize(DropDownMenuTest2, initialize2)
    UIDropDownMenu_SetWidth(DropDownMenuTest2, 140);
    UIDropDownMenu_SetButtonWidth(DropDownMenuTest2, 164)
    UIDropDownMenu_SetSelectedID(DropDownMenuTest2, 1)
    UIDropDownMenu_JustifyText(DropDownMenuTest2, "LEFT")
    UIDropDownMenu_Initialize(DropDownMenuTest, initialize)
    UIDropDownMenu_SetWidth(DropDownMenuTest, 140);
    UIDropDownMenu_SetButtonWidth(DropDownMenuTest, 164)
    UIDropDownMenu_SetSelectedID(DropDownMenuTest, 1)
    UIDropDownMenu_JustifyText(DropDownMenuTest, "LEFT")
    if disEnchAnTe_R ~= nil then
	    UIDropDownMenu_SetText(DropDownMenuTest, disEnchAnTe_R)
	end
    if looTThResHolD ~= nil then
        UIDropDownMenu_SetText(DropDownMenuTest2, table_23[looTThResHolD])
    end
end

function Frame_1_OnLoad()
    Frame_1:Hide()
    child = CreateFrame("Frame", nil, ScrollFrame_1);
	child:SetSize(436, 500);
	ScrollFrame_1:SetScrollChild(child);
	ScrollFrame_1.ScrollBar:ClearAllPoints();
	ScrollFrame_1.ScrollBar:SetPoint("TOPLEFT", ScrollFrame_1, "TOPRIGHT", -12, -18);
	ScrollFrame_1.ScrollBar:SetPoint("BOTTOMRIGHT", ScrollFrame_1, "BOTTOMRIGHT", -7, 18);
end

function Frame_1_OnShow()
    if it_sa_boo_lL_23 == true then
        creataEButtons()
    else
        Shift_buTTons()
	end
end	

function creataEButtons()
    n = -5
    local i = #LootlistbackUp23
    for fgi_num = #LootlistbackUp23, 1, -1 do
        if fgi_num == #LootlistbackUp23 then
	        btn = CreateButton("TOPLEFT", child, "TOP", -225, n, LootlistbackUp23[fgi_num], ib_32, i);
        elseif fgi_num == #LootlistbackUp23 - 1 then
            n = n - 7
            CreateButton("TOPLEFT", btn, "TOP", -200, n, LootlistbackUp23[fgi_num], ib_32, i);
        elseif fgi_num < #LootlistbackUp23 - 1 then
            n = n - 12
            CreateButton("TOPLEFT", btn, "TOP", -200, n, LootlistbackUp23[fgi_num], ib_32, i);
		end
        i = i - 1
        ib_32 = ib_32 + 1
	end
    it_sa_boo_lL_23 = false
end	

function Shift_buTTons()
    for inum_34s = 1, ib_32 - 1 do
        _G["button_1_" .. inum_34s]:Disable()
        _G["button_1_" .. inum_34s]:Hide()
    end
    creataEButtons()
end

function CreateButton(point, relativeFrame, relativePoint, xOffset, yOffset, text, i, inDeX)
    local sc_X49Gpoints = string.match(text, "%d+")
    local sc_X49Gplayer = string.match(text, "%a+")
    local j = "button_1_" .. i
    local jn_8 = LootlistTest23[sc_X49Gplayer][tonumber(sc_X49Gpoints)]
    local jn_9 = string.match(jn_8, "%a.+")
	local btn = CreateFrame("Button", j, ScrollFrame_1, "AutoCompleteButtonTemplate");
	btn:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset);
	btn:SetSize(400, 10);
	btn:SetText(sc_X49Gplayer .. " was given " .. jn_9:sub(1, -2));
	btn:SetNormalFontObject("GameFontNormal");
	btn:SetHighlightFontObject("GameFontHighlight");
    btn:SetScript("OnClick", function() LootlistTest23[sc_X49Gplayer][tonumber(sc_X49Gpoints)] = jn_8:sub(1, -2) table.remove(LootlistbackUp23, inDeX) Shift_buTTons() end)
	return btn;
end

function Frame_2_OnLoad()
    Frame_2:Hide()
    Frame_2:RegisterEvent("LOOT_SLOT_CLEARED");
    Frame_2:RegisterEvent("CHAT_MSG_ADDON");
    Frame_2:RegisterEvent("LOOT_CLOSED");
	Frame_2:RegisterEvent("CHAT_MSG_SYSTEM");
    Frame_2:RegisterEvent("LOOT_OPENED");
    Frame_2:RegisterEvent("ADDON_LOADED");
    C_ChatInfo.RegisterAddonMessagePrefix("LLM-BX10")
end

local defaults = {
	theme = {
		r = 0, 
		g = 0.8, -- 204/255
		b = 1,
		hex = "00ccff"
	}
}

function Config:GetThemeColor()
	local c = defaults.theme;
	return c.r, c.g, c.b, c.hex;
end

core.commands = {
    ["config"] = core.Config.Toggle2,
    ["restore"] = core.Config.Toggle,
	["log"] = core.Config.Toggle,
	
	["help"] = function()
		print(" ");
		core:Print("List of slash commands:")
        core:Print("|cff00cc66/llm config|r -Shows the Config Menu");
		core:Print("|cff00cc66/llm log or restore|r -Shows the Logging/Restore Menu");
		core:Print("|cff00cc66/llm |r - Shows this list of slash Commands");
		print(" ");
	end,

};

local function HandleSlashCommands(str)	
	if (#str == 0) then	
		-- User just entered "/llm" with no additional args.
		core.commands.help();
		return;		
	end	
	
	local args = {};
	for _, arg in ipairs({ string.split(' ', str) }) do
		if (#arg > 0) then
			table.insert(args, arg);
		end
	end
	
	local path = core.commands; -- required for updating found table.
	
	for id, arg in ipairs(args) do
		if (#arg > 0) then -- if string length is greater than 0.
			arg = arg:lower();			
			if (path[arg]) then
				if (type(path[arg]) == "function") then				
					-- all remaining args passed to our function!
					path[arg](select(id + 1, unpack(args))); 
					return;					
				elseif (type(path[arg]) == "table") then				
					path = path[arg]; -- another sub-table found!
				end
			else
				-- does not exist!
				core.commands.help();
				return;
			end
		end
	end
end

function core:Print(...)
    local hex = select(4, self.Config:GetThemeColor());
    local prefix = string.format("|cff%s%s|r", hex:upper(), "Loot List Manager:");	
    DEFAULT_CHAT_FRAME:AddMessage(string.join(" ", prefix, ...));
end

function Frame_2_OnEvent(self, event, ...)
    if event == "ADDON_LOADED" then
        if (... ~= "LootListManager") then return end 
	    SLASH_LootListManager1 = "/llm";
	    SlashCmdList.LootListManager = HandleSlashCommands;
        core:Print("is loaded. Type /llm to list Slash Commands!")
	end
    if event == "CHAT_MSG_ADDON" then
        arg1, arg2, arg3, arg4 = ...
        if arg1 == "LLM-BX10"then
            if arg3 == "RAID" then
                lootmethod, masterlooterPartyID, masterlooterRaidID = GetLootMethod()
                if lootmethod == "master" and masterlooterPartyID == 0 then
                    local chunks = {}
                    for substring in arg2:gmatch("%S+") do
                        table.insert(chunks, substring)
                    end
                    LootlistTest23[tostring(chunks[1])][tonumber(chunks[2])] = LootlistTest23[tostring(chunks[1])][tonumber(chunks[2])] .. "~"
		        end
            elseif arg3 == "WHISPER" then
                if itsaboXolL_23 == true then
                    set_RollWindOW(arg2)
			    end
		    end
		end
	end
    if event == "LOOT_SLOT_CLEARED" then
        if itsaboolL_23 == true then
            foundItem()
	    end
	end
    if event == "LOOT_CLOSED" then
        itsaboolL = false
	end
    if event == "LOOT_OPENED" then
        lootmethod, masterlooterPartyID, masterlooterRaidID = GetLootMethod()
        if lootmethod == "master" and masterlooterPartyID == 0 then
            if itsaboolL_23 == true then
                foundItem()
	        end
		end
	end
    if event == "CHAT_MSG_SYSTEM" then
        local arg1 = ...
        local arg_1 = string.sub(arg1, -7)
        if arg1 == "You leave the group." or arg1 == "Your group has been disbanded." or arg1 == "You have been removed from the group." then
		    disEnchAnTe_R = UnitName("player")
		end
        if arg_1 == "(1-100)" then
            if itsaboolL == true then
                rollOutLoot(...)
		    end
		end
	end
end

function set_RollWindOW(arg1)
    local scX4_2_Gpoints = string.match(arg1, "%d+")
    asda_IndEx = scX4_2_Gpoints
    local itemName, itemLink, _, _, _, _, _, _, _, itemTexture, _, _, _, _, _, _, _ = GetItemInfo(arg1)
    CheckButton_13:Disable();
    CheckButton_13:SetNormalTexture(itemTexture)
    FontString_4:SetText(itemLink)
    itsaboXolL_23 = false
    RaidNotice_AddMessage(RaidWarningFrame,"You have 30 seconds to roll for " .. itemLink,ChatTypeInfo["RAID_WARNING"]);
    Frame_2:Show()
    FontString_3:SetText(30 .. "'s")
    for i3_num3 = 1, 30 do
        C_Timer.After(i3_num3, function() FontString_3:SetText(30 - i3_num3 .. "'s") end)
	end
    C_Timer.After(35, function() Frame_2:Hide() itsaboXolL_23 = true end)
end

function rollOutLoot(...)
    if ... then
        local chat_info_ACz = tostring(...)
        local chunks = {}
        for substring in chat_info_ACz:gmatch("%S+") do
            table.insert(chunks, substring)
        end
        if chunks[2] == "rolls" and chunks[4] == "(1-100)" then
            table.insert(plaYerRolllist, chunks[1] .. " " .. chunks[3])
        end
    else
        i_i2 = 0
        for i_1 = 1,#plaYrsShorTlist do
            num34 = 0
            for i_2, k_2 in ipairs(plaYerRolllist) do
                j_name = string.match(k_2, "%a+")
                if plaYrsShorTlist[i_1] == j_name and num34 < 1 then
                    j_num = string.match(k_2, "%d+")
                    num34 = num34 + 1
                    table.insert(pLaYRspointslist, k_2)
                    table.insert(plaYerRollamount, j_num)
                end
            end
        end
        
        if #plaYerRollamount > 0 then
            t2 = math.max(unpack(plaYerRollamount))
	    elseif #plaYerRollamount == 0 then
            SendChatMessage("Nobody Rolled!", "RAID_WARNING")
            C_Timer.After(3, function() RaidNotice_AddMessage(RaidWarningFrame,"You can restart the roll by right clicking the corpse after the first roll has finished. If no one wants the item, pick it up I guess.",ChatTypeInfo["RAID_WARNING"]); end)
            return
        end
        
        for v_12, k_12 in ipairs(pLaYRspointslist) do
            local scX42Gpoints = string.match(k_12, "%d+")
            local scX42Gplayer = string.match(k_12, "%a+")
            if scX42Gpoints == tostring(t2) then
                i_i2 = i_i2 + 1
                table.insert(winnerList, scX42Gplayer)
            end
	    end
        if i_i2 > 1 then
            SendChatMessage(table.concat(winnerList, ", ") .. " Please roll again.", "RAID_WARNING")
            plaYrsShorTlist = winnerList
            pLaYRspointslist = {}
            plaYerRollamount = {}
            winnerList = {}
            secureroLls()
        elseif i_i2 == 1 then
		    SendChatMessage(winnerList[1] .. " is the Winner!", "RAID_WARNING")
            GiveLoot(winnerList[1])
            LootlistTest23[winnerList[1]][num_43] = LootlistTest23[winnerList[1]][num_43] .. "~"
            table.insert(LootlistbackUp23, winnerList[1] .. " " .. num_43)
		end
	end
end

function secureroLls()
    itsaboolL = true
    itsaboolL_23 = false
    SendChatMessage("Players have 30 seconds to roll!", "RAID_WARNING")
    for i3_num3 = 1, 35 do
        if i3_num3 == 10 then
            C_Timer.After(i3_num3, function() SendChatMessage(30 - i3_num3 .. " Seconds Remaining!", "RAID") end)
        elseif i3_num3 == 20 then
            C_Timer.After(i3_num3, function() SendChatMessage(30 - i3_num3 .. " Seconds Remaining!", "RAID") end)
        elseif i3_num3 >= 21 and i3_num3 < 30 then
            C_Timer.After(i3_num3, function() SendChatMessage(30 - i3_num3 .. " Seconds Remaining!", "RAID") end)  
        elseif i3_num3 == 30 then
            C_Timer.After(i3_num3, function() SendChatMessage("Time's up!", "RAID_WARNING") end)
        elseif i3_num3 == 35 then
            C_Timer.After(i3_num3, function() rollOutLoot() itsaboolL = false itsaboolL_23 = true wipeTables()  end)
        end	
    end
end

function CreatePLyRList()
    local iNuM = GetNumGroupMembers();
    if iNuM ~= 0 then
        PartPlYRList = {}
        for Inum = 1, iNuM do
            --local _, _, _, _, _, _, _, online, _, _, _ = GetRaidRosterInfo(Inum);
            local PLYRn = GetRaidRosterInfo(Inum)
            --if online == true then
              table.insert(PartPlYRList, PLYRn)
			--end
		end
	end
end

function foundItem()
    local numLootItems = GetNumLootItems();
    if numLootItems >= 1 then
        for i = 1,numLootItems do
            local lootIcon, lootName, lootQuantity, _, rarity, isQuestItem, questId, isActive = GetLootSlotInfo(i);
            if rarity ~= nil then
                if looTThResHolD == nil or looTThResHolD == 1 then
		            if rarity >= 2 and rarity < 5 and isQuestItem == false then
                        finish_FoundITem(lootName, i)
                        return
                    end
                elseif looTThResHolD == 2 then
                    if rarity >= 3 and rarity < 5 and isQuestItem == false then
                        finish_FoundITem(lootName, i)
                        return
                    end
                elseif looTThResHolD == 3 then
                    if rarity == 4 and isQuestItem == false then
                        finish_FoundITem(lootName, i)
                        return
                    end
		        end
            else
                --return
			end
	    end
	end
end

function finish_FoundITem(lootName, i)
    InDeX = i
    local itemLink = GetLootSlotLink(i)
    CreatePLyRList()
    itsaboolL_23 = false
    LootListSearch(lootName, itemLink, i)
end

function LootListSearch(o, link, InDe_X)
    local i = 0
    if PartPlYRList ~= nil then
        for index, data in ipairs(PartPlYRList) do
            if LootlistTest23[data] ~= nil then
		        for v, k in ipairs(LootlistTest23[data]) do
                    if string.sub(k, -1) ~= "~" then			
                    local sc4Gpoints = string.match(k, "%d+")
                    local sc4Gitems = string.match(k, "%a.+")
                        if sc4Gitems == o then
                            table.insert(completelist, sc4Gpoints .. " " .. data .. " " .. v)
                            table.insert(pointslist, sc4Gpoints)
			            end
                    end
		        end
		    end
	    end

        if #pointslist > 0 then
            t = math.max(unpack(pointslist))
	    elseif #pointslist == 0 then
            t = 0
        end

        for v1, k1 in ipairs(completelist) do
            local scX4Gpoints = string.match(k1, "%d+")
            local scX4Gplayer = string.match(k1, "%a.+")
            if scX4Gpoints == tostring(t) then
                i = i + 1
                table.insert(comparelist, scX4Gplayer)
            end
	    end

        if i > 1 then
            for i_v, k_v in ipairs(comparelist)do
                name_i = string.match(k_v, "%a+")
                table.insert(plaYrsShorTlist, name_i)
            end
            local scX_GindeX = string.match(comparelist[1], "%d+")
            num_43 = tonumber(scX_GindeX)
            SendChatMessage(table.concat(plaYrsShorTlist, ", ") .. " Please /roll for " .. link, "RAID_WARNING")
            for fdn_um1, fdn_um in ipairs(plaYrsShorTlist) do
                C_ChatInfo.SendAddonMessage("LLM-BX10", scX_GindeX .. " " .. link, "WHISPER", fdn_um);
            end
            secureroLls()
        elseif i == 1 then
            local scX53GindeX = string.match(comparelist[1], "%d+")
            local scX53Gplayer = string.match(comparelist[1], "%a+")
            SendChatMessage(scX53Gplayer .. " Won " .. link, "RAID")
            num43 = tonumber(scX53GindeX)
            GiveLoot(scX53Gplayer)
            LootlistTest23[scX53Gplayer][num43] = LootlistTest23[scX53Gplayer][num43] .. "~"
			table.insert(LootlistbackUp23, scX53Gplayer .. " " .. num43)
            wipeTables()
        elseif i == 0 then
            --SendChatMessage("No player in the group has " .. link .. " on their list.", "RAID")
            GiveLoot(disEnchAnTe_R)
            wipeTables()
        end
	end
end

function GiveLoot(player_asX)
    for ci = 1, GetNumGroupMembers() do
        if (GetMasterLootCandidate(InDeX,ci) == UnitName(player_asX)) then
            GiveMasterLoot(InDeX, ci); 
        end
    end
end

function Button3_OnClick()
    RandomRoll(1,100)
    Frame_2:Hide()
end

function Button4_OnClick()
    Frame_2:Hide()
end

function Button5_OnClick()
    C_ChatInfo.SendAddonMessage("LLM-BX10", UnitName("player") .. " " .. asda_IndEx, "RAID");
    Frame_2:Hide()
end

function wipeTables()
        num_43 = 0
        InDeX = 0
        plaYerRollamount = {}
        pLaYRspointslist = {}
        plaYrsShorTlist = {}
        plaYerRolllist = {}
        completelist = {}
        comparelist = {}
        pointslist = {}
        itsaboolL_23 = true
end

function ScrollFrame_1_OnMouseWheel(self, delta)
    local newValue = self:GetVerticalScroll() - (delta * 20);
	
	if (newValue < 0) then
		newValue = 0;
	elseif (newValue > self:GetVerticalScrollRange()) then
		newValue = self:GetVerticalScrollRange();
	end
	
	self:SetVerticalScroll(newValue);
end