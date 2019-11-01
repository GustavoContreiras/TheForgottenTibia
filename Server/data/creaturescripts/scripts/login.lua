-- ordered as in creaturescripts.xml
local events = {
	--'TutorialCockroach',
	--'ElementalSpheresOverlords',
	--'BigfootBurdenVersperoth',
	--'BigfootBurdenWarzone',
	--'BigfootBurdenWeeper',
	--'BigfootBurdenWiggler',
	'SvargrondArenaKill',
	--'NewFrontierShardOfCorruption',
	--'NewFrontierTirecz',
	--'ServiceOfYalaharDiseasedTrio',
	--'ServiceOfYalaharAzerus',
	--'ServiceOfYalaharQuaraLeaders',
	--'InquisitionBosses',
	--'InquisitionUngreez',
	--'KillingInTheNameOfKills',
	--'MastersVoiceServants',
	--'SecretServiceBlackKnight',
	--'ThievesGuildNomad',
	--'WotELizardMagistratus',
	--'WotELizardNoble',
	--'WotEKeeper',
	--'WotEBosses',
	--'WotEZalamon',
	'PlayerDeath',
	--'AdvanceSave',
	--'AdvanceRookgaard',
	--'PythiusTheRotten',
	'DropLoot',
	'Tasks'
}

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
		--player:sendSkillPointsTutorialWelcomeWindow()
		if player:getLastLoginSaved() <= 0 then
			player:setStorageValue(62492, 1) -- storage to check free first reset in npc
			-- player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Click on your character holding 'ctrl' to access character's mastery.")
		end
	else
		player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
		player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
	end

	-- Stamina
	nextUseStaminaTime[player.uid] = 0

	-- God outfit
	if getPlayerAccess(cid) == 6 then
		doSetCreatureOutfit(cid, 322, -1)-- -1 = unlimted
		return true
	end

	-- Events
	for i = 1, #events do
		player:registerEvent(events[i])
	end
	
	return true
end
