function onUse(cid, item, fromPosition, itemEx, toPosition)
	local config = {
		storage = 724877,
		bstorage = 924877, -- boss storage
		hours = 20
	}

	if getPlayerStorageValue(cid, config.bstorage) < 1 then
		return doPlayerSendTextMessage(cid, 19, "Deathstrike defends his belongings and will not let you open his chest.")
	end

	if getPlayerStorageValue(cid, config.storage) >= os.time() then
		return doPlayerSendTextMessage(cid, 19, "Deathstrike defends his belongings and will not let you open his chest.")
	end

		doPlayerAddItem(cid, 18423, 2) -- 2 major crystalline tokens
		doPlayerAddItem(cid, 18402, 750) -- 1 gill necklace
		doPlayerAddItem(cid, 18396, 1) -- 1 mucus plug
		doPlayerAddItem(cid, 18415, 7) -- 7 green crystal shards
		setPlayerStorageValue(cid, config.storage, os.time()+config.hours*3600)
		setPlayerStorageValue(cid, config.bstorage,-1)
		return doPlayerSendTextMessage(cid,19,"You have found 2 major crystalline tokens, 1 gill necklace, 1 mucus plug and 7 green crystal shards, wait "..config.hours.." hours to use this again.")
end