local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- XVX FORGER START --

function essence(cid, message, keywords, parameters, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
        if getPlayerItemCount(cid,6500) >= 30 and getPlayerStorageValue(cid,54980) <= 0 then
        if doPlayerRemoveItem(cid,6500,30) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,25383,1)
            setPlayerStorageValue(cid, 45790, 1)
            setPlayerStorageValue(cid, 54980, 1)
            setPlayerStorageValue(cid, 54981, 1)
        end
        else
            npcHandler:say('You do not have the required items or already have access to teleport.', cid)
    end
end

-- XVX FORGER END --

keywordHandler:addKeyword({'short'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You need 30 {demonic essence} to acess quest."})

local node1 = keywordHandler:addKeyword({'demonic essence'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You want to get access to Ferumbras Ascendant Quest?'})
    node1:addChildKeyword({'yes'}, essence, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got the neccessary items.', reset = true})
	
npcHandler:addModule(FocusModule:new())