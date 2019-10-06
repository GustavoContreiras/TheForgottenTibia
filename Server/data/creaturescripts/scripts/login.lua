function onLogin(player)
	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 or player:getLevel() == 1 then
		loginStr = loginStr .. " Please assign your points."

		player:addOutfitAddon(128, 1)
		player:addOutfitAddon(136, 1)
		player:addBlessing(1)
		player:addBlessing(2)
		player:addBlessing(3)
		player:addBlessing(4)
		player:addBlessing(5)

		-- Skill Points
		player:sendSkillPointsTutorialWelcomeWindow()
		if player:getLastLoginSaved() <= 0 then
			player:setStorageValue(62492, 1) -- storage to check free first reset in npc
			player:addSkillPoints(10)
			-- player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Click on your character holding 'ctrl' to access character's mastery.")
		end
	else
		player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
		player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
	end

	-- Stamina
	nextUseStaminaTime[player.uid] = 0

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(STORAGEVALUE_PROMOTION)
		if not promotion and value ~= 1 then
			player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
		elseif value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

	-- God outfit
	if getPlayerAccess(cid) == 6 then
		doSetCreatureOutfit(cid, 322, -1)-- -1 = unlimted
		return true
	end

	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("Tasks")
	return true
end
