function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:getPosition():sendMagicEffect(50)
	item:remove(1)
	return true
end