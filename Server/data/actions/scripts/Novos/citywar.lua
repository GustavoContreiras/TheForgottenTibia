--CityWars.minGuildSize = 10  

--CityWars.minDifferentIPs = 10

CityWars.onInviteExpired = function(invite)
    for k, _invite in ipairs(invite.invites) do
        if _invite == invite then
            local player = Player(invite.inviterPlayerName)
            if player then
                local guild = Guild(invite.invitedGuildId)
                local guildName = guild and guild:getName() or 'deleted guild'
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Your city war invite for guild "' .. guildName .. '" has expired.')
            end
 
            if invite.invitedLeaders then
                local guild = Guild(invite.inviterGuildId)
                local guildName = guild and guild:getName() or 'deleted guild'
                for _, leaderName in ipairs(invite.invitedLeaders) do
                    local leader = Player(leaderName)
                    if leader then
                        leader:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You failed to answer the city war invite from guild "' .. guildName .. '" and it is now expired.')
                    end
                end
            end
 
            table.remove(invite.invites, k)
            return
        end
    end
end
 
CityWars.onInvite = function(city, inviter, invitedGuild, invitedLeaders, options)
    if CityWars.getGuildWar(inviter:getGuild()) then
        return CW_RETURNVALUE_INVITERINWAR
    end
 
    if CityWars.getGuildWar(invitedGuild) then
        return CW_RETURNVALUE_INVITEDINWAR
    end
 
    local invites = CityWars.invites[invitedGuild:getName()]
    if invites and #invites ~= 0 then
        for _, invite in ipairs(invites) do
            local guild = Guild(invite.inviterGuildId)
            if guild and guild:getId() == inviter:getGuild():getId() then
                return CW_RETURNVALUE_LIVEINVITE
            end
        end
    elseif not invites then
        invites = { }
        CityWars.invites[invitedGuild:getName()] = invites
    end
 
    local invitedLeadersNames = {}
    for k, v in ipairs(invitedLeaders) do
        table.insert(invitedLeadersNames, v:getName())
    end
 
    local invite = {
        city = city,
        invites = invites,
        inviterPlayerName = inviter:getName(),
        inviterGuildId = inviter:getGuild():getId(),
        invitedGuildId = invitedGuild:getId(),
        invitedLeaders = invitedLeadersNames,
        options = options
    }
    invite.expireEvent = addEvent(CityWars.onInviteExpired, 120 * 1000, invite)
    table.insert(invites, invite)
 
    return CW_RETURNVALUE_NOERROR
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local guild = player:getGuild()
    if not guild then
        return player:sendCancelMessage('You need to belong to a guild.')
    end
    local guildId = guild:getId()
 
    local city, registry = CityWars.getPlayerWar(player)
    local window = ModalWindow {
        title = 'War Menu',
        message = 'Invite a guild to war or join, leave or cancel an ongoing war.'
    }
 
    local invite, accept, join, leave, cancel, rank
 
    if player:getGuildLevel() >= CityWars.minGuildRank then
        if not city then
            invite = window:addChoice('Invite guild to war')
            accept = window:addChoice('Accept a war invite')
        else
            cancel = window:addChoice('Cancel current war')
        end
    end
 
    if city then
        rank = window:addChoice('Show rank')
        if player:getStorageValue(CityWars.cityWarStorage) > 0 then
            leave = window:addChoice('Leave the war')
        else
            join = window:addChoice('Join the war')
        end
 
    end
 
    window:addButton('Ok', function(button, choice)
        local guild = Guild(guildId)
        if not guild then
            return player:sendCancelMessage('Your guild does not exist anymore.')
        end
 
        if invite and choice == invite then
            local ret = CityWars.isValidGuild(guild)
            if ret == CW_RETURNVALUE_TOOFEWPLAYERS then
                return player:sendCancelMessage('Your guild has too few online players to be able to participate in a city war.')
            elseif ret == CW_RETURNVALUE_TOOFEWUNIQUEIPS then
                return player:sendCancelMessage('Your guild has too few unique ip addresses to be able to participate in a city war.')
            end
 
            player:registerEvent('CityWarInvite')
            player:showTextDialog(CityWars.inviteItemId, '// Write guild name', true)
        elseif accept and choice == accept then
            local guildName = guild:getName()
            local invites = CityWars.getInvites(guildName)
            if not invites or #invites == 0 then
                return player:popupFYI('No invites were found.')
            end
 
            local invitesWindow = ModalWindow {
                title = 'Invites',
                message = 'Select an invite to accept it'
            }
 
            for _, invite in ipairs(invites) do
                local guild = Guild(invite.inviterGuildId)
                if guild then
                    local choice = invitesWindow:addChoice(guild:getName())
                    choice.invite = invite                 
                end
            end
 
            invitesWindow:addButton('Ok', function(button, choice)
                if choice then
                    CityWars.onInviteAccepted(player, choice.invite)
                end
            end)
            invitesWindow:setDefaultEnterButton('Ok')
            invitesWindow:addButton('Cancel')
 
            invitesWindow:sendToPlayer(player)
        elseif join and choice == join then
            local city, registry = CityWars.getPlayerWar(player)
            if not city then
                return player:sendCancelMessage('You are not participating in any city war.')
            end
 
            city:addPlayer(player)
            city:onJoin(player)
        elseif leave and choice == leave then
            local city, registry = CityWars.getPlayerWar(player)
            if not city then
                return player:sendCancelMessage('You are not participating in any city war.')
            end
 
            city:onLeave(player)
        elseif cancel and choice == cancel then
            local city, registry = CityWars.getPlayerWar(player)
            if not city then
                return player:sendCancelMessage('You are not participating in any city war.')
            end
 
            city:onCancel(player)
        elseif rank and choice == rank then
            local city, registry = CityWars.getPlayerWar(player)
            if not city then
                return player:sendCancelMessage('You are not participating in any city war.')
            end
 
            player:popupFYI(city:getRank())
        end
    end)
    window:setDefaultEnterButton('Ok')
    window:addButton('Cancel')
 
    if invite or rank then
        window:sendToPlayer(player)
    else
        player:sendCancelMessage('There is no action you can take right now.')
    end
 
    return true
end