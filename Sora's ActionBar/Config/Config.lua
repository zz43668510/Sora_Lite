-- Engine
local Addon = Sora:GetAddon("ActionBar") and Sora:GetAddon("ActionBar") or Sora:CreateAddon("ActionBar");
local Module = Addon:CreateModule("Config");

-- Begin！
Module.Config = {};
Module.Config.ButtonSize = 32;
Module.Config.ButtonMargin = 5;