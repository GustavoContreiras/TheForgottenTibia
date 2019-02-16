function onSay(player, words, param)

	if param == "gold" or param == "platinum" or param == "cash" or param == "money" then
		if player:toggleAutoLootGold() then
        	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Enabled auto looting coins.")
    	else
        	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Disabled auto looting coins.")
    	end
		--[[if player:getStorageValue(60320) == 0 then
			player:setStorageValue(60320, 1)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Enabled auto looting coins.")
		elseif player:getStorageValue(60321) ~= 0 then
			player:setStorageValue(60320, 0)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Disabled auto looting coins.")
		end]]
	elseif param == "addon" or param == "addons" then
		--[[if player:getStorageValue(60321) == 0 then
			player:setStorageValue(60321, 1)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Enabled auto looting addon items.")
		elseif player:getStorageValue(60321) ~= 0 then
			player:setStorageValue(60321, 0)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Disabled auto looting addon items.")
		end]]
		if player:toggleAutoLootAddon() then
        	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Enabled auto looting addon items.")
    	else
        	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Disabled auto looting addon items.")
    	end
	end
	return false
end
