function onUse(cid, item, fromPosition, itemEx, toPosition)
	local config = {
	
		exaust = 933787, -- exaust storage
		hours = 2
	}

	if getPlayerStorageValue(1) == 1 then
		setPlayerStorageValue(cid, config.exaust, os.time()+config.hours*60)
		-- adicionar função pra sumonar, preguiça.
		end
		
end