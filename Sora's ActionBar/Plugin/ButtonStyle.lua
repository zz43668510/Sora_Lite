-- Engine
local Addon = LibStub("AceAddon-3.0"):GetAddon("ActionBar");
local Module = Addon:NewModule("ButtonStyle");
local F, M, C = nil, nil, nil;

function Module:GetEngine()
	F = Sora.Function;
	M = Sora.Media;
	C = Addon:GetModule("Config").Config;
end

function Module:CreateHighlightTexture(Button)
	local HighlightTexture = Button:CreateTexture("Frame", nil, self);
	HighlightTexture:SetTexture(1, 1, 1, 0.3);
	HighlightTexture:SetPoint("TOPLEFT");
	HighlightTexture:SetPoint("BOTTOMRIGHT");
	return HighlightTexture
end

function Module:CreatePushedTexture(Button)
	local PushedTexture = Button:CreateTexture("Frame", nil, self);
	PushedTexture:SetTexture(0, 0, 0, 0.3);
	PushedTexture:SetPoint("TOPLEFT");
	PushedTexture:SetPoint("BOTTOMRIGHT");
	return PushedTexture
end

function Module:CreateCheckedTexture(Button)
	local CheckedTexture = Button:CreateTexture("Frame", nil, self);
	CheckedTexture:SetTexture(1, 1, 1, 0.3);
	CheckedTexture:SetPoint("TOPLEFT");
	CheckedTexture:SetPoint("BOTTOMRIGHT");
	return CheckedTexture
end

function Module:CreateBG(Button)
	if not Button or (Button and Button.Shadow) then return end
	
	if Button:GetFrameLevel() < 1 then
		Button:SetFrameLevel(1);
	end
	
	Button.Shadow = F.CreateShadow(Button, 3);
end

function Module:StyleActionButton(Button)
	if not Button or (Button and Button.Styled) then return end
	local Icon  = _G[Button:GetName() .. "Icon"];
	local Flash  = _G[Button:GetName() .. "Flash"];
	local Shine = _G[Button:GetName() .. "Shine"];
	local Name  = _G[Button:GetName() .. "Name"];
	local Count  = _G[Button:GetName() .. "Count"];
	local Border  = _G[Button:GetName() .. "Border"];
	local HotKey  = _G[Button:GetName() .. "HotKey"];
	local Cooldown  = _G[Button:GetName() .. "Cooldown"];
	local FloatingBG  = _G[Button:GetName() .. "FloatingBG"];
	local FlyoutBorder = _G[Button:GetName() .. "FlyoutBorder"];
	local AutoCastable = _G[Button:GetName() .. "AutoCastable"];
	local NormalTexture  = _G[Button:GetName() .. "NormalTexture"];
	local NormalTexture2  = _G[Button:GetName().."NormalTexture2"];
	local FlyoutBorderShadow = _G[Button:GetName() .. "FlyoutBorderShadow"];
	
	if Icon then
		Icon:SetTexCoord(0.08, 0.92, 0.08, 0.92);
		Icon:SetPoint("TOPLEFT", Button);
		Icon:SetPoint("BOTTOMRIGHT", Button);
	end
	
	if Flash then
		Flash:Hide(nil);
		Flash:SetTexture(nil);
		Flash.SetTexture = function() end;
	end
	
	if Shine then
		Shine:ClearAllPoints();
		Shine:SetPoint("TOPLEFT", 2, -2)
		Shine:SetPoint("BOTTOMRIGHT", -2, 2)
	end

	if Name then
		Name:SetFont(M.Font, M.FontSize, "THINOUTLINE");
		Name:ClearAllPoints();
		Name:SetPoint("BOTTOM", 2, 1);
	end

	if Count then
		Count:SetFont(M.Font, M.FontSize, "THINOUTLINE");
		Count:ClearAllPoints();
		Count:SetPoint("BOTTOMRIGHT", 2, -1);
	end
	
	if Border then
		Border:Hide(nil);
		Border:SetTexture(nil);
		Border.SetTexture = function() end;
	end

	if HotKey then
		HotKey:SetFont(M.Font, M.FontSize, "THINOUTLINE");
		HotKey:ClearAllPoints();
		HotKey:SetPoint("TOPRIGHT", 1, -2);
	end

	if Cooldown then
		Cooldown:ClearAllPoints();
		Cooldown:SetAllPoints(Button);
	end
	
	if FloatingBG then
		FloatingBG:Hide(nil);
		FloatingBG:SetTexture(nil);
		FloatingBG.SetTexture = function() end;
	end
	
	if FlyoutBorder then
		FlyoutBorder:Hide(nil);
		FlyoutBorder:SetTexture(nil);
		FlyoutBorder.SetTexture = function() end;
	end

	if AutoCastable then
		AutoCastable:ClearAllPoints();
		AutoCastable:SetPoint("TOPLEFT", -16, 16);
		AutoCastable:SetPoint("BOTTOMRIGHT", 16, -16);
	end

	if NormalTexture then
		NormalTexture:Hide(nil);
		NormalTexture:SetTexture(nil);
		NormalTexture.SetTexture = function() end;
	end

	if NormalTexture2 then
		NormalTexture2:Hide(nil);
		NormalTexture2:SetTexture(nil);
		NormalTexture2.SetTexture = function() end;
	end
	
	if FlyoutBorderShadow then
		FlyoutBorderShadow:Hide(nil);
		FlyoutBorderShadow:SetTexture(nil);
		FlyoutBorderShadow.SetTexture = function() end;
	end

	if Button then
		Button:SetNormalTexture("");
		Button:SetHighlightTexture(Module:CreateHighlightTexture(Button));
		Button:SetHighlightTexture(Module:CreatePushedTexture(Button));
		Button:SetCheckedTexture(Module:CreateCheckedTexture(Button));
	end

	if not Button.BG then
		Module:CreateBG(Button);
	end
	
	Button.Styled = true;
