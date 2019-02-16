local exit = Position(33058, 31328, 10)
local storage = 7000

function onLogin(player)
	if player:getStorageValue(storage) > 0 then
		player:setStorageValue(storage, 0)
	end
	return true
end

function onLogout(player)
	if player:getStorageValue(storage) > 0 then
		player:sendCancelMessage("You can not logout in the arena.")
		return false
	end
	return true
end

function onPrepareDeath(player, killer)
	if player:getStorageValue(storage) > 0 and killer:getStorageValue(storage) > 0 then
		player:removeCondition(CONDITION_INFIGHT)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You died in the arena!")
		player:addHealth(player:getMaxHealth())
		--player:addMana(player:getMaxMana())
		player:setStorageValue(storage, 0)
		player:unregisterEvent("Arena-Death")
		player:teleportTo(exit)
		killer:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
		return false
	end
end