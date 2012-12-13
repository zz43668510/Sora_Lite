-- Engine
if not Sora then Sora = {} end
if Sora.Media then return end

-- Begin！
Sora.Media = {};
Sora.Media.Font = GameFontNormal : GetFont();
Sora.Media.FontSize = 12;
Sora.Media.Root = "interface\\addons\\Sora's\\Media\\";
Sora.Media.GlowTex = Sora.Media.Root .. "GlowTex";
Sora.Media.Statusbar = Sora.Media.Root .. "Statusbar";
Sora.Media.Solid = Sora.Media.Root .. "Solid";