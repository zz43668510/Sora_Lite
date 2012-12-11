local addon, ns = ...;
local Module = Sora:GetAddon("ActionBar"):CreateModule("ShowGrid");

function Module:ShowGrid()
	SetActionBarToggles(1, 1, 1, 1, 0)
	SetCVar("alwaysShowActionBars", 0)	
	ActionButton_HideGrid = function() end
	for i = 1, 12 do
		local Button = _G[format("ActionButton%d", i)]
		Button:SetAttribute("showgrid", 1)
		ActionButton_ShowGrid(Button)
		
		Button = _G[format("MultiBarRightButton%d", i)]
		Button:SetAttribute("showgrid", 1)
		ActionButton_ShowGrid(Button)

		Button = _G[format("MultiBarBottomRightButton%d", i)]
		Button:SetAttribute("showgrid", 1)
		ActionButton_ShowGrid(Button)
		
		Button = _G[format("MultiBarLeftButton%d", i)]
		Button:SetAttribute("showgrid", 1)
		ActionButton_ShowGrid(Button)
		
		Button = _G[format("MultiBarBottomLeftButton%d", i)]
		Button:SetAttribute("showgrid", 1)
		ActionButton_ShowGrid(Button)
	end
end

function Module:OnEnable()
	Module:ShowGrid();
end
