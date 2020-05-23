local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- XVX FORGER START --

function norseman(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,21400) >= 20 then
        if doPlayerRemoveItem(cid,21400,20) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,8982,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function bacus(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
        if getPlayerItemCount(cid,21400) >= 20 then
        if doPlayerRemoveItem(cid,21400,20) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5798,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function key(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
        if getPlayerItemCount(cid,21400) >= 20 then
        if doPlayerRemoveItem(cid,21400,20) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,8978,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function amulet(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
        if getPlayerItemCount(cid,21400) >= 20 then
        if doPlayerRemoveItem(cid,21400,20) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,10719,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function sword(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
        if getPlayerItemCount(cid,21400) >= 20 then
        if doPlayerRemoveItem(cid,21400,20) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,8980,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function orc(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
        if getPlayerItemCount(cid,21400) >= 20 then
        if doPlayerRemoveItem(cid,21400,20) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,11756,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function frozen(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
        if getPlayerItemCount(cid,21400) >= 20 then
        if doPlayerRemoveItem(cid,21400,20) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,13028,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function dragon(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
        if getPlayerItemCount(cid,21400) >= 20 then
        if doPlayerRemoveItem(cid,21400,20) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,18527,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function sword(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
        if getPlayerItemCount(cid,21400) >= 20 then
        if doPlayerRemoveItem(cid,21400,20) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,18550,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function phoenix(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
        if getPlayerItemCount(cid,21400) >= 20 then
        if doPlayerRemoveItem(cid,21400,20) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,12668,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

-- XVX FORGER END --

keywordHandler:addKeyword({'souvenirs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In this category I can offer you a Norseman doll, an abacus, a key of numerous locks, a friendship amulet, a mexcalibur sword, an orc shredder and a frozen heart.All listed souvenirs are at 20 silver raid tokens each. Which one of them do you want? "})

local node1 = keywordHandler:addKeyword({'norseman doll'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you really want to buy the Norseman Doll? Yes or no?'})
    node1:addChildKeyword({'yes'}, norseman, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node2 = keywordHandler:addKeyword({'abacus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you really want to buy the a Abacus? Yes or no?'})
    node2:addChildKeyword({'yes'}, bacus, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node3 = keywordHandler:addKeyword({'key of numerous locks'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you really want to buy the a key of numerous locks? Yes or no?'})
    node3:addChildKeyword({'yes'}, key, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node4 = keywordHandler:addKeyword({'friendship amulet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you really want to buy the a friedship amulet? Yes or no?'})
    node4:addChildKeyword({'yes'}, amulet, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node5 = keywordHandler:addKeyword({'mexcalibur sword'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you really want to buy the a maxcalibur sword? Yes or no?'})
    node5:addChildKeyword({'yes'}, sword, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})
	
local node6 = keywordHandler:addKeyword({'orc shredder'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you really want to buy the a orc sheredder? Yes or no?'})
    node6:addChildKeyword({'yes'}, orc, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node7 = keywordHandler:addKeyword({'frozen heart'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you really want to buy the frozen heart? Yes or no?'})
    node7:addChildKeyword({'yes'}, frozen, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node7:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node8 = keywordHandler:addKeyword({'dragon eye'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you really want to buy the dragon eye? Yes or no?'})
    node8:addChildKeyword({'yes'}, dragon, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node8:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node9 = keywordHandler:addKeyword({'noble sword'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you really want to buy the noble sword? Yes or no?'})
    node9:addChildKeyword({'yes'}, sword, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node9:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})

local node10 = keywordHandler:addKeyword({'phoenix statue'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you really want to buy the phoenix statue? Yes or no?'})
    node10:addChildKeyword({'yes'}, phoenix, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node10:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})
	
npcHandler:addModule(FocusModule:new())