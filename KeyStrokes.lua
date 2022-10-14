--[[
Localization
]]
local input = input
local surface = surface
local SetDrawColor = SetDrawColor
local DrawRect = DrawRect
local IsKeyDown = IsKeyDown
local SetTextPos = SetTextPos
local DrawText = DrawText
local SetFont = SetFont
local DrawOutlinedRect = DrawOutlinedRect
local ScrW = ScrW
local ScrH = ScrH
--[[
Localization end
]]

local white = Color(255, 255, 255)
local black = Color(0, 0, 0)
local red = Color(255, 0, 0)
local green = Color(0, 255, 0)
local blue = Color(0, 0, 255)

local function DrawKey(keyButton, keyLabel, x, y, w, h, keyColor, keyColorPressed, keyTextColor, font, outlineEnabled, outlineColor)
	if input.IsKeyDown(keyButton) then
		surface.SetDrawColor(keyColorPressed)
	else
		surface.SetDrawColor(keyColor)
	end

	surface.DrawRect(x, y, w, h)

	if outlineEnabled then
		surface.SetDrawColor(outlineColor or red)
		surface.DrawOutlinedRect(x, y, w, h)
	end

	surface.SetTextColor(keyTextColor)
	surface.SetFont(font)
	local textw, texth = surface.GetTextSize(keyLabel)
	surface.SetTextPos(x + (w / 2) - (textw / 2), y + (h / 2) - (texth / 2)) -- This just centers the key
	surface.DrawText(keyLabel)
end

hook.Add("HUDPaint", "DrawKeys", function()
    DrawKey(KEY_W, "W", ScrW() - 110, ScrH() - 165, 50, 50, white, red, black, "DermaLarge", false)
    DrawKey(KEY_A, "A", ScrW() - 165, ScrH() - 110, 50, 50, white, red, black, "DermaLarge", false)
    DrawKey(KEY_S, "S", ScrW() - 110, ScrH() - 110, 50, 50, white, red, black, "DermaLarge", false)
    DrawKey(KEY_D, "D", ScrW() - 55, ScrH() - 110, 50, 50, white, red, black, "DermaLarge", false)
    DrawKey(KEY_SPACE, "SPACE", ScrW() - 165, ScrH() - 55, 160, 50, white, red, black, "DermaLarge", false)
    //DrawKey(KEY_LSHIFT, "LSHIFT", ScrW() - 270, ScrH() - 110, 100, 50, white, red, black, "DermaLarge", false) --I don't like how it looks personally, but why not.
end)

--[[ PREVIEW
https://femboy.astolfo.porn/GLsxVFDo
]]
