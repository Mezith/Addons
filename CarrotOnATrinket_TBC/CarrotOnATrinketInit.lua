local _, coRe = ...;

local paIrs = ipairs
local fOpEn = coRe.Config.Toggle

coRe.commands = {
	["config"] = coRe.Config.Toggle, -- this is a function that toggles the config frame.

	["help"] = function()
		print(" ");
		coRe:Print("List of slash commands:")
		coRe:Print("|cff00cc66/coat config|r - Shows the Config Menu");
		coRe:Print("|cff00cc66/coat help|r - Shows the Help Info");
		print(" ");
	end,
};

local function HandleSlashCommands(str)
	if (#str == 0) then
		-- User just entered just "/coat".
		coRe.commands.help();
		return;
	end

	local args = {};
	for _, arg in paIrs({ string.split(' ', str) }) do
		if (#arg > 0) then
			table.insert(args, arg);
		end
	end

	local path = coRe.commands; -- links path to core commands. Required for updating the used table.

	for id, arg in paIrs(args) do
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
				coRe.commands.help();
				return;
			end
		end
	end
end

function coRe:Print(...)
    local hex = select(4, self.Config:GetThemeColor());
    local prefix = string.format("|cff%s%s|r", hex:upper(), "Carrot On A Trinket:");
    DEFAULT_CHAT_FRAME:AddMessage(string.join(" ", prefix, ...));
end

--------------------------------------
-- Main Functions Section
--------------------------------------
--Becomes Saved Variables Table
local pLyrTrinKeT
local carrOToaStick = "Riding Crop"
local pLyRToNoFF = true

local swiZe
local sWEZe = false
local perfVar1 = EquipItemByName

local itEmSpeLLBuFfNm = {"Chromatic Mount", "Summon Black Qiraji Battle Tank", "Summon Blue Qiraji Battle Tank", "Summon Red Qiraji Battle Tank", "Summon Green Qiraji Battle Tank", "Summon Yellow Qiraji Battle Tank",
    "Skeletal Black Warhorse", "Swift Zulian Tiger", "Swift Razzashi Raptor", "Frostwolf Howler", "Stormpike Battle Charger", "Swift Timber Wolf", "Black Stallion", "Riding Turtle", "Black War Tiger", "Swift Frostsaber",
    "Swift Palomino", "Pinto Horse", "Swift White Steed", "Swift Mistsaber", "Chestnut Mare", "Swift Stormsaber", "Swift Brown Steed", "Black War Raptor", "Brown Horse", "Black War Steed", "Purple Skeletal Warhorse",
    "Dire Wolf", "Red Skeletal Warhorse", "Large Timber Wolf", "Ivory Raptor", "Black War Wolf", "Blue Skeletal Horse", "Swift Orange Raptor", "White Stallion", "Swift Blue Raptor", "Nightsaber", "Striped Nightsaber",
    "Green Skeletal Warhorse", "Swift Olive Raptor", "Swift Brown Wolf", "Unpainted Mechanostrider", "Black War Ram", "Black War Kodo", "Red Skeletal Horse", "Swift Gray Wolf", "Striped Frostsaber", "Brown Wolf",
    "Great White Kodo", "Green Kodo", "Teal Kodo", "Brown Ram", "Brown Kodo", "Riding Kodo", "Arctic Wolf", "Spotted Panther", "Leopard", "Palomino Stallion", "White Stallion", "White Mechanostrider", "Palamino Stallion",
    "Panther", "Obsidian Raptor", "Primal Leopard", "Ivory Raptor", "Black Ram", "Spotted Frostsaber", "Emerald Raptor", "Blue Mechanostrider", "Swift White Ram", "Black Battlestrider", "Frostsaber", "Tiger",
    "Fluorescent Green Mechanostrider", "Swift Green Mechanostrider", "Violet Raptor", "Skeletal Steed", "Turquoise Raptor", "Swift White Mechanostrider", "Red Mechanostrider", "Brown Skeletal Horse", "Swift Gray Ram",
    "Swift Yellow Mechanostrider", "Great Gray Kodo", "Great Brown Kodo", "Mottled Red Raptor", "Swift Brown Ram", "Frost Ram", "Green Mechanostrider", "Icy Blue Mechanostrider", "White Ram", "Red Wolf", "Gray Kodo",
    "Gray Ram", "Swift Dawnsaber", "Skeletal Horse", "Black Wolf", "Gray Wolf", "Tawny Sabercat", "Golden Sabercat", "Brown Horse", "Winter Wolf", "Purple Mechanostrider", "Red & Blue Mechanostrider", "White Stallion",
    "Blue Ram", "Summon Dreadsteed", "Amani War Bear", "Ashes of Al'ar", "Call of the Phoenix", "Big Battle Bear", "Blue Riding Nether Ray", "Blue Windrider", "Brewfest Kodo", "Brewfest Ram", "Cenarion War Hippogryph",
    "Old Crappy McWeakSauce", "Crappy's Bell", "Swift Razzashi Raptor", "Crazy Raptor 75", "Crazy Raptor 150", "Dargonhawk Whistle", "Summon Dodostrider", "Ebon Gryphon", "Ebon Gryphon Mount", "Fiery Warhorse", "Flying Broom",
    "Flying Machine", "Golden Gryphon", "Great Brewfest Kodo", "Green Riding Nether Ray", "Green Windrider", "Magic Broom", "Merciless Nether Drake", "Old Magic Broom", "Peep the Phoenix Mount", "Onyx Netherwing Drake",
    "Purple Netherwing Drake", "Raven Lord", "Silver Riding Talbuk", "Silver War Talbuk", "Spectral Tiger", "Swift Spectral Tiger", "Tan Riding Talbuk", "Tan War Talbuk", "Purple Riding Nether Ray", "Reawakened Phase-Hunter",
    "Red Riding Nether Ray", "Azure Netherwing Drake", "Cobalt Netherwing Drake", "Cobalt Riding Talbuk", "Cobalt War Talbuk", "Dark Riding Talbuk", "Dark War Talbuk", "Veridian Netherwing Drake", "Violet Netherwing Drake",
    "White Riding Talbuk", "White War Talbuk", "Rickety Magic Broom", "Silver Riding Nether Ray", "Snowy Gryphon Mount", "Swift Blue Gryphon", "Swift Brewfest Ram", "Swift Flying Broom", "Swift Green Gryphon",
    "Swift Green Windrider", "Swift Magic Broom", "Swift Nether Drake", "Swift Purple Gryphon", "Swift Purple Windrider", "Swift Red Gryphon", "Swift Red Windrider", "Swift White Hawkstrider", "Swift Yellow Windrider",
    "Swift Zhevra" , "Tawny Windrider", "Headless Horseman's Mount", "Turbo-Charged Flying Machine", "Vengeful Nether Drake", "Video Mount", "X-51 Nether-Rocket", "X-51 Nether-Rocket X-TREME"}

local itEmIDList = {18797, 21176, 5665, 5663, 5656, 5655, 5668, 13335, 19902, 13086, 19029, 21321, 19872, 20221, 23720, 23720, 19030, 2411, 18766, 18242, 21324, 21323, 18902, 18767, 2414, 18776, 18778, 18246, 18777, 18241,
    13317, 18248, 18791, 8631, 8629, 8632, 18245, 18788, 18772, 18793, 12353, 13334, 18247, 18790, 18796, 12303, 1132, 12351, 13322, 8595, 18773, 18243, 18785, 18798, 13332, 13325, 18789, 8630, 13331, 18244, 18774, 8588,
    12354, 8591, 12330, 12302, 8586, 18768, 13333, 18794, 8563, 8592, 5873, 13327, 8628, 5864, 13328, 13321, 5872, 18786, 18787, 18795, 15290, 15277, 13329, 21736, 15292, 14062, 15293, 13326, 23193, 16344, 2413, 16339, 2415,
    8633, 12327, 12326, 8590, 12325, 8627, 13323, 1041, 8589, 16338, 1133, 5875, 8583, 13324, 901, 1134, 5874, 16343, 875, 21218, 33809, 32458, 38576, 32319, 25475, 37827, 33976, 33999, 25664, 27819, 27853, 28289, 25471, 30480,
    33176, 34060, 25470, 37828, 32314, 25476, 37011, 34092, 33183, 25596, 32857, 32860, 32768, 31831, 31832, 29104, 29229, 33224, 33225, 31833, 31834, 29105, 32316, 184865, 32317, 32858, 32859, 31830, 31829, 29227, 29102, 28915,
    29228, 32861, 32862, 31835, 31836, 29103, 29231, 33189, 32318, 25472, 25473, 33977, 33182, 25528, 25531, 33184, 30609, 25529, 25533, 25527, 25477, 35513, 25532, 37719, 37598, 25474, 37012, 34061, 37676, 28025, 35225, 35226}

function eventHandler(self, event, ...)
    local fRty = 40
    if event == "ADDON_LOADED" then
        local aDdnaMe = ...;
        if aDdnaMe ~= "CarrotOnATrinket" then return end
            --Becomes Saved Variables Table
            setVariB()
            SLASH_CarrotOnATrinket1 = "/coat";
	        SlashCmdList.CarrotOnATrinket = HandleSlashCommands;
            coRe:Print("Has loaded! Hello", UnitName("player").."!");
    end
    if event == "PLAYER_ENTERING_WORLD" then
        gRoUnDeR()
        if CarrotOnATrinketSavpLyrTrinKeTOnOff == nil then
        fOpEn()
        end
    end
    if event == "PLAYER_REGEN_ENABLED" or event == "LOOT_CLOSED" and not IsMounted() then
        gRoUnDeR()
    end
    if event == "UNIT_AURA" then
        local booFpLyR = UnitBuff
        local vsX3 = {}
        local vsX4 = {}
        for booFNuM = 1, fRty do
        local nameX3, _, _, _, _, _, _, _, _, _, _ = booFpLyR("player", booFNuM)
            if nameX3 ~= nil then
                sWEZe = booFNuM
                for _, vsX3 in paIrs(itEmSpeLLBuFfNm) do
                    if vsX3 == nameX3 then
                        mOuNteDeR()
                    end
                end
            end
        end
    end
    if event == "ACTIONBAR_SLOT_CHANGED" and not InCombatLockdown() then
        local arg1, arg2 = ...;
        local _ ,stMx = GetActionInfo(arg1)
        local HaStion = HasAction(arg1)
        local vsX2 = {}
        if sWEZe ~= false then
        local sWEZe2 = UnitBuff("player", sWEZe)
            if sWEZe2 == nil then
                if HaStion ~= nil then
                    for _, vsX2 in paIrs(itEmIDList) do
                        if stMx == vsX2 then
                            gRoUnDeR()
                        end
                    end
                end
            end
        end
    end
end

function eQuipaNcHeCk(plyrInPut)
    for sLootId = 13, 14 do
    local itEmId1 = GetInventoryItemID("player", sLootId)
        if itEmId1 then
            local sNameXz1, _, _, _, _, _, _, _ = GetItemInfo(itEmId1)
            if sNameXz1 == carrOToaStick or sNameXz1 == pLyrTrinKeT then
                swiZe = sLootId
                perfVar1(plyrInPut, swiZe)
            end
        end
    end
end

function gRoUnDeR()
    setVariB()
    local perfVar2 = eQuipaNcHeCk
    if pLyRToNoFF then
        perfVar2(pLyrTrinKeT)
    end
end

function mOuNteDeR()
    setVariB()
    local perfVar2 = eQuipaNcHeCk
    if pLyRToNoFF then
        perfVar2(carrOToaStick)
    end
end

function setVariB()
    pLyrTrinKeT = CarrotOnATrinketSavpLyrTrinKeT
    pLyRToNoFF = CarrotOnATrinketSavpLyrTrinKeTOnOff
end

local MYfraMe = CreateFrame("FRAME");
MYfraMe:RegisterEvent("LOOT_CLOSED");
MYfraMe:RegisterEvent("ADDON_LOADED");
MYfraMe:RegisterEvent("PLAYER_ENTERING_WORLD");
MYfraMe:RegisterEvent("PLAYER_REGEN_ENABLED");
MYfraMe:RegisterEvent("UNIT_AURA");
MYfraMe:RegisterEvent("ACTIONBAR_SLOT_CHANGED");
MYfraMe:SetScript("OnEvent", eventHandler);