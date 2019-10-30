configCTF = {
    event = 50000,              -- status of the event

    redOutfit = {lookType = 152, lookHead = 132, lookBody = 132, lookLegs = 132, lookFeet = 132, lookTypeEx = 0, lookAddons = 1},
    greenOutfit   = {lookType = 152, lookHead = 120, lookBody = 120, lookLegs = 120, lookFeet = 120, lookTypeEx = 0, lookAddons = 1},
     
    greenTeam = 50001,          -- holds the number of players of the team
    redTeam = 50002,            -- holds the number of players of the team
     
    scoreRedTeam = 50003,       -- red team score
    scoreGreenTeam = 50004,     -- green team score
     
    playerHasRedFlag = 50005,   -- if player has red flag this storage == 1
    playerHasGreenFlag = 50006, -- if player has green flag this storage == 1
     
    playerIsGreenTeam = 50007,  -- if player is on green team this storage == 1
    playerIsRedTeam = 50008,    -- if player is on red team this storage == 1
     
    cycle = 50009,              --
     
    maxPlayersPerTeam = 10,     -- max players per team
    requiredPlayers = 2,        -- minimum required players to event start
    maxFlagsCaptured = 4,       -- max flags captured to event end
    endAutomatic = true,        -- should the event end automatically?
    endAutomaticMinutes = 4,    -- time to end event

    redFlagPos = {x = 31586, y = 32190, z = 6},     -- red flag pos
    greenFlagPos = {x = 31640, y = 32190, z = 6},   -- green flag pos
     
    redFlagItemId = 1435,       -- red flag item id
    greenFlagItemId = 1437,     -- green flag item id
    noFlagItemId = 3608,        -- no flag item id

    flagActionId = 3000,        -- flag and no flag item action id
     
    redTeamStartPos = {x = 31589, y = 32190, z = 7},    -- red team start position
    greenTeamStartPos = {x = 31637, y = 32190, z = 7},  -- green team start position
     
    temple = {x = 33025, y = 31309, z = 6}              -- the temple outside the arena
}
 
function openCTF()
    Game.setStorageValue(configCTF.event, 1)
    Game.broadcastMessage("Capture the Flag is now open. Type !joinCTF to enter.")
end
 
function playerJoinTeam(player)
    if Game.getStorageValue(configCTF.event) == 1 or Game.getStorageValue(configCTF.event) == 2 then
        if Game.getStorageValue(configCTF.redTeam) > configCTF.maxPlayersPerTeam and Game.getStorageValue(configCTF.greenTeam) > configCTF.maxPlayersPerTeam then
            return player:sendCancelMessage("Both teams are full.")
        end
 
        if Game.getStorageValue(configCTF.redTeam) <= Game.getStorageValue(configCTF.greenTeam) and Game.getStorageValue(configCTF.redTeam) <= configCTF.maxPlayersPerTeam then
            player:setStorageValue(50008, 1)
            Game.setStorageValue(configCTF.redTeam, Game.getStorageValue(configCTF.redTeam) + 1)
            player:sendTextMessage(4, "You have joined the red team. Capture the Flag will start when enough players have joined. Type !leaveCTF to exit the queue")
        elseif Game.getStorageValue(configCTF.greenTeam) <= Game.getStorageValue(configCTF.redTeam) and Game.getStorageValue(configCTF.greenTeam) <= configCTF.maxPlayersPerTeam then
            player:setStorageValue(50007, 1)
            Game.setStorageValue(configCTF.greenTeam, Game.getStorageValue(configCTF.greenTeam) + 1)
            player:sendTextMessage(4, "You have joined the green team. Capture the Flag will start when enough players have joined. Type !leaveCTF to exit the queue")
        end
    else
        return player:sendCancelMessage("CTF is not open.")
    end
end
 
 
function checkCTF()
    if Game.getStorageValue(configCTF.event) == 1 then
        red_team = Game.getStorageValue(configCTF.redTeam)
        green_team = Game.getStorageValue(configCTF.greenTeam)
     
        if red_team + green_team >= configCTF.requiredPlayers then
            Game.broadcastMessage("Capture the Flag will start in 10 seconds.") -- delete
            --Game.broadcastMessage("Capture the Flag will start in 1 minute.")
            Game.setStorageValue(configCTF.event, 2)
            Game.setStorageValue(configCTF.cycle, 1)
            addEvent(nextStep, 10 * 1000) -- delete
            --addEvent(nextStep, 60 * 1000)
        end
    end
end
 
function nextStep()
    if Game.getStorageValue(configCTF.event) == 2 then
        red_team = Game.getStorageValue(configCTF.redTeam)
        green_team = Game.getStorageValue(configCTF.greenTeam)
 
        if red_team + green_team < configCTF.requiredPlayers then
            Game.broadcastMessage("Players have left the Capture the Flag event queue. There are not enough players for the event to start.")
            Game.setStorageValue(configCTF.event, 1)
            return false
        end
     
        if Game.getStorageValue(configCTF.cycle) < 1 then
            time_left = 1 - Game.getStorageValue(configCTF.cycle)
            Game.broadcastMessage("Capture the Flag will start in "..time_left.." minutes.")
            Game.setStorageValue(configCTF.cycle, Game.getStorageValue(configCTF.cycle) + 1)
            addEvent(nextStep, 60 * 1000)
        else
            Game.setStorageValue(configCTF.event, 3)
            Game.setStorageValue(configCTF.cycle, 0)
            addEvent(startCTF, 0)
        end
    end
