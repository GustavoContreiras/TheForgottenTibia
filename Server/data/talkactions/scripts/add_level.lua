local function getExpForLevel(level)
	level = level - 1
	return ((50 * level * level * level) - (150 * level * level) + (400 * level)) / 3
end

function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local split = param:split(",")
	
	local target = Player(split[1])
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	target:addExperience(getExpForLevel(target:getLevel() + 1) - target:getExperience(), false)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Player " .. target:getName() .. " is level " .. target:getLevel() .. ".")
	return false
end
