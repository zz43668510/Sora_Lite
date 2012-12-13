-- Engine
local Addon = Sora:GetAddon("ActionBar") and Sora:GetAddon("ActionBar") or Sora:CreateAddon("ActionBar");
local Module = Addon:CreateModule("Function");
local F, C, M, D  = nil, nil, nil, nil;

function Module:GetEngine()
	F = Addon:GetModule("Function").Function;
	C = Addon:GetModule("Config").Config;
	M = Addon:GetModule("Media").Media;
	D = Addon:GetModule("DataBase").DataBase;
end

function Module:OnLoad()
	Module:GetEngine();
end

-- Begin！
Module.Function = {};

function Module.Function.CreateShadow(Tex, Parent, Size)
	local Shadow = CreateFrame("Frame", nil, Parent);
	Shadow:SetFrameLevel(0);
	Shadow:SetPoint("TOPLEFT", -Size, Size);
	Shadow:SetPoint("BOTTOMRIGHT", Size, -Size);
	Shadow:SetBackdrop({edgeFile = Tex, edgeSize = Size});
	Shadow:SetBackdropBorderColor(0, 0, 0, 1);
	return Shadow
end