end
 
function startCTF()

    local redOutfit = Condition(CONDITION_OUTFIT)
    redOutfit:setOutfit(configCTF.redOutfit)
    redOutfit:setTicks(-1)

    local greenOutfit = Condition(CONDITION_OUTFIT)
    greenOutfit:setOutfit(configCTF.greenOutfit)
    greenOutfit:setTicks(-1)

    players = Game.getPlayers()

    for i = 1, #players do

        player = Player(players[i])

        if player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
            player:teleportTo(configCTF.redTeamStartPos)
            player:addCondition(redOutfit)
            player:registerEvent("CTF-Death")
            player:sendTextMessage(4, "Capture the Flag event has started.")
            player:sendTextMessage(4, "Go get the enemies flag and deliver it to your base by clicking on your flag.")

        elseif player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
            player:teleportTo(configCTF.greenTeamStartPos)
            player:addCondition(greenOutfit)
            player:registerEvent("CTF-Death")
            player:sendTextMessage(4, "Capture the Flag event has started.")
            player:sendTextMessage(4, "Go get the enemies flag and deliver it to your base by clicking on your flag.")
        end

    end

    Game.setStorageValue(configCTF.scoreGreenTeam, 0)
    Game.setStorageValue(configCTF.scoreRedTeam, 0)

    if configCTF.endAutomatic == true then
        addEvent(endCTF, configCTF.endAutomaticMinutes * 60 * 1000)
    end
end
 
function endCTF()

	players = Game.getPlayers()

    if Game.getStorageValue(configCTF.scoreGreenTeam) > Game.getStorageValue(configCTF.scoreRedTeam) then
        for i = 1, #players do
            player = Player(players[i])
                if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
                    --Add rewards here
                    player:sendTextMessage(4, "Your team has won!")
                end
        end
        Game.broadcastMessage("Green Team has won Capture the Flag event!")

    elseif Game.getStorageValue(configCTF.scoreGreenTeam) < Game.getStorageValue(configCTF.scoreRedTeam) then
        for i = 1, #players do
            player = Player(players[i])
                if player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
                    --Add rewards here
                    player:sendTextMessage(4, "Your team has won!")
                end
        end
        Game.broadcastMessage("Red Team has won Capture the Flag event!")
     
    elseif Game.getStorageValue(configCTF.scoreGreenTeam) == Game.getStorageValue(configCTF.scoreRedTeam) then
        for i = 1, #players do
            player = Player(players[i])
                if player:getStorageValue(configCTF.playerIsGreenTeam) == 1 or player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
                    --Add tie rewards here
                    player:sendTextMessage(4, "There has been a tie!")
                end
        end
        Game.broadcastMessage("Both teams have tied playing Capture the Flag!")
    end
 
    -- RESETING PLAYERS CTF STORAGE
    players = Game.getPlayers()

    for i = 1, #players do

        player = Player(players[i])

        if player:getStorageValue(configCTF.playerIsRedTeam) == 1 then
            player:setStorageValue(configCTF.playerIsRedTeam, 0)
            player:removeCondition(CONDITION_OUTFIT)
            player:teleportTo(configCTF.temple)
            player:unregisterEvent("CTF-Death")

        elseif player:getStorageValue(configCTF.playerHasGreenFlag) == 1 then
            player:setStorageValue(configCTF.playerHasGreenFlag, 0)

        elseif player:getStorageValue(configCTF.playerIsGreenTeam) == 1 then
            player:setStorageValue(configCTF.playerIsGreenTeam, 0)
            player:removeCondition(CONDITION_OUTFIT)
            player:teleportTo(configCTF.temple)
            player:unregisterEvent("CTF-Death")

        elseif player:getStorageValue(configCTF.playerHasRedFlag) == 1 then
            player:setStorageValue(configCTF.playerHasRedFlag, 0)
        end
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
    Game.setStorageValue(configCTF.event, 0)

    -- RESETING NO FLAG
    local stoneRed = Tile(configCTF.redFlagPos)
    local stoneGreen = Tile(configCTF.greenFlagPos)

    if stoneRed:getItemById(configCTF.noFlagItemId) then
        stoneRed:getItemById(configCTF.noFlagItemId):remove()
        local redFlag = Game.createItem(configCTF.redFlagItemId, 1, stoneRed:getPosition())
        redFlag:setAttribute('aid', configCTF.flagActionId)
    end

    if stoneGreen:getItemById(configCTF.noFlagItemId) then
        stoneGreen:getItemById(configCTF.noFlagItemId):remove()
        local greenFlag = Game.createItem(configCTF.greenFlagItemId, 1, stoneGreen:getPosition())
        greenFlag:setAttribute('aid', configCTF.flagActionId)
    end

end