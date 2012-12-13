-- Engine
local Addon = Sora:GetAddon("ActionBar") and Sora:GetAddon("ActionBar") or Sora:CreateAddon("ActionBar");
local Module = Addon:CreateModule("Media");

-- Begin！
Module.Media = {};
Module.Media.Font = GameFontNormal : GetFont();
Module.Media.FontSize = 12;
Module.Media.Root = "interface\\addons\\Sora's ActionBar\\Media\\";
Module.Media.GlowTex = Module.Media.Root .. "GlowTex";