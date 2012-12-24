-- Engine
if not Sora then Sora = {} end
if Sora.Function then return end

-- Begin！
local M = Sora.Media;
Sora.Function = {};

function Sora.Function.CreateShadow(Parent, Size)
	local Shadow = CreateFrame("Frame", nil, Parent);
	Shadow:SetFrameLevel(0);
	Shadow:SetPoint("TOPLEFT", -Size, Size);
	Shadow:SetPoint("BOTTOMRIGHT", Size, -Size);
	Shadow:SetBackdrop({edgeFile = M.GlowTex, edgeSize = Size});
	Shadow:SetBackdropBorderColor(0, 0, 0, 1);
	return Shadow
end

function Sora.Function.CreateBorder(Parent, Size)
	local Border = CreateFrame("Frame", nil, Parent);
	Border:SetFrameLevel(0);
	Border:SetPoint("TOPLEFT", -Size, Size);
	Border:SetPoint("BOTTOMRIGHT", Size, -Size);
	Border:SetBackdrop({edgeFile = M.Solid, edgeSize = Size});
	Border:SetBackdropBorderColor(0, 0, 0, 1);
	return Border
end

function Sora.Function.CreateBG(Parent, Size)
	local BG = CreateFrame("Frame", nil, Parent)
	BG:SetFrameLevel(0);
	BG:SetPoint("TOPLEFT", -Size, Size);
	BG:SetPoint("BOTTOMRIGHT", Size, -Size);
	BG:SetBackdrop({
		bgFile = M.Solid, insets = {left = Size, right = Size, top = Size, bottom = Size},
		edgeFile = M.GlowTex, edgeSize = Size - 1,
	});
	BG:SetBackdropColor(0, 0, 0, 0.5);
	BG:SetBackdropBorderColor(0, 0, 0, 1);
	return BG
end

function Sora.Function.CreateTexShadow(Parent, Anchor, Size)
	local Shadow = CreateFrame("Frame", nil, Parent);
	Shadow:SetPoint("TOPLEFT", Anchor, -Size, Size);
	Shadow:SetPoint("BOTTOMRIGHT", Anchor, Size, -Size);
	Shadow:SetFrameLevel(1);
	Shadow:SetBackdrop({edgeFile = M.GlowTex, edgeSize = Size});
	Shadow:SetBackdropBorderColor(0, 0, 0, 1);
	return Shadow
end

function Sora.Function.CreateString(Parent, FontSize)
	local Text = Parent:CreateFontString(nil, "OVERLAY");
	Text:SetFont(M.Font, M.FontSize, "THINOUTLINE");
	return Text
end

function Sora.Function.DoVal(Val)
    if Val >= 1e6 then
        return ("%.1fm"):format(Val/1e6):gsub("%.?0+([km])$", "%1")
    elseif Val >= 1e4 then
        return ("%.1fk"):format(Val/1e3):gsub("%.?0+([km])$", "%1")
    else
        return Val
    end
end
