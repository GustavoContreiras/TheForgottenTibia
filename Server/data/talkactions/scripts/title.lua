function onSay(player, words, param)
	if param == "remove" then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Title removed.")
		player:setTitleDescription(0)
	elseif param == "magician" or param == "mage" or param == "sorcerer" then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are now a mage.")
		player:setTitleDescription(1)
	elseif param == "supporter" or param == "support" or param == "druid" then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are now a supporter.")
		player:setTitleDescription(2)
	elseif param == "ranger" or param == "paladin" or param == "pala" then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are now a ranger.")
		player:setTitleDescription(3)
	elseif param == "knight" then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are now a knight.")
		player:setTitleDescription(4)
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Valid parameters are 'mage', 'supporter', 'ranger', 'knight' and 'remove'.")
	end
	return false
end
