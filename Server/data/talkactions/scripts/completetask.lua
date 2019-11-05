function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end
	
	local split = param:split(",")
	if not split[2] then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Usage: /completetask Player, TaskMonster")
		return false
	end

	local target = Player(split[1])
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end
	
	taskMonster = string.gsub(split[2], "%s", "", 1)
	taskMonster = taskMonster.lower(taskMonster)
    	
	local monster = KILLTASKS_MONSTERS[taskMonster]
	if monster then
		if target:getStorageValue(monster.statusstorage) ~= KILLTASKS_STATUS_DOING then
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'He got to be doing the task.')
			return true
		end
		target:setStorageValue(monster.countstorage, monster.amount+1)
		target:sendTextMessage(MESSAGE_INFO_DESCR, target:getName() .. ' completed the '..monster.plural..' task.')
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'Task do not exist or wrong spelling: "' .. taskMonster .. '"')
	end
	
	return false
end
