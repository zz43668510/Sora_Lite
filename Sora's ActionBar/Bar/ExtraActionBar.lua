-- Engine
local Addon = Sora:GetAddon("ActionBar") and Sora:GetAddon("ActionBar") or Sora:CreateAddon("ActionBar");
local Module = Addon:CreateModule("ExtraActionBar");
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
	Module.ActionBar:SetSize(C.ButtonSize, C.ButtonSize);
end

function Module:SetActionBarPos()
	Module.ActionBar:SetPoint("BOTTOM", 0, 300);
end

function Module:SetActionBarParent()
	ExtraActionBarFrame:SetParent(Module.ActionBar);
	ExtraActionBarFrame:EnableMouse(false);
	ExtraActionBarFrame:ClearAllPoints();
	ExtraActionBarFrame:SetPoint("BOTTOM", 0, 300);
	ExtraActionBarFrame.ignoreFramePositionManager = true;
end

function Module:SetActionBarButton()
	ExtraActionButton1:SetSize(C.ButtonSize, C.ButtonSize);
end

function Module:DoRegisterStateDriver()
	RegisterStateDriver(Module.ActionBar, "visibility", "[petbattle][overridebar][vehicleui] hide; show");
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
