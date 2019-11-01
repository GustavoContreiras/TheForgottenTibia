function onSay(player, words, param)
    	monster = KILLTASKS_MONSTERS[param]
	if monster then
		player:setStorageValue(monster.countstorage, monster.amount+1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'Congratulations, you completed the '..monster.plural..' task.')
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'Task do not exist or wrong spelling: ' .. param)
	end
	
	return false
end
