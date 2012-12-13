-- Engine
local Addon = Sora:GetAddon("ActionBar") and Sora:GetAddon("ActionBar") or Sora:CreateAddon("ActionBar");
local Module = Addon:CreateModule("OverrideActionBar");
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
	Module.ActionBar:SetPoint("BOTTOM", Addon:GetModule("MainMenuBar").ActionBar);
end

function Module:SetActionBarParent()
	OverrideActionBar:SetParent(Module.ActionBar);
	OverrideActionBar:EnableMouse(false);
	OverrideActionBar:SetScript("OnShow", nil);
end

function Module:SetActionBarButton()
	local LeaveButtonPlaced = false;
	for i = 1, 12 do
		local Button =  _G["OverrideActionBarButton" .. i];
		local PreButton =  _G["OverrideActionBarButton" .. i - 1];
		if not Button and not LeaveButtonPlaced then
			Button = OverrideActionBar.LeaveButton;
			LeaveButtonPlaced = true;
		end
		if not Button then break end
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
	RegisterStateDriver(Module.ActionBar, "visibility", "[petbattle] hide; [overridebar][vehicleui][possessbar,@vehicle,exists] show; hide");
	RegisterStateDriver(OverrideActionBar, "visibility", "[overridebar][vehicleui][possessbar,@vehicle,exists] show; hide");
end

function Module:OnLoad()
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
