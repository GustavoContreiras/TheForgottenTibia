local playerPosition = {
	{x = 33024, y = 31394, z = 13},
	{x = 33025, y = 31394, z = 13},
	{x = 33026, y = 31394, z = 13},
	{x = 33027, y = 31394, z = 13}
}

local newPosition = {
	{x = 33024, y = 31394, z = 14},
	{x = 33025, y = 31394, z = 14},
	{x = 33026, y = 31394, z = 14},
	{x = 33027, y = 31394, z = 14}
}

local demonPosition = {
	{x = 33024, y = 31392, z = 14},
	{x = 33026, y = 31392, z = 14},
	{x = 33028, y = 31394, z = 14},
	{x = 33029, y = 31394, z = 14},
	{x = 33025, y = 31396, z = 14},
	{x = 33027, y = 31396, z = 14}
}

local annihiQuestStorage = 1078 -- see customquests.lua

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then

		local players = {}
		for _, position in ipairs(playerPosition) do
			local topPlayer = Tile(position):getTopCreature()
			if not topPlayer or not topPlayer:isPlayer() or topPlayer:getLevel() < 100 or topPlayer:getStorageValue(annihiQuestStorage) ~= -1 then
				player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
				return false
			end
			players[#players + 1] = topPlayer
		end

		local monster1 = Game.createMonster("Demon", Position(demonPosition[1]))
		if monster1 then 
			monster1:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			return false
		end

		local monster2 = Game.createMonster("Demon", Position(demonPosition[2]))
		if monster2 then 
			monster2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			return false
		end

		local monster3 = Game.createMonster("Demon", Position(demonPosition[3]))
		if monster3 then 
			monster3:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			return false
		end

		local monster4 = Game.createMonster("Demon", Position(demonPosition[4]))
		if monster4 then 
			monster4:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			return false
		end

		local monster5 = Game.createMonster("Demon", Position(demonPosition[5]))
		if monster5 then 
			monster5:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			return false
		end
		local monster6 = Game.createMonster("Demon", Position(demonPosition[6]))
		if monster6 then 
			monster6:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			return false
		end

		for i, targetPlayer in ipairs(players) do
			Position(playerPosition[i]):sendMagicEffect(CONST_ME_POFF)
			targetPlayer:teleportTo(newPosition[i], false)
			targetPlayer:getPosition():sendMagicEffect(CONST_ME_ENERGYAREA)
		end

		item:transform(1946)
	elseif item.itemid == 1946 then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
	end
	return true
end
