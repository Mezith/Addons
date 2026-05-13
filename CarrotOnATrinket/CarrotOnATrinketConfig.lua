
local _, coRe = ...;
coRe.Config = {}; -- adds Config table to addon namespace

local Config = coRe.Config;
local UIConfig;

    local teXt5 = "Trinket"

--------------------------------------
-- Defaults (usually a database!)
--------------------------------------
local defaults = {
	theme = {
		r = 0,
		g = 0.8, -- 204/255
		b = 1,
		hex = "00ccff"
	}
}

--------------------------------------
-- Config functions
--------------------------------------
function Config:Toggle()
	local menu = UIConfig or Config:CreateMenu();
	menu:SetShown(not menu:IsShown());
end

function Config:GetThemeColor()
	local c = defaults.theme;
	return c.r, c.g, c.b, c.hex;
end

local function ScrollFrame_OnMouseWheel(self, delta)
	local newValue = self:GetVerticalScroll() - (delta * 20);

	if (newValue < 0) then
		newValue = 0;
	elseif (newValue > self:GetVerticalScrollRange()) then
		newValue = self:GetVerticalScrollRange();
	end

	self:SetVerticalScroll(newValue);
end

function Config:CreateSaveButton(point, relativeFrame, relativePoint, xOffset,yOffset, text)
	local btn = CreateFrame("Button", nil, UIConfig.ScrollFrame, "GameMenuButtonTemplate");
	btn:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset);
	btn:SetSize(140, 30);
	btn:SetText(text);
	btn:SetNormalFontObject("GameFontNormalLarge");
	btn:SetHighlightFontObject("GameFontHighlightLarge");
    btn:SetScript("OnClick", function(self, text)
        CarrotOnATrinketSavpLyrTrinKeT = nil
        CarrotOnATrinketSavpLyrTrinKeTOnOff = nil
        teXt5 = "Trinket"
    end)
	return btn;
end

function Config:CreateCheckButtonTrinKeT(point1, relativeFrame1, relativePoint1, xOffset1 ,yOffset1, text1)
	local btn1 = CreateFrame("CheckButton", nil, UIConfig.ScrollFrame, "UICheckButtonTemplate");
	btn1:SetPoint(point1, relativeFrame1, relativePoint1, xOffset1, yOffset1);
	btn1.text:SetText(text1);
	btn1:SetChecked(CarrotOnATrinketSavpLyrTrinKeTOnOff);
    btn1:SetScript("OnClick", function(self, LeftButton, down)
    CarrotOnATrinketSavpLyrTrinKeTOnOff = btn1:GetChecked();
    end)
	return btn1;
end

function Config:CreateEditBoxTRiNK(pointT2, relativeFrameT2, relativePointT2, xOffsetT2,yOffsetT2, textT2, varT)
	local btNT2 = CreateFrame("EditBox", nil, UIConfig.ScrollFrame, "ChatConfigBoxWithHeaderTemplate");
	btNT2:SetPoint(pointT2, relativeFrameT2, relativePointT2, xOffsetT2, yOffsetT2);
	btNT2:SetSize(140, 30);
    if CarrotOnATrinketSavpLyrTrinKeT ~= nil then
        textT2 = CarrotOnATrinketSavpLyrTrinKeT
    end
    btNT2:SetText(textT2);
    btNT2:SetMultiLine(false)
    btNT2:SetAutoFocus(false) -- dont automatically focus
    btNT2:SetFontObject("ChatFontNormal")
    btNT2:SetTextInsets(5, 5, 0, 0)
    btNT2:SetHyperlinksEnabled(enable)
    btNT2:SetScript("OnTextChanged", function(self, userinput)
        if userinput then
        CarrotOnATrinketSavpLyrTrinKeT = self:GetText()
        --print(CarrotOnATrinketSavpLyrTrinKeT)
        end
    end)
	return btNT2;
end

function Config:CreateText(point3, relativeFrame3, relativePoint3, xOffset3, yOffset3, text3)
    local teXt = UIConfig.ScrollFrame:CreateFontString( nil, "OVERLAY", "GameFontNormal");
    teXt:SetPoint(point3, relativeFrame3, relativePoint3, xOffset3, yOffset3);
    teXt:SetText(text3);
end

function Config:CreateMenu()
	UIConfig = CreateFrame("Frame", "CarrotOnATrinketConfig", UIParent, "UIPanelDialogTemplate");
	UIConfig:SetSize(460, 200);
	UIConfig:SetPoint("CENTER"); -- Doesn't need to be ("CENTER", UIParent, "CENTER")
    UIConfig:SetMovable(true);
    UIConfig:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                self:StartMoving()
            end
        end)
    UIConfig:SetScript("OnMouseUp", UIConfig.StopMovingOrSizing)

	UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
	UIConfig.title:SetPoint("LEFT", CarrotOnATrinketConfigTitleBG, "LEFT", 6, 1);
	UIConfig.title:SetText("Carrot On A Trinket Options");

    UIConfig.ScrollFrame = CreateFrame("ScrollFrame", nil, UIConfig, "UIPanelScrollFrameTemplate");
	UIConfig.ScrollFrame:SetPoint("TOPLEFT", CarrotOnATrinketConfigDialogBG, "TOPLEFT", 4, -8);
	UIConfig.ScrollFrame:SetPoint("BOTTOMRIGHT", CarrotOnATrinketConfigDialogBG, "BOTTOMRIGHT", -3, 4);
	UIConfig.ScrollFrame:SetClipsChildren(true);
	UIConfig.ScrollFrame:SetScript("OnMouseWheel", ScrollFrame_OnMouseWheel);

    local child = CreateFrame("Frame", nil, UIConfig.ScrollFrame);
	child:SetSize(420, 240);
--[[
    child.bg = child:CreateTexture(nil, "BACKGROUND");
    child.bg:SetAllPoints(true);
    child.bg:SetColorTexture(0.2, 0.6, 0, 0.8);
]]
	UIConfig.ScrollFrame:SetScrollChild(child);

	UIConfig.ScrollFrame.ScrollBar:ClearAllPoints();
	UIConfig.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", UIConfig.ScrollFrame, "TOPRIGHT", -7, -16);
	UIConfig.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", UIConfig.ScrollFrame, "BOTTOMRIGHT", -7, 15);

    ----------------------------------
	-- Config Menu
	----------------------------------
    --Buttons
	UIConfig.saveBtn = self:CreateSaveButton("CENTER", child, "BOTTOM", 0, 140, "Reset");

    --EditBoxs

    UIConfig.checkEDT5 = self:CreateEditBoxTRiNK("CENTER", child, "BOTTOM", 0, 190, teXt5);

    --CheckButtons

    UIConfig.checkBTn4 = self:CreateCheckButtonTrinKeT("LEFT", UIConfig.checkEDT5, "LEFT", 160, 0, "On/Off");

    --Text

    UIConfig.teXt3 = self:CreateText("LEFT", UIConfig.checkEDT5, "LEFT", -80, 0, "Swapping");

    UIConfig.teXt4 = self:CreateText("CENTER", UIConfig.checkEDT5, "TOP", 0, 25, "Trinket");

	UIConfig:Hide();
	return UIConfig;
end