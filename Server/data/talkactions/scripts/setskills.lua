function onSay(player, words, param)
	if param == "magic" then
    	player:setSkills(40, 0, 0, 0, 0, 0, 0, 0)
	end
    return false
end