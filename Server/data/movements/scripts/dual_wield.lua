function onEquip(player, item, slot, isCheck)
	if isCheck == false then
		if player:getSlotItem(CONST_SLOT_RIGHT) and player:getSlotItem(CONST_SLOT_LEFT) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Dual-Wield mode enabled:')
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Attack speed fixed in 200%.')
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Weapon damage reduced to 70%.')
		end
	end
	return true
end