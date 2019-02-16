function onLogin(player)
	if player:getStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL) == 1 or player:getStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL) == 1 then
		player:registerEvent("WarServer-Death")
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have entered the PVP War Server.")

		if Game.getStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT) <= Game.getStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT) then
			local greenOutfit = Condition(CONDITION_OUTFIT)
		    greenOutfit:setOutfit(configWarServer.greenOutfit)
		    greenOutfit:setTicks(-1)
			player:teleportTo(configWarServer.greenTeamStartPos)
	        player:setStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL, 1)
	        player:setStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL, 0)
	        Game.setStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT, Game.getStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT) + 1)

	    elseif Game.getStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT) <= Game.getStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT) then
	    	local redOutfit = Condition(CONDITION_OUTFIT)
		    redOutfit:setOutfit(configWarServer.redOutfit)
		    redOutfit:setTicks(-1)
	    	player:setStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL, 0)
	        player:setStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL, 1)
	        Game.setStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT, Game.getStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT) + 1)
    	end
	end
	return true
end

function onLogout(player)
	if player:getStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL) == 1 or player:getStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL) == 1 then
		player:unregisterEvent("WarServer-Death")

		if player:getStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL) == 1 then
	    	Game.setStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT, Game.getStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT) - 1)

	    elseif player:getStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL) == 1 then
	    	Game.setStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT, Game.getStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT) - 1)
	    end
	end
	return true
end


function onPrepareDeath(player, killer)

	player:removeCondition(CONDITION_INFIGHT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "YOU DIED")
	player:addHealth(player:getMaxHealth())
	player:addMana(player:getMaxMana())
	player:setDropLoot(false)
	if killer then
		killer:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
	end

	if player:getStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL) == 1 then
        player:teleportTo(configWarServer.greenTeamStartPos)

	elseif player:getStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL) == 1 then
        player:teleportTo(configWarServer.redTeamStartPos)
	end

	return false
end