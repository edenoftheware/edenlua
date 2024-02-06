local function yuck(ply, cmd, tbl, str)
    local num = tonumber(str)
    if isnumber(num) then
        local xa = math.Truncate(ply:GetPos().x, num)
        local ya = math.Truncate(ply:GetPos().y, num)
        local za = math.Truncate(ply:GetPos().z, num)

        local pa = math.Truncate(ply:GetAngles().p, num)
        local ya = math.Truncate(ply:GetAngles().y, num)
        local ra = math.Truncate(ply:GetAngles().r, num)
        print("Vector(" .. xa .. ", " .. ya .. ", " .. za .. ")\n" .. "Angle(" .. pa .. ", " .. ya .. ", " .. ra .. ")")
    else
        local x = math.Round(ply:GetPos().x)
        local y = math.Round(ply:GetPos().y)
        local z = math.Round(ply:GetPos().z)

        local p = math.Round(ply:GetAngles().p) // Pitch
        local y = math.Round(ply:GetAngles().y) // yw
        local r = math.Round(ply:GetAngles().r) // Roll
        print("Vector(" .. x .. ", " .. y .. ", " .. z .. ")\n" .. "Angle(" .. p .. ", " .. y .. ", " .. r .. ")")
    end
end 

concommand.Add("getpp", yuck, function() return {"providing a num truncates the pos and ang to that number of decimal places"} end, "pretty pos", FCVAR_NONE)    
