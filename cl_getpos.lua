local math = math
local Round = Round
local GetPos = GetPos
local print = print
local IsValid = IsValid
local GetAngles = GetAngles

local function cock(ply)
    if (!IsValid(ply)) then print('what the fuck') end

    local xpos = math.Round(ply:GetPos().x)
    local ypos = math.Round(ply:GetPos().y)
    local zpos = math.Round(ply:GetPos().z)

    local pang = math.Round(ply:GetAngles().x) // Pitch
    local yang = math.Round(ply:GetAngles().y) // Yaw
    local rang = math.Round(ply:GetAngles().z) // Roll

    // getpos console command: setpos -95.904205 -6048.004883 -139.968750;setang 5.478009 -158.605865 0.000000
    // getpp console command: Vector(-96, -6048, -204) \n Angle(5, -159, 0)

    print("Vector(" .. xpos .. ", " .. ypos .. ", " .. zpos .. ")\n" .. "Angle(" .. pang .. ", " .. yang .. ", " .. rang .. ")")
end 

concommand.Add("getpp", cock, function() end, "pretty pos", FCVAR_NONE)
