RegisterHook("/Script/Engine.PlayerController:ClientRestart", function()
	hatchTime()
end)

NotifyOnNewObject("/Script/Pal.PalGameSetting", function(hatchTime)
	hatchTime.LongPressInterval_GetHatchedPal = 0
end)