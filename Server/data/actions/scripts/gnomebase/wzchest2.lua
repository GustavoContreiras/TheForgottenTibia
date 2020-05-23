function onUse(cid, item, fromPosition, itemEx, toPosition)
	local config = {
		storage = 724878,
		bstorage = 924878, -- boss storage
		hours = 20
	}

	if getPlayerStorageValue(cid, config.bstorage) < 1 then
		return doPlayerSendTextMessage(cid, 19, "Gnomevil defends his belongings and will not let you open his chest.")
	end

	if getPlayerStorageValue(cid, config.storage) >= os.time() then
		return doPlayerSendTextMessage(cid, 19, "Gnomevil defends his belongings and will not let you open his chest.")
	end

		doPlayerAddItem(cid, 18423, 2) -- 2 major crystalline tokens
		doPlayerAddItem(cid, 18407, 750) -- 1 prismatic necklace
		doPlayerAddItem(cid, 18396, 1) -- 1 mucus plug
		doPlayerAddItem(cid, 18413, 10) -- 10 green crystal shards
		setPlayerStorageValue(cid, config.storage, os.time()+config.hours*3600)
		setPlayerStorageValue(cid, config.bstorage,-1)
		return doPlayerSendTextMessage(cid,19,"You have found 2 major crystalline tokens, 1 prismatic necklace, 1 mucus plug and 10 blue crystal shards, wait "..config.hours.." hours to use this again.")
end