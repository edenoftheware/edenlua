local function findPanel(name)
    local function s(pnl)
        if pnl:GetName() == name then
            return pnl
        end

        for _, a in ipairs(pnl:GetChildren()) do
            local b = s(a)
            if b then return b end
        end
    end

    return s(vgui.GetWorldPanel())
end

local pnl = findPanel("")