end

function Module:StyleActionBar(Button)
    for i = 1, NUM_ACTIONBAR_BUTTONS do
      Module:StyleActionButton(_G["ActionButton"..i]);
      Module:StyleActionButton(_G["MultiBarBottomLeftButton"..i]);
      Module:StyleActionButton(_G["MultiBarBottomRightButton"..i]);
      Module:StyleActionButton(_G["MultiBarRightButton"..i]);
      Module:StyleActionButton(_G["MultiBarLeftButton"..i]);
    end
end

function Module:StyleStanceBar(Button)
	for i = 1, NUM_STANCE_SLOTS do
		Module:StyleActionButton(_G["StanceButton"..i]);
	end
end

function Module:StylePossessBar(Button)
    for i = 1, NUM_POSSESS_SLOTS do
		Module:StyleActionButton(_G["PossessButton"..i]);
    end
end

function Module:StyleOverrideBar(Button)
    for i = 1, 6 do
		Module:StyleActionButton(_G["OverrideActionBarButton"..i]);
    end
end

function Module:StylePetBar(Button)
    for i = 1, 10 do
		Module:StyleActionButton(_G["PetActionButton"..i]);
    end
end

function Module:StyleFlyoutBar(Button)
    SpellFlyoutBackgroundEnd:SetTexture(nil);
    SpellFlyoutHorizontalBackground:SetTexture(nil);
    SpellFlyoutVerticalBackground:SetTexture(nil);
    SpellFlyout:HookScript("OnShow", function(self)
		for i = 1, 10 do
			Module:StyleActionButton(_G["SpellFlyoutButton"..i]);
		end
	end)
end

function Module:OnInitialize()
	Module:GetEngine();
	Module:StyleActionBar();
	Module:StyleStanceBar();
	Module:StylePossessBar();
	Module:StyleOverrideBar();
	Module:StylePetBar();
	Module:StyleFlyoutBar();
end
