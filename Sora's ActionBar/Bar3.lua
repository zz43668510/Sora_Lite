local addon, ns = ...;
local Module = Sora:GetAddon("ActionBar"):CreateModule("Bar3");
local ActionBar = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate");
local ButtonSize = 36;
local Margin = 5;

function Module:DoRegister()
	RegisterStateDriver(ActionBar, "visibility", "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists] hide; show")
end

function Module:SetActionBarSize()
	ActionBar:SetSize(ButtonSize * 18 + Margin *17, ButtonSize * 2 + Margin);
end

function Module:SetActionBarPos()
	ActionBar:SetPoint("BOTTOM", 0, 20);
end

function Module:SetActionBarParent()
	MultiBarBottomRight:SetParent(ActionBar);
	MultiBarBottomRight:EnableMouse(false);
end

function Module:SetButtonPos()
	for i = 1, 12 do
		local Button = _G["MultiBarBottomRightButton" .. i];
		Button:SetSize(ButtonSize, ButtonSize);
		Button:ClearAllPoints();
		if i == 1 then
			Button:SetPoint("TOPLEFT", ActionBar);
		elseif i == 4 then
			Button:SetPoint("BOTTOMLEFT", ActionBar);
		elseif i == 7 then
			Button:SetPoint("TOPLEFT", ActionBar, ButtonSize * 15 + Margin * 15, 0);
		elseif i == 10 then
			Button:SetPoint("BOTTOMLEFT", ActionBar, ButtonSize * 15 + Margin * 15, 0);			
		else
			Button:SetPoint("LEFT", _G["MultiBarBottomRightButton" .. i-1], "RIGHT", Margin, 0);
		end
	end
end

function Module:OnLoad()
	Module:DoRegister();
	Module:SetActionBarSize();
	Module:SetActionBarPos();
	Module:SetActionBarParent();
	Module:SetButtonPos();
end