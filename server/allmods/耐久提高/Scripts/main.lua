duraMult = 5
-- Tools
RegisterKeyBind(Key.NUM_ONE, function()
	print("Durability multiplier is " ..tostring(duraMult))
    local items = FindAllOf("PalDynamicWeaponItemDataBase")
    if items then
        for _, item in ipairs(items) do
            local name = item.StaticId:ToString()
            if string.find(name, "Pickaxe") or string.find(name, "Axe") or string.find(name, "FishingRod") or string.find(name, "MeatCutterKnife") or string.find(name, "Torch") then
                if item.OldDurability then
                    print("Old durability - " .. tostring(item.OldDurability) .. " - ".. name .. "")
                end
                if item.MaxDurability then
                    print("Max durability - " .. tostring(item.MaxDurability) .. " - ".. name .. "")
                    if item.MaxDurability <= item.OldDurability then
                    	item.MaxDurability = item.OldDurability * duraMult
                    end
                    print("New max durability - " .. tostring(item.MaxDurability) .. " - ".. name .. "")
                end
                if item.Durability then
                    print("Durability - " .. tostring(item.Durability) .. " - ".. name .. "")
                    if item.Durability <= item.OldDurability then
                    	item.Durability = (item.Durability / (item.MaxDurability / duraMult)) * item.MaxDurability
                    end
                    print("New durability - " .. tostring(item.Durability) .. " - ".. name .. "")
                end
            end           
        end
    else
        print("No tools found.\n")
    end
end)

-- Weapons
RegisterKeyBind(Key.NUM_TWO, function()
	print("Durability multiplier is " ..tostring(duraMult))
    local items = FindAllOf("PalDynamicWeaponItemDataBase")
    if items then
        for _, item in ipairs(items) do
            local name = item.StaticId:ToString()
            if string.find(name, "Spear") or string.find(name, "Bow") or string.find(name, "Bat") or string.find(name, "ElecBaton") or string.find(name, "DoubleBarrelShotgun") or string.find(name, "GrapplingGun") or string.find(name, "HandGun") or string.find(name, "HomingSphereLauncher") or string.find(name, "Launcher") or string.find(name, "MakeshiftHandgun") or string.find(name, "Musket") or string.find(name, "SingleShotRifle") or string.find(name, "Spear") or string.find(name, "SphereLauncher") or string.find(name, "AssaultRifle") or string.find(name, "PumpActionShotgun") or string.find(name, "WeakerBow") or string.find(name, "LaserRifle") or string.find(name, "RecurveBow") or string.find(name, "PV_AssaultRifle") or string.find(name, "SniperRifle") then
                if item.OldDurability then
                    print("Old durability - " .. tostring(item.OldDurability) .. " - ".. name .. "")
                end
                if item.MaxDurability then
                    print("Max durability - " .. tostring(item.MaxDurability) .. " - ".. name .. "")
                    if item.MaxDurability <= item.OldDurability then
                    	item.MaxDurability = item.OldDurability * duraMult
                    end
                    print("New max durability - " .. tostring(item.MaxDurability) .. " - ".. name .. "")
                end
                if item.Durability then
                    print("Durability - " .. tostring(item.Durability) .. " - ".. name .. "")
                    if item.Durability <= item.OldDurability then
                    	item.Durability = (item.Durability / (item.MaxDurability / duraMult)) * item.MaxDurability
                    end
                    print("New durability - " .. tostring(item.Durability) .. " - ".. name .. "")
                end
            end           
        end
    else
        print("No weapons found.\n")
    end
end)
