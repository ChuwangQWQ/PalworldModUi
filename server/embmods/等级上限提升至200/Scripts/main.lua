print("MaxLevelIncreased loaded\n")

NotifyOnNewObject("/Script/Pal.PalGameSetting", function(var)
	var.CharacterMaxLevel = 200
	var.GuildCharacterMaxLevel = 200
end)
