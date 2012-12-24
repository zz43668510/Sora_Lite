-- Engine
local Addon = LibStub("AceAddon-3.0"):GetAddon("ExpBar");
local Module = Addon:NewModule("ExpBar", "AceEvent-3.0");
local F, M, C = nil, nil, nil;

function Module:GetEngine()
	F = Sora.Function;
	M = Sora.Media;
	C = Addon:GetModule("Config").Config;
end

function Module:CreateExpBar()
	Module.ExpBar = CreateFrame("StatusBar", nil, UIParent);
	Module.ExpBar:SetStatusBarTexture(M.Statusbar);
	Module.ExpBar:SetStatusBarColor(0.58, 0.0, 0.55, 1.0);
	Module.ExpBar:SetPoint("TOPLEFT", _G["MultiBarBottomRightButton5"], "BOTTOMLEFT", 0, -10);
	Module.ExpBar:SetPoint("TOPRIGHT", _G["MultiBarBottomRightButton11"], "BOTTOMRIGHT", 0, -10);
	Module.ExpBar:SetPoint("BOTTOMLEFT", _G["MultiBarBottomRightButton5"], "BOTTOMLEFT", 0, -18);
	Module.ExpBar:SetPoint("BOTTOMRIGHT", _G["MultiBarBottomRightButton11"], "BOTTOMRIGHT", 0, -18);
	Module.ExpBar.Shadow = F.CreateShadow(Module.ExpBar, 3);
	Module.ExpBar.Rest = CreateFrame("StatusBar", nil, Module.ExpBar);
	Module.ExpBar.Rest:SetAllPoints();
	Module.ExpBar.Rest:SetStatusBarTexture(M.Statusbar);
	Module.ExpBar.Rest:SetStatusBarColor(0.0, 0.39, 0.88, 1.0);
	Module.ExpBar.Rest:SetFrameLevel(Module.ExpBar:GetFrameLevel()-1);
	Module.ExpBar.Text = F.CreateString(Module.ExpBar, 10);
	Module.ExpBar.Text:SetPoint("CENTER", 0, 1);
	Module.ExpBar.Text:SetAlpha(0);
	Module.ExpBar:SetScript("OnEnter",function() Module.ExpBar.Text:SetAlpha(1) end);
	Module.ExpBar:SetScript("OnLeave",function() Module.ExpBar.Text:SetAlpha(0) end);
end

function Module:Register()
	Module:RegisterEvent("PLAYER_XP_UPDATE", "OnEvent");
	Module:RegisterEvent("PLAYER_LEVEL_UP", "OnEvent");
	Module:RegisterEvent("UPDATE_EXHAUSTION", "OnEvent");
	Module:RegisterEvent("UPDATE_FACTION", "OnEvent");
end

function Module:OnEvent(self, event, ...)
	local name, standingID, barMin, barMax, barValue = GetWatchedFactionInfo();
	if UnitLevel("player") == MAX_PLAYER_LEVEL or IsXPUserDisabled() then
		Module.ExpBar.Rest:SetMinMaxValues(0, 1);
		Module.ExpBar.Rest:SetValue(0);
		if name then
			Module.ExpBar:SetStatusBarColor(FACTION_BAR_COLORS[standingID].r, FACTION_BAR_COLORS[standingID].g, FACTION_BAR_COLORS[standingID].b, 1);
			Module.ExpBar:SetMinMaxValues(barMin, barMax);
			Module.ExpBar:SetValue(barValue);
			Module.ExpBar.Text:SetText(barValue-barMin.." / "..barMax-barMin.."    "..floor(((barValue-barMin)/(barMax-barMin))*1000)/10 .."% | ".. name.. "(".._G["FACTION_STANDING_LABEL"..standingID]..")");
		else
			Module.ExpBar:SetStatusBarColor(0.2, 0.4, 0.8, 1);
			Module.ExpBar:SetMinMaxValues(0, 1);
			Module.ExpBar:SetValue(1);
			Module.ExpBar.Text:SetText("");
		end		
	else
		local currXP = UnitXP("player");
		local nextXP = UnitXPMax("player");
		local exhaustionThreshold = GetXPExhaustion();
		
		Module.ExpBar:SetMinMaxValues(0, nextXP);
		Module.ExpBar.Rest:SetMinMaxValues(0, nextXP);
		if exhaustionThreshold then
			Module.ExpBar.Text:SetText(F.DoVal(currXP).." / "..F.DoVal(nextXP).."  "..floor((currXP/nextXP)*1000)/10 .."%".." (+"..F.DoVal(exhaustionThreshold )..")")
			if exhaustionThreshold+currXP >= nextXP then
				Module.ExpBar:SetValue(currXP);
				Module.ExpBar.Rest:SetValue(nextXP);
			else
				Module.ExpBar:SetValue(currXP);
				Module.ExpBar.Rest:SetValue(exhaustionThreshold+currXP);
			end
		else
			Module.ExpBar:SetValue(currXP);
			Module.ExpBar.Rest:SetValue(0);
			Module.ExpBar.Text:SetText(F.DoVal(currXP).." / "..F.DoVal(nextXP).."    "..floor((currXP/nextXP)*1000)/10 .."%");
		end
	end
end

function Module:OnInitialize()
	Module:GetEngine();
end

function Module:OnEnable()
	Module:CreateExpBar();
	Module:Register();
	Module:OnEvent();
end
