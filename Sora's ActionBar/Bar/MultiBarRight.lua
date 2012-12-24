-- Engine
local Addon = LibStub("AceAddon-3.0"):GetAddon("ActionBar");
local Module = Addon:NewModule("MultiBarRight");
local F, M, C = nil, nil, nil;

function Module:GetEngine()
	F = Sora.Function;
	M = Sora.Media;
	C = Addon:GetModule("Config").Config;
end

function Module:CreateActionBar()
	Module.ActionBar = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate");
end

function Module:SetActionBarSize()
	Module.ActionBar:SetSize(C.ButtonSize * 2 + C.ButtonMargin, C.ButtonSize * 6 + C.ButtonMargin * 5);
end

function Module:SetActionBarPos()
	Module.ActionBar:SetPoint("RIGHT", -10, 0);
end

function Module:SetActionBarParent()
	MultiBarRight:SetParent(Module.ActionBar);
	MultiBarRight:EnableMouse(false);
end

function Module:SetActionBarButton()
	for i = 1, 12 do
		local Button = _G["MultiBarRightButton" .. i];
		local PreButton = _G["MultiBarRightButton" .. i - 1];
		Button:SetSize(C.ButtonSize, C.ButtonSize);
		Button:ClearAllPoints();
		if i == 1 then
			Button:SetPoint("TOPLEFT", Module.ActionBar);
		elseif i == 7 then
			Button:SetPoint("TOPRIGHT", Module.ActionBar);		
		else
			Button:SetPoint("TOP", PreButton, "BOTTOM", 0, -C.ButtonMargin);
		end
	end
end

function Module:DoRegisterStateDriver()
	RegisterStateDriver(Module.ActionBar, "visibility", "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists] hide; show");
end

function Module:OnInitialize()
	Module:GetEngine();
end

function Module:OnEnable()
	Module:CreateActionBar();
	Module:SetActionBarSize();
	Module:SetActionBarPos();
	Module:SetActionBarParent();
	Module:SetActionBarButton();
	Module:DoRegisterStateDriver();
end
