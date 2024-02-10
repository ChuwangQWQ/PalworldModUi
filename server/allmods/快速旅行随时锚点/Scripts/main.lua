local hooked = false

RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(self, NewPawn)
    if not hooked then
        hooked = true
        -- /Game/Pal/Blueprint/UI/UserInterface/Map/WBP_Map_Base.WBP_Map_Base_C:OnSetup
        RegisterHook("/Game/Pal/Blueprint/UI/UserInterface/Map/WBP_Map_Base.WBP_Map_Base_C:OnSetup", function(self)
            print("adasd")
            local map_base = self:get()
            print("Hooked when WBP_Map_Base_C created!!")
            print(string.format("[Travel] [%d]\n", map_base:GetAddress()))
            map_base['Can Fast Travel'] = true
            --local old = map_base:index("Can Fast Travel")
            --map_base:__newindex("Can Fast Travel", true)
            --local new = map_base:index("Can Fast Travel")
        -- print(string.format("[Travel] [%d]\n", map_base:index("Can Fast Travel")))
        end)

        -- /Game/Pal/Blueprint/UI/UserInterface/Map/WBP_Map_Body.WBP_Map_Body_C:OnLoaded_D35D903A4572C11561B776A766C7733D
        RegisterHook("/Game/Pal/Blueprint/UI/UserInterface/Map/WBP_Map_Body.WBP_Map_Body_C:OnLoaded_D35D903A4572C11561B776A766C7733D", function(self)
            print("gwgw")
            local map_body = self:get()
            print("Hooked when WBP_Map_Body_C created!!")
            map_body.CanFastTravel = true
            print(string.format("[Travel] [%d]\n", map_body:GetAddress()))
            print(string.format("[Travel] [%s]\n", tostring(map_body.CanFastTravel)))
        end)

        local map_bases = FindAllOf("WBP_Map_Base_C")
        if map_bases then 
            for Index,map_base in pairs(map_bases) do
                print(string.format("[Travel] [%d]\n", map_base:GetAddress()))
                map_base['Can Fast Travel'] = true
            end
        end
    end
end)