function onSay(player, words)
    if (words == "/ctf") then
	    if not player:getGroup():getAccess() then
	        return true
	    end
	 
	    if player:getAccountType() < ACCOUNT_TYPE_GOD then
	        return false
	    end

	    Game.setStorageValue(configCTF.redTeam, 0)
	    Game.setStorageValue(configCTF.greenTeam, 0)
	    Game.setStorageValue(configCTF.playerIsRedTeam, 0)
	    Game.setStorageValue(configCTF.playerIsGreenTeam, 0)
	    Game.setStorageValue(configCTF.playerHasRedFlag, 0)
	    Game.setStorageValue(configCTF.playerHasGreenFlag, 0)
	    Game.setStorageValue(configCTF.scoreRedTeam, 0)
	    Game.setStorageValue(configCTF.scoreGreenTeam, 0)
	    Game.setStorageValue(configCTF.cycle, 0)

	    -- RESETING PLAYERS CTF STORAGE
	    players = Game.getPlayers()

	    for i = 1, #players do

	        player = Player(players[i])

	        if player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
	            player:setStorageValue(configCTF.playerIsRedTeam, 0)
	            player:teleportTo(configCTF.temple)

	        elseif player:getStorageValue(configCTF.playerHasGreenFlag) == 1 then
	            player:setStorageValue(configCTF.playerHasGreenFlag, 0)

	        elseif player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
	            player:setStorageValue(configCTF.playerIsGreenTeam, 0)
	            player:teleportTo(configCTF.temple)

	        elseif player:getStorageValue(configCTF.playerHasRedFlag) == 1 then
	            player:setStorageValue(configCTF.playerHasRedFlag, 0)
	        end
	    end 
	    
	    openCTF()
 
    elseif (words == "!joinCTF") then
        if player:getStorageValue(configCTF.playerIsRedTeam) == 1 or player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
            return player:sendCancelMessage("You have already joined the Capture the Flag event.")
        end
        playerJoinTeam(player)

    elseif (words == "!leaveCTF") then

        if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
            player:setStorageValue(configCTF.playerIsGreenTeam, 0)
            Game.setStorageValue(configCTF.greenTeam, Game.getStorageValue(configCTF.greenTeam) - 1)
            player:sendTextMessage(4, "You have left the event.")

        elseif player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
            player:setStorageValue(configCTF.playerIsRedTeam, 0)
            Game.setStorageValue(configCTF.redTeam, Game.getStorageValue(configCTF.redTeam) - 1)
            player:sendTextMessage(4, "You have left the event.")

        else
            player:sendTextMessage(4, "You are not in Capture the Flag event.")
        end
    end
return false
end