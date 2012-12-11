-- 防止重复加载
if not Sora then Sora = {} end
if Sora.Addon then return end

Sora.Addon = {};

function Sora:CreateAddon(name)
	Sora.Addon[name] = {};
	Sora.Addon[name].Module = {};
	
	Sora.Addon[name].CreateModule = function(self, ...)
		local n = ...;
		Sora.Addon[name].Module[n] = {};
		Sora.Addon[name].Module[n].OnLoad = function() end;
		Sora.Addon[name].Module[n].OnEnable = function() end;
		return Sora.Addon[name].Module[n]
	end
	
	Sora.Addon[name].GetModule = function(n)
		return Sora.Addon[name].Module[n]
	end
	
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
		for key, value in pairs (Sora.Addon) do
			for k, v in pairs (value.Module) do
				v.OnLoad();
			end
		end
		Event:UnregisterEvent("Frame");
	end
	if event == "PLAYER_ENTERING_WORLD" then
		for key, value in pairs (Sora.Addon) do
			for k, v in pairs (value.Module) do
				v.OnEnable();
			end
		end
		Event:UnregisterEvent("PLAYER_ENTERING_WORLD");
	end
end);

