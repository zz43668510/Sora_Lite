local addon, ns = ...;
local Module = Sora:GetAddon("ActionBar"):CreateModule("Bar2");
local ActionBar = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate");
local ButtonSize = 36;
local Margin = 5;

function Module:DoRegister()
	RegisterStateDriver(ActionBar, "visibility", "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists] hide; show")
end

function Module:SetActionBarSize()
	ActionBar:SetSize(ButtonSize * 12 + Margin *11, ButtonSize);
end

function Module:SetActionBarPos()
	ActionBar:SetPoint("BOTTOM", 0, 20 + ButtonSize + 5);
end

function Module:SetActionBarParent()
	MultiBarBottomLeft:SetParent(ActionBar);
	MultiBarBottomLeft:EnableMouse(false);
end

function Module:SetButtonPos()
	for i = 1, 12 do
		local Button = _G["MultiBarBottomLeftButton" .. i];
		Button:SetSize(ButtonSize, ButtonSize);
		Button:ClearAllPoints();
		if i == 1 then
			Button:SetPoint("LEFT", ActionBar);
		else
			Button:SetPoint("LEFT", _G["MultiBarBottomLeftButton" .. i-1], "RIGHT", Margin, 0);
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