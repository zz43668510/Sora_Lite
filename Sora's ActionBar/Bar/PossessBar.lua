-- Engine
local Addon = Sora:GetAddon("ActionBar") and Sora:GetAddon("ActionBar") or Sora:CreateAddon("ActionBar");
local Module = Addon:CreateModule("PossessBar");
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
	Module.ActionBar:SetSize(C.ButtonSize * 2 + C.ButtonMargin, C.ButtonSize);
end

function Module:SetActionBarPos()
	Module.ActionBar:SetPoint("BOTTOMLEFT", Addon:GetModule("MultiBarBottomRight").ActionBar, "TOPLEFT", 0, C.ButtonMargin);
end

function Module:SetActionBarParent()
	PossessBarFrame:SetParent(Module.ActionBar);
	PossessBarFrame:EnableMouse(false);
end

function Module:SetActionBarButton()
	for i = 1, 10 do
		local Button = _G["PossessButton" .. i];
		local PreButton = _G["PossessButton" .. i - 1];
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
