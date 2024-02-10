print("[serverlist.gg] Fair Merchant Prices\n")

NotifyOnNewObject("/Script/Pal.PalGameSetting", function(PalGameSetting)
	PalGameSetting.SellItemRate = 0.5
	PalGameSetting.SellPalRate = 0.5
end)