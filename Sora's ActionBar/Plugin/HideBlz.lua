-- Engine
local Addon = LibStub("AceAddon-3.0"):GetAddon("ActionBar");
local Module = Addon:NewModule("HideBlz");
local BlzHider = CreateFrame("Frame");

function Module:SetBlzHider()
	BlzHider:Hide();
end

function Module:SetBlzFrameParent()
	MainMenuBar:SetParent(BlzHider)
	MainMenuBarPageNumber:SetParent(BlzHider);
	ActionBarDownButton:SetParent(BlzHider);
	ActionBarUpButton:SetParent(BlzHider);
	OverrideActionBarExpBar:SetParent(BlzHider);
	OverrideActionBarHealthBar:SetParent(BlzHider);
	OverrideActionBarPowerBar:SetParent(BlzHider);
	OverrideActionBarPitchFrame:SetParent(BlzHider);
	CharacterMicroButton:SetParent(BlzHider);
	SpellbookMicroButton:SetParent(BlzHider);
	TalentMicroButton:SetParent(BlzHider);
	AchievementMicroButton:SetParent(BlzHider);
	QuestLogMicroButton:SetParent(BlzHider);
	GuildMicroButton:SetParent(BlzHider);
	PVPMicroButton:SetParent(BlzHider);
	LFDMicroButton:SetParent(BlzHider);
	CompanionsMicroButton:SetParent(BlzHider);
	EJMicroButton:SetParent(BlzHider);
	MainMenuMicroButton:SetParent(BlzHider);
	HelpMicroButton:SetParent(BlzHider);
	MainMenuBarBackpackButton:SetParent(BlzHider);
	CharacterBag0Slot:SetParent(BlzHider);
	CharacterBag1Slot:SetParent(BlzHider);
	CharacterBag2Slot:SetParent(BlzHider);
	CharacterBag3Slot:SetParent(BlzHider);
end

function Module:HideTexture()
	StanceBarLeft:SetTexture(nil);
	StanceBarMiddle:SetTexture(nil);
	StanceBarRight:SetTexture(nil);
	SlidingActionBarTexture0:SetTexture(nil);
	SlidingActionBarTexture1:SetTexture(nil);
	PossessBackground1:SetTexture(nil);
	PossessBackground2:SetTexture(nil);
	MainMenuBarTexture0:SetTexture(nil);
	MainMenuBarTexture1:SetTexture(nil);
	MainMenuBarTexture2:SetTexture(nil);
	MainMenuBarTexture3:SetTexture(nil);
	MainMenuBarLeftEndCap:SetTexture(nil);
	MainMenuBarRightEndCap:SetTexture(nil);
	OverrideActionBar["_BG"]:SetAlpha(0);
	OverrideActionBar["EndCapL"]:SetAlpha(0);
	OverrideActionBar["EndCapR"]:SetAlpha(0);
	OverrideActionBar["_Border"]:SetAlpha(0);
	OverrideActionBar["Divider1"]:SetAlpha(0);
	OverrideActionBar["Divider2"]:SetAlpha(0);
	OverrideActionBar["Divider3"]:SetAlpha(0);
	OverrideActionBar["ExitBG"]:SetAlpha(0);
	OverrideActionBar["MicroBGL"]:SetAlpha(0);
	OverrideActionBar["MicroBGR"]:SetAlpha(0);
	OverrideActionBar["_MicroBGMid"]:SetAlpha(0);
	OverrideActionBar["ButtonBGL"]:SetAlpha(0);
	OverrideActionBar["ButtonBGR"]:SetAlpha(0);
	OverrideActionBar["_ButtonBGMid"]:SetAlpha(0);
end

function Module:OnInitialize()
	Module:SetBlzHider();
	Module:SetBlzFrameParent();
	Module:HideTexture();
end