-- Engine
local Addon = Sora:GetAddon("Panel") and Sora:GetAddon("Panel") or Sora:CreateAddon("Panel");
local Module = Addon:CreateModule("BottomPanel");
local F, M, C = nil, nil, nil;

function Module:GetEngine()
	F = Sora.Function;
	M = Sora.Media;
	C = Addon:GetModule("Config").Config;
end

function Module:CreatePanel()
	Module.Panel = CreateFrame("Frame", nil, UIParent)
	Module.Panel:SetHeight(10);
	Module.Panel:SetPoint("BOTTOMLEFT", 0, 3);
	Module.Panel:SetPoint("BOTTOMRIGHT", 0, 3);
	Module.Panel.Shadow = F.CreateShadow(Module.Panel, 3);
end

function Module:CreateExpBar()
	Module.ExpBar = CreateFrame("StatusBar", nil, UIParent);
	Module.ExpBar:SetStatusBarTexture(M.Statusbar);
	Module.ExpBar:SetSize(C.ExpBarWidth, 8);
	Module.ExpBar:SetPoint("BOTTOM", Module.Panel, 0, 1);
	Module.ExpBar.Rest = CreateFrame("StatusBar", nil, Module.ExpBar);
	Module.ExpBar.Rest:SetAllPoints();
	Module.ExpBar.Rest:SetStatusBarTexture(M.Statusbar);
	Module.ExpBar.Rest:SetFrameLevel(Module.ExpBar:GetFrameLevel()-1);
	Module.ExpBar.Text = F.CreateString(Module.ExpBar, 10);
	Module.ExpBar.Text:SetPoint("CENTER");
	Module.ExpBar.Text:SetAlpha(0);
	Module.ExpBar:SetStatusBarTexture(M.Statusbar);
	Module.ExpBar:SetScript("OnEnter",function() Module.ExpBar.Text:SetAlpha(1) end);
	Module.ExpBar:SetScript("OnLeave",function() Module.ExpBar.Text:SetAlpha(0) end);
end

function Module:UpdateExpBar()
	local PlayerXP = UnitXP("player");
	local MaxXP = UnitXPMax("player");
	local ExhaustionXP  = GetXPExhaustion("player");
	local name, standingID, barMin, barMax, barValue = GetWatchedFactionInfo();
	if UnitLevel("player") == MAX_PLAYER_LEVEL or IsXPUserDisabled == true then
		Module.ExpBar.Rest:SetMinMaxValues(0, 1);
		Module.ExpBar.Rest:SetValue(0);
		if name then
			Module.ExpBar:SetStatusBarColor(FACTION_BAR_COLORS[standingID].r, FACTION_BAR_COLORS[standingID].g, FACTION_BAR_COLORS[standingID].b, 1);
			Module.ExpBar:SetMinMaxValues(barMin, barMax);
			Module.ExpBar:SetValue(barValue);
			--Module.ExpBar.Text:SetText(barValue-barMin.." / "..barMax-barMin.."    "..floor(((barValue-barMin)/(barMax-barMin))*1000)/10 .."% | ".. name.. "(".._G["FACTION_STANDING_LABEL"..standingID]..")");
		else
			Module.ExpBar:SetStatusBarColor(0.2, 0.4, 0.8, 1);
			Module.ExpBar:SetMinMaxValues(0, 1);
			Module.ExpBar:SetValue(1);
			Module.ExpBar.Text:SetText("");
		end
	else
		Module.ExpBar:SetStatusBarColor(0.4, 0.1, 0.6, 1);
		Module.ExpBar.Rest:SetStatusBarColor(0.2, 0.4, 0.8, 1);
		Module.ExpBar:SetMinMaxValues(0, MaxXP);
		Module.ExpBar.Rest:SetMinMaxValues(0, MaxXP);
		if ExhaustionXP then
			--Module.ExpBar.Text:SetText(S.SVal(PlayerXP).." / "..S.SVal(MaxXP).."    "..floor((PlayerXP/MaxXP)*1000)/10 .."%" .. " (+"..S.SVal(exhaustionXP )..")")
			if ExhaustionXP+PlayerXP >= MaxXP then
				Module.ExpBar:SetValue(PlayerXP);
				Module.ExpBar.Rest:SetValue(MaxXP);
			else
				Module.ExpBar:SetValue(PlayerXP);
				Module.ExpBar.Rest:SetValue(ExhaustionXP+PlayerXP);
			end
		else
			Module.ExpBar:SetValue(PlayerXP);
			Module.ExpBar.Rest:SetValue(0);
			--Module.ExpBar.Text:SetText(S.SVal(PlayerXP).." / "..S.SVal(MaxXP).."    "..floor((PlayerXP/MaxXP)*1000)/10 .."%");
		end
	end	
end

function Module:ExpBarOnEvent()
	local Event = CreateFrame("Frame");
	Event:RegisterEvent("UPDATE_FACTION");
	Event:RegisterEvent("PLAYER_LEVEL_UP");
	Event:RegisterEvent("PLAYER_XP_UPDATE");
	Event:RegisterEvent("UPDATE_EXHAUSTION");
	Event:SetScript("OnEvent", function(self, event, ...)
		Module:UpdateExpBar();
	end);
end

function Module:CreateLeftBar()
	Module.LeftBar = CreateFrame("Frame", nil, UIParent);
	Module.LeftBar:SetPoint("TOPRIGHT", Module.ExpBar, "TOPLEFT", -1, 0);
	Module.LeftBar:SetPoint("BOTTOMRIGHT", Module.ExpBar, "BOTTOMLEFT", -1, 0);
	Module.LeftBar:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 0, 12);
	Module.LeftBar:SetPoint("BOTTOMLEFT", UIParent, 0, 4);
	Module.LeftBar:SetBackdrop({ bgFile = M.Solid });
	Module.LeftBar:SetBackdropColor(0, 0, 0, 0.5);
end

function Module:CreateRightBar()
	Module.RightBar = CreateFrame("Frame", nil, UIParent);
	Module.RightBar:SetPoint("TOPLEFT", Module.ExpBar, "TOPRIGHT", 1, 0);
	Module.RightBar:SetPoint("BOTTOMLEFT", Module.ExpBar, "BOTTOMRIGHT", 1, 0);
	Module.RightBar:SetPoint("TOPRIGHT", UIParent, "BOTTOMRIGHT", 0, 12);
	Module.RightBar:SetPoint("BOTTOMRIGHT", UIParent, 0, 4);
	Module.RightBar:SetBackdrop({ bgFile = M.Solid });
	Module.RightBar:SetBackdropColor(0, 0, 0, 0.5);
end

function Module:OnLoad()
	Module:GetEngine();
end

function Module:OnEnable()
	Module:CreatePanel();
	Module:CreateExpBar();
	Module:UpdateExpBar();
	Module:ExpBarOnEvent();
	Module:CreateLeftBar();
	Module:CreateRightBar();
end
