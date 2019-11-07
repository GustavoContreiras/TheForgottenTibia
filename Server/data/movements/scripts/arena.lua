local storage = 7000

function onStepIn(creature, item, position, fromPosition)	
	if not creature:isPlayer() then
		return false
	end
	
	if item.actionid == 2035 then
		creature:setStorageValue(storage, 1)
		creature:sendTextMessage(MESSAGE_INFO_DESCR, "You have entered the arena.")
		creature:registerEvent("Arena-Death")

	elseif item.actionid == 2036 then
		if creature:getName() == "Knight Level 120" then
			local pos = Position(33059, 31334, 10)
			creature:sendTextMessage(MESSAGE_INFO_DESCR, "You can not leave the arena!")
			creature:teleportTo(pos)
			pos:sendMagicEffect(CONST_ME_TELEPORT)
			return false
		else
			local pos = Position(33059, 31328, 10)
			creature:setStorageValue(storage, 0)
			creature:sendTextMessage(MESSAGE_INFO_DESCR, "You have left the arena.")
			creature:removeCondition(CONDITION_INFIGHT)
			creature:addHealth(creature:getMaxHealth())
			creature:addMana(creature:getMaxMana())
			creature:teleportTo(pos)
			pos:sendMagicEffect(CONST_ME_TELEPORT)
			creature:unregisterEvent("Arena-Death")
		end
	end

	return true
end