local dev = false

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
