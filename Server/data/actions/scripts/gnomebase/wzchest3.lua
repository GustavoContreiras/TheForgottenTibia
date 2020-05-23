function onUse(cid, item, fromPosition, itemEx, toPosition)
	local config = {
		storage = 724879,
		bstorage = 924879, -- boss storage
		hours = 20
	}

	if getPlayerStorageValue(cid, config.bstorage) < 1 then
		return doPlayerSendTextMessage(cid, 19, "Abyssador defends his belongings and will not let you open his chest.")
	end

	if getPlayerStorageValue(cid, config.storage) >= os.time() then
		return doPlayerSendTextMessage(cid, 19, "Abyssador defends his belongings and will not let you open his chest.")
	end

		doPlayerAddItem(cid, 18423, 2) -- 2 major crystalline tokens
		doPlayerAddItem(cid, 18408, 1) -- 1 prismatic ring
		doPlayerAddItem(cid, 18396, 1) -- 1 mucus plug
		doPlayerAddItem(cid, 18414, 12) -- 12 violet crystal shards
		setPlayerStorageValue(cid, config.storage, os.time()+config.hours*3600)
		setPlayerStorageValue(cid, config.bstorage,-1)
		return doPlayerSendTextMessage(cid,19,"You have found 2 major crystalline tokens, 1 prismatic ring, 1 mucus plug and 10 violet crystal shards, wait "..config.hours.." hours to use this again.")
end