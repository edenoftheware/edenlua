// used this to make duping easier on titsrp in late 2023

local tblItems = {}
local function FindInventoryItemByClassname(toFind)
    for _, className in ipairs(toFind) do
        for index, item in pairs(sugarInventoryItems) do
            if item.class == "spawned_weapon" and item.weaponclass == className then
                tblItems[index] = item.amount
                break
            elseif item.class == "ent_sugar_token" and string.lower(item.name) == string.lower(className) then
                tblItems[index] = item.amount
                break
            elseif item.class == "ent_lootbox" and string.lower(item.name) == string.lower(className) then
                tblItems[index] = item.amount
                break
            elseif item.class == className then
                tblItems[index] = item.amount
                break
            end
        end
    end
end

//	for weapons/entities it should be the classname (e.g. "tfcss_galil")
//	for tokens & lootboxes it should be the token name (e.g. "prestige token")
//	
local toFind = { "weapon_maxwell_deploy", "ent_unstable_gem" }

FindInventoryItemByClassname(toFind)
