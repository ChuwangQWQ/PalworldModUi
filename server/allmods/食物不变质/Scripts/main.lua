-- Author: yakuzadeso

RegisterHook("/Script/Pal.PalItemSlot:GetCorruptionProgressRate", function()
	-- persistent even when uninstalled because database but does remove the timer
	PalStaticItemDataBases = FindAllOf("PalStaticItemDataBase")
	for _, PalStaticItemDataBase in ipairs(PalStaticItemDataBases) do
		if PalStaticItemDataBase then
			if PalStaticItemDataBase.CorruptionFactor ~= nil then
				PalStaticItemDataBase.CorruptionFactor = 0.0
			end
		end
	end
end)
