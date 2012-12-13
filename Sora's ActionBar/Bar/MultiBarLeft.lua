-- Engine
local Addon = Sora:GetAddon("ActionBar") and Sora:GetAddon("ActionBar") or Sora:CreateAddon("ActionBar");
local Module = Addon:CreateModule("MultiBarLeft");
local F, C, M, D  = nil, nil, nil, nil;

function Module:GetEngine()
	F = Addon:GetModule("Function").Function;
	C = Addon:GetModule("Config").Config;
	M = Addon:GetModule("Media").Media;
	D = Addon:GetModule("DataBase").DataBase;
end

function Module:CreateActionBar()
	Module.ActionBar = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate");
end

function Module:SetActionBarSize()
	Module.ActionBar:SetSize(C.ButtonSize * 2 + C.ButtonMargin, C.ButtonSize * 6 + C.ButtonMargin * 5);
end

function Module:SetActionBarPos()
	Module.ActionBar:SetPoint("LEFT", 10, 0);
end

function Module:SetActionBarParent()
	MultiBarLeft:SetParent(Module.ActionBar);
	MultiBarLeft:EnableMouse(false);
end

function Module:SetActionBarButton()
	for i = 1, 12 do
		local Button = _G["MultiBarLeftButton" .. i];
		local PreButton = _G["MultiBarLeftButton" .. i - 1];
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
