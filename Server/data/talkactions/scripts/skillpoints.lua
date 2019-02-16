function onSay(player, words, param)
	if param == "mastery" then
    	player:sendSkillPointsWindow()
	end
    if param == "tutorial" then
    	player:sendSkillPointsTutorialWelcomeWindow()
    end
    return false
end