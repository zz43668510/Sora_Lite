-- Engine
local Addon = LibStub("AceAddon-3.0"):GetAddon("ActionBar");
local Module = Addon:NewModule("MainMenuBar");
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
	Module.ActionBar:SetSize(C.ButtonSize * 12 + C.ButtonMargin * 11, C.ButtonSize);
end

function Module:SetActionBarPos()
	Module.ActionBar:SetPoint("Bottom", 0, 25);
end

function Module:SetActionBarParent()
	MainMenuBarArtFrame:SetParent(Module.ActionBar);
	MainMenuBarArtFrame:EnableMouse(false);
end

function Module:SetActionBarButton()
	for i = 1, 12 do
		local Button = _G["ActionButton" .. i];
		local PreButton = _G["ActionButton" .. i - 1];
		Button:SetSize(C.ButtonSize, C.ButtonSize);
		Button:ClearAllPoints();
		if i == 1 then
			Button:SetPoint("LEFT", Module.ActionBar);
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
