local config = {
    pos1 = Position(33260, 31488, 7),
    pos2 = Position(33272, 31574, 7)
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

	if item.itemid == 1280 and item.actionid == 1210 then 
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(config.pos1)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	elseif item.itemid == 1280 and item.actionid == 1211 then 
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(config.pos2)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		return false    
	end
	return true
end