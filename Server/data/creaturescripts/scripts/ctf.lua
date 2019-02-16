function onPrepareDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)

    if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
        player:setDropLoot(false)
        player:teleportTo(configCTF.greenTeamStartPos)
        player:addHealth(player:getMaxHealth())
        if player:getStorageValue(configCTF.playerHasRedFlag) == 1 then
            player:setStorageValue(configCTF.playerHasRedFlag, 0)
            flag_pos = Tile(configCTF.redFlagPos)
            flag = flag_pos:getItemById(configCTF.noFlagItemId)
            flag:remove()
            no_flag = doCreateItem(configCTF.redFlagItemId, 1, configCTF.redFlagPos)
            item_flag_pos = Tile(configCTF.redFlagPos)
            item_flag = item_flag_pos:getItemById(configCTF.redFlagItemId)
            item_flag:setAttribute('aid', configCTF.flagActionId)
        end
        
    elseif player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
        player:setDropLoot(false)
        player:teleportTo(configCTF.redTeamStartPos)
        player:addHealth(player:getMaxHealth())
        if player:getStorageValue(configCTF.playerHasGreenFlag) == 1 then
            player:setStorageValue(configCTF.playerHasGreenFlag, 0)
            flag_pos = Tile(configCTF.greenFlagPos)
            flag = flag_pos:getItemById(configCTF.noFlagItemId)
            flag:remove()
            no_flag = doCreateItem(configCTF.greenFlagItemId, 1, configCTF.greenFlagPos)
            item_flag_pos = Tile(configCTF.greenFlagPos)
            item_flag = item_flag_pos:getItemById(configCTF.greenFlagItemId)
            item_flag:setAttribute('aid', configCTF.flagActionId)
        end
    end
end

function onLogin(player)
    if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
        player:setStorageValue(configCTF.playerIsGreenTeam, 0)
        Game.setStorageValue(configCTF.greenTeam, Game.getStorageValue(configCTF.greenTeam) - 1)
    elseif player:getStorageValue(configCTF.playerHasGreenFlag) == 1 then
    	player:setStorageValue(configCTF.playerHasGreenFlag, 0)
    elseif player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
        player:setStorageValue(configCTF.playerIsRedTeam, 0)
        Game.setStorageValue(configCTF.redTeam, Game.getStorageValue(configCTF.redTeam) - 1)
    elseif player:getStorageValue(configCTF.playerHasRedFlag) == 1 then
    	player:setStorageValue(configCTF.playerHasRedFlag, 0)
    end
    return true
end

function onLogout(player)
    if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
        player:setStorageValue(configCTF.playerIsGreenTeam, 0)
        Game.setStorageValue(configCTF.greenTeam, Game.getStorageValue(configCTF.greenTeam) - 1)
    elseif player:getStorageValue(configCTF.playerHasGreenFlag) == 1 then
    	player:setStorageValue(configCTF.playerHasGreenFlag, 0)
    elseif player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
        player:setStorageValue(configCTF.playerIsRedTeam, 0)
        Game.setStorageValue(configCTF.redTeam, Game.getStorageValue(configCTF.redTeam) - 1)
    elseif player:getStorageValue(configCTF.playerHasRedFlag) == 1 then
    	player:setStorageValue(configCTF.playerHasRedFlag, 0)
    end
    return true
end