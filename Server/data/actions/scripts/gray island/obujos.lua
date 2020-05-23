function onUse(cid, item, fromPosition, itemEx, toPosition)
	local config = {
		storage = 933876, -- boss storage
		exaust = 933776, -- exaust storage
		hours = 10
	}

	if getPlayerStorageValue(cid, config.storage) < 1 then
		return doPlayerSendCancel(cid, "You have to kill the boss before.")
	end

	if getPlayerStorageValue(cid, config.exaust) >= os.time() then
		return doPlayerSendTextMessage(cid, 19, "Obujos fights for his belongings and will not let you have them.")
	end

		doPlayerAddItem(cid, 15619, 1) -- trophy of obujos
		doPlayerAddItem(cid, 2152, 30) -- 30 platinum coin
		doPlayerAddItem(cid, 15400, 1) -- deepling staff
		doPlayerAddItem(cid, 15454, 1) -- guardian axe

		randomitem = math.random(1,2)

		if randomitem == 1 then
		doPlayerAddItem(cid, 15436, 1) -- obujos shell
		setPlayerStorageValue(cid, config.storage, 2)
		setPlayerStorageValue(cid, config.exaust, os.time()+config.hours*3600)
		return doPlayerSendTextMessage(cid,19,"You have found 1 trophy of obujos, 30 platinum coins, 1 deepling staff, 1 guardian axe and 1 obujos shell.")

		elseif randomitem == 2 then
		doPlayerAddItem(cid, 7632, 1) -- giant shimmering pearl
		setPlayerStorageValue(cid, config.storage, 2)
		setPlayerStorageValue(cid, config.exaust, os.time()+config.hours*3600)
		return doPlayerSendTextMessage(cid,19,"You have found 1 trophy of obujos, 30 platinum coins, 1 deepling staff, 1 guardian axe and 1 giant shimmering pearl.")
	end
end