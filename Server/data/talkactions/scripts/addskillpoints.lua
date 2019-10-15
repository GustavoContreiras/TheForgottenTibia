function onSay(player, words, param)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Server is now closed.")
	player:addSkillPoints(10)
	player:sendTextMessage("added.")
end
