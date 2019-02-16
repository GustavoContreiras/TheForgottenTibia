function onUse(player, item, fromPosition, target, toPosition)

    if Game.getStorageValue(configCTF.event) == 3 then

    	-- RED FLAG
        if item.itemid == configCTF.redFlagItemId and item:getAttribute('aid') == configCTF.flagActionId then

        	-- RED PLAYER SEM A GREEN FLAG
            if player:getStorageValue(configCTF.playerIsRedTeam) == 1 and player:getStorageValue(configCTF.playerHasGreenFlag) ~= 1 then
                return player:sendCancelMessage("You cannot take your own flag.")
            end

            -- RED PLAYER COM A GREEN FLAG
            if player:getStorageValue(configCTF.playerIsRedTeam) and player:getStorageValue(configCTF.playerHasGreenFlag) == 1 then
                player:setStorageValue(configCTF.playerHasGreenFlag, 0)
                Game.setStorageValue(configCTF.scoreRedTeam, Game.getStorageValue(configCTF.scoreRedTeam) + 1)
                Game.broadcastMessage("Red team has scored a flag!")
                flag_pos = Tile(configCTF.greenFlagPos)
                flag = flag_pos:getItemById(configCTF.noFlagItemId)
                flag:remove()
                no_flag = doCreateItem(configCTF.greenFlagItemId, 1, configCTF.greenFlagPos)
                item_flag_pos = Tile(configCTF.greenFlagPos)
                item_flag = item_flag_pos:getItemById(configCTF.greenFlagItemId)
                item_flag:setAttribute('aid', configCTF.flagActionId)
                if Game.getStorageValue(configCTF.scoreRedTeam) >= configCTF.maxFlagsCaptured then
                    endCTF()
                end
            end

            -- GREEN PLAYER
            if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
                player:setStorageValue(configCTF.playerHasRedFlag, 1)
                flag_pos = Tile(configCTF.redFlagPos)
                flag = flag_pos:getItemById(configCTF.redFlagItemId)
                flag:remove()
                local no_flag = Game.createItem(configCTF.noFlagItemId, 1, configCTF.redFlagPos)
                no_flag:setAttribute('aid', configCTF.flagActionId)
                Game.broadcastMessage("Green team has taken the flag!")
            end
           
        -- GREEN FLAG
        elseif item.itemid == configCTF.greenFlagItemId and item:getAttribute('aid') == configCTF.flagActionId then

        	-- GREEN PLAYER SEM A RED FLAG
            if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 and player:getStorageValue(configCTF.playerHasRedFlag) ~= 1 then
                return player:sendCancelMessage("You cannot take your own flag.")
            end

            -- GREEN PLAYER COM A RED FLAG
            if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 and player:getStorageValue(configCTF.playerHasRedFlag) == 1 then
                player:setStorageValue(configCTF.playerHasRedFlag, 0)
                Game.setStorageValue(configCTF.scoreGreenTeam, Game.getStorageValue(configCTF.scoreGreenTeam) + 1)
                Game.broadcastMessage("Green team has scored a flag!")
                flag_pos = Tile(configCTF.redFlagPos)
                flag = flag_pos:getItemById(configCTF.noFlagItemId)
                flag:remove()
                no_flag = doCreateItem(configCTF.redFlagItemId, 1, configCTF.redFlagPos)
                item_flag_pos = Tile(configCTF.redFlagPos)
                item_flag = item_flag_pos:getItemById(configCTF.redFlagItemId)
                item_flag:setAttribute('aid', configCTF.flagActionId)
                if Game.getStorageValue(configCTF.scoreGreenTeam) >= configCTF.maxFlagsCaptured then
                    endCTF()
                end
            end

            -- RED PLAYER
            if player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
                player:setStorageValue(configCTF.playerHasGreenFlag, 1)
                flag_pos = Tile(configCTF.greenFlagPos)
                flag = flag_pos:getItemById(configCTF.greenFlagItemId)
                flag:remove()
                local no_flag = Game.createItem(configCTF.noFlagItemId, 1, configCTF.greenFlagPos)
                no_flag:setAttribute('aid', configCTF.flagActionId)
                Game.broadcastMessage("Red team has taken the flag!")
            end
           
        -- NO FLAG
        elseif item.itemid == configCTF.noFlagItemId and item:getAttribute('aid') == configCTF.flagActionId then

        	-- RED FLAG POSITION
        	if fromPosition == Position(configCTF.redFlagPos) then

	        	-- GREEN PLAYER
	            if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
	                return player:sendCancelMessage("The red teams flag has already been captured.")
	            end
	           
	            -- RED PLAYER COM GREEN FLAG
	            if player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
	                if player:getStorageValue(configCTF.playerHasGreenFlag) == 1 then
	                    return player:sendCancelMessage("Your flag must be returned before you deliver the enemies flag.")
	                else
	                    return player:sendCancelMessage("Go get your flag!")
	                end
	            end
           
        	-- GREEN FLAG POSITION
        	elseif fromPosition == Position(configCTF.greenFlagPos) then
            
	        	-- RED PLAYER
	            if player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
	                return player:sendCancelMessage("The green teams flag has already been captured.")
	            end
	           
	           	-- GREEN PLAYER COM RED FLAG
	            if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
	                if player:getStorageValue(configCTF.playerHasRedFlag) == 1 then
	                    return player:sendCancelMessage("Your flag must be returned before you deliver the enemies flag.")
	                else
	                    return player:sendCancelMessage("Go get your flag!")
	                end
	            end
	        end
        end
    else
    	player:teleportTo(configCTF.temple)
        return player:sendCancelMessage("Capture the Flag event is not happening.")
    end
    return true
end