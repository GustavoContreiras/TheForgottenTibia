function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local split = param:split(",")
	if not split[2] then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Usage: /addresets Player, 1")
		return false
	end

	local target = Player(split[1])
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	player:addResetsCount(split[2]) 
	
	return false
end
