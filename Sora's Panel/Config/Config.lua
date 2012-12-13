-- Engine
local Addon = Sora:GetAddon("Panel") and Sora:GetAddon("Panel") or Sora:CreateAddon("Panel");
local Module = Addon:CreateModule("Config");

-- Begin！
Module.Config = {};
Module.Config.ExpBarWidth = 533;