function onModalWindow(player, modalWindowId, buttonId, choiceId)

    if modalWindowId == 4869 then
        player:skillWindowChoice(modalWindowId, buttonId, choiceId)
    return true

    elseif modalWindowId == 4870 then
        player:sendSkillPointsWindow()
        return true

    elseif modalWindowId == 4871 then
        player:unregisterEvent("skillPoints_tutorialWelcome")
        if buttonId == 0 then
            warServerWhenPlayerClickOnGoToPVPWarServer(player)
            return true
        elseif buttonId == 1 then
            player:sendSkillPointsTutorialOneHandedMeleeWindow()
        end
        return true

    elseif modalWindowId == 4872 then
        player:unregisterEvent("skillPoints_tutorialOneHandedMelee")
        if buttonId == 1 then
            player:sendSkillPointsTutorialTwoHandedMeleeWindow()
        end
        return true

    elseif modalWindowId == 4873 then
        player:unregisterEvent("skillPoints_tutorialTwoHandedMelee")
        if buttonId == 1 then
            player:sendSkillPointsTutorialOneHandedDistanceWindow()
        end
        return true

    elseif modalWindowId == 4874 then
        player:unregisterEvent("skillPoints_tutorialOneHandedDistance")
        if buttonId == 1 then
            player:sendSkillPointsTutorialTwoHandedDistanceWindow()
        end
        return true

    elseif modalWindowId == 4875 then
        player:unregisterEvent("skillPoints_tutorialTwoHandedDistance")
        if buttonId == 1 then
            player:sendSkillPointsTutorialMagesWindow()
        end
        return true

    elseif modalWindowId == 4876 then
        player:unregisterEvent("skillPoints_tutorialMages")
        if buttonId == 1 then
            player:sendSkillPointsTutorialNotesWindow()
        end
        return true

     elseif modalWindowId == 4877 then
        player:unregisterEvent("skillPoints_tutorialNotes")
        if buttonId == 1 then
            player:sendSkillPointsWindow()
        end
        return true
    end
end
 
function onAdvance(player, skill, oldLevel, newLevel)
    if skill == SKILL_LEVEL then
	if (oldLevel == 1 and newLevel == 2) or (oldLevel == 1 and newLevel == 3) then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Ctrl + click on an item and then choose 'Loot' to enable or disable auto-loot system.")

	elseif (oldLevel == 2 and newLevel == 3) or (oldLevel == 2 and newLevel == 4) then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Ctrl + click on on yourself and then choose 'Loot List' to see your current loot list.")
		
	elseif oldLevel == 7 or newLevel == 8 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Talk to The Oracle to go to the main island. On main, you have a free reset with Guide NPC.")

	elseif newLevel == 19 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "This is your last chance to buy blessings for 200 gold coins each. Talk to Alice north from the temple if you want it.")
	end
    end
    return true
end
 
function onLogin(player)
    player:registerEvent("skillPoints_advance")
    player:registerEvent("skillPoints_modal")
    return true
end
