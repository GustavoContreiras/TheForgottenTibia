function onUse(cid, item, fromPosition, itemEx, toPosition)
	local config = {
		storage = 933875, -- boss storage
		exaust = 933775, -- exaust storage
		hours = 10
	}

	if getPlayerStorageValue(cid, config.storage) < 1 then
		return doPlayerSendCancel(cid, "You have to kill the boss before.")
	end

	if getPlayerStorageValue(cid, config.exaust) >= os.time() then
		return doPlayerSendTextMessage(cid, 19, "Jaul fights for his belongings and will not let you have them.")
	end

		doPlayerAddItem(cid, 15621, 1) -- trophy of Jaul
		doPlayerAddItem(cid, 2152, 50) -- 50 platinum coin
		doPlayerAddItem(cid, 15453, 1) -- warrior shield
		doPlayerAddItem(cid, 15454, 1) -- guardian axe

		randomitem = math.random(1,2)

		if randomitem == 1 then
		doPlayerAddItem(cid, 15434, 1) -- jaul pearl
		setPlayerStorageValue(cid, config.storage, 2)
		setPlayerStorageValue(cid, config.exaust, os.time()+config.hours*3600)
		return doPlayerSendTextMessage(cid,19,"You have found 1 trophy of jaul, 50 platinum coins, 1 warrior shield, 1 guardian axe and 1 jaul pearl.")

		elseif randomitem == 2 then
		doPlayerAddItem(cid, 15403, 1) -- necklace of the deep	
		setPlayerStorageValue(cid, config.storage, 2)
		setPlayerStorageValue(cid, config.exaust, os.time()+config.hours*3600)
		return doPlayerSendTextMessage(cid,19,"You have found 1 trophy of jaul, 50 platinum coins, 1 warrior shield, 1 guardian axe and 1 necklace of the deep.")
	end
end