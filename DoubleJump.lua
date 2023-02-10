local dev = false -- Set to true if you are modifying this script and are executing it multiple times.

if dev then
    hook.Remove("KeyPress", "DoubleJump")
    hook.Remove("OnPlayerHitGround", "ResetDoubleJump")
end

hook.Add("KeyPress", "DoubleJump", function(ply, key)
	if key == IN_JUMP and not ply:IsOnGround() and ply.doubleJump then
		ply.doubleJump = false
        ply:SetVelocity(Vector( 0, 0, ply:GetJumpPower() * 1.2 ))
	end
end)

hook.Add("OnPlayerHitGround", "ResetDoubleJump", function(ply)
	ply.doubleJump = true
end)

if CLIENT then
    hook.Add("InitPostEntity", "InitDoubleJump", function()
        LocalPlayer().doubleJump = true
    end) 
end

--[[
    NOTES:
        - I tested this to see if it was exploitable 
        - on the client via lua execution and it doesn't
        - seem like it.

        - This is meant for the Shared realm.

    - edenware
]]
