-- Engine
local Addon = LibStub("AceAddon-3.0"):GetAddon("ActionBar");
local Module = Addon:NewModule("ExtraActionBar");
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
