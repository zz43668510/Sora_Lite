-- Engine
local Addon = LibStub("AceAddon-3.0"):GetAddon("ActionBar");
local Module = Addon:NewModule("MultiBarBottomRight");
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
	Module.ActionBar:SetSize(C.ButtonSize * 18 + C.ButtonMargin * 17, C.ButtonSize * 2 + C.ButtonMargin);
end

function Module:SetActionBarPos()
	Module.ActionBar:SetPoint("Bottom", Addon:GetModule("MainMenuBar").ActionBar);
end

function Module:SetActionBarParent()
	MultiBarBottomRight:SetParent(Module.ActionBar);
	MultiBarBottomRight:EnableMouse(false);
end

function Module:SetActionBarButton()
	for i = 1, 12 do
		local Button = _G["MultiBarBottomRightButton" .. i];
		local PreButton = _G["MultiBarBottomRightButton" .. i - 1];
		Button:SetSize(C.ButtonSize, C.ButtonSize);
		Button:ClearAllPoints();
		if i == 1 then
			Button:SetPoint("TOPLEFT", Module.ActionBar);
		elseif i == 4 then
			Button:SetPoint("BOTTOMLEFT", Module.ActionBar);
		elseif i == 7 then
			Button:SetPoint("TOPLEFT", Module.ActionBar, C.ButtonSize * 15 + C.ButtonMargin * 15, 0);
		elseif i == 10 then
			Button:SetPoint("BOTTOMLEFT", Module.ActionBar, C.ButtonSize * 15 + C.ButtonMargin * 15, 0);			
		else
			Button:SetPoint("LEFT", PreButton, "RIGHT", C.ButtonMargin, 0);
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
