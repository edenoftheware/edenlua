local function propYoinker(ply)
    local props = ents.GetAll()
    local Entitiess = {}
    Entitiess["Entities"] = {}
    Entitiess.Constraints = {}
    Entitiess.HeadEnt = {
        Index = nil,
        Pos = LocalPlayer():GetPos(),
        Z = 1
    }
    Entitiess.Description = ""

    for _, entity in pairs(props) do
        local owner = entity:CPPIGetOwner()

        if IsValid(owner) then
            local ownerIndex = owner:EntIndex()
            if ownerIndex == ply then
                print(entity:GetPos())
                local prop = {
                    Frozen = true,
                    ModelScale = entity:GetModelScale(),
                    Skin = entity:GetSkin(),
                    Model = entity:GetModel(),
                    PhysicsObjects = {
                        [0] = {
                        Pos = "[" .. math.Round(entity:GetPos().x, 4) .. " " .. math.Round(entity:GetPos().y, 4) .. " " .. math.Round(entity:GetPos().z, 4) .. "]",
                        Angle = entity:GetAngles()
                        },
                    },
                    CollisionGroup = entity:GetCollisionGroup(),
                    BuildDupeInfo = {
                        IsNPC = entity:IsNPC(),
                        IsVehicle = entity:IsVehicle()
                    },
                    DT = {
                        Secure = entity:GetDTInt(0) == 1,
                        Status = entity:GetDTInt(1),
                        Text = entity:GetDTString(0)
                    },
                    Class = entity:GetClass()
                }
                if (prop.Skin == 0) then prop.Skin = nil end
                if (prop.ModelScale == 1) then prop.ModelScale = nil end

                    Entitiess.HeadEnt = {
                        Index = entity:EntIndex(),
                        Pos = "[" .. math.Round(entity:GetPos().x, 4) .. " " .. math.Round(entity:GetPos().y, 4) .. " " .. math.Round(entity:GetPos().z, 4) .. "]",
                        Z = entity:GetPos().z
                    }

                Entitiess["Entities"][tostring(entity:EntIndex())] = prop
            else
                break
            end
        end
    end



    file.Delete("advdupe2/json.txt")
    local jsonString = util.TableToJSON(Entitiess)
    file.Write("advdupe2/json.json", jsonString)
    print("wrote: " .. jsonString)
end

propYoinker(1)

// TODO: fix
