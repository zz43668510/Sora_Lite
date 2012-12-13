-- 防止重复加载
if not Sora then Sora = {} end
if Sora.Addon then return end

Sora.Addon = {};
Sora.AddonQueue = {};

function Sora:CreateAddon(name)
	Sora.Addon[name] = {};
	Sora.Addon[name].Module = {};
	Sora.Addon[name].ModuleQueue = {};
	
	Sora.Addon[name].CreateModule = function(self, n)
		Sora.Addon[name].Module[n] = {};
		Sora.Addon[name].Module[n].OnLoad = function() end;
		Sora.Addon[name].Module[n].OnEnable = function() end;
		
		tinsert(Sora.Addon[name].ModuleQueue, n);	
		
		return Sora.Addon[name].Module[n]
	end
	
	Sora.Addon[name].GetModule = function(self, n)
		return Sora.Addon[name].Module[n]
	end
	
	tinsert(Sora.AddonQueue, name);	
	
	return Sora.Addon[name]
end

function Sora:GetAddon(name)
	return Sora.Addon[name]
end

local Event = CreateFrame("Frame");
Event:RegisterEvent("PLAYER_LOGIN");
Event:RegisterEvent("PLAYER_ENTERING_WORLD");
Event:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LOGIN" then
		for key, value in pairs (Sora.AddonQueue) do
			local ModuleQueue = Sora.Addon[value].ModuleQueue;
			for k, v in pairs (ModuleQueue) do
				Sora.Addon[value].Module[v].OnLoad();
			end
		end
		Event:UnregisterEvent("Frame");
	end
	if event == "PLAYER_ENTERING_WORLD" then
		for key, value in pairs (Sora.AddonQueue) do
			local ModuleQueue = Sora.Addon[value].ModuleQueue;
			for k, v in pairs (ModuleQueue) do
				Sora.Addon[value].Module[v].OnEnable();
			end
		end
		Event:UnregisterEvent("PLAYER_ENTERING_WORLD");
	end
end);

