function onUse(cid, item, fromPosition, itemEx, toPosition)
	local config = {
		storage = 933877, -- boss storage
		exaust = 933777, -- exaust storage
		hours = 10
	}

	if getPlayerStorageValue(cid, config.storage) < 1 then
		return doPlayerSendCancel(cid, "You have to kill the boss before.")
	end

	if getPlayerStorageValue(cid, config.exaust) >= os.time() then
		return doPlayerSendTextMessage(cid, 19, "Tanjis fights for his belongings and will not let you have them.")
	end

		doPlayerAddItem(cid, 15620, 1) -- trophy of tanjis
		doPlayerAddItem(cid, 2152, 20) -- 20 platinum coin
		doPlayerAddItem(cid, 15403, 1) -- necklace of the deep
		doPlayerAddItem(cid, 15453, 1) -- warrior shield

		randomitem = math.random(1,2)

		if randomitem == 1 then
		doPlayerAddItem(cid, 15435, 1) -- tanjis sight
		setPlayerStorageValue(cid, config.storage, 2)
		setPlayerStorageValue(cid, config.exaust, os.time()+config.hours*3600)
		return doPlayerSendTextMessage(cid,19,"You have found 1 trophy of tanjis, 20 platinum coins, 1 necklace of the deep, 1 warrior shield and 1 tanjis sight.")

		elseif randomitem == 2 then
		doPlayerAddItem(cid, 2144, 10) -- 10 black pearl	
		setPlayerStorageValue(cid, config.storage, 2)
		setPlayerStorageValue(cid, config.exaust, os.time()+config.hours*3600)
		return doPlayerSendTextMessage(cid,19,"You have found 1 trophy of tanjis, 20 platinum coins, 1 necklace of the deep, 1 warrior shield and 10 black pearl.")
	end
end