local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local function greetCallback(cid)
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if (msgcontains(msg, "quiver") or msgcontains(msg, "quivers")) and npcHandler.topic[cid] == 0 then
		npcHandler:say("It costs 100 gold coins, are you sure?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		local player = Player(cid)
		if player:getMoney() >= 100 then
			npcHandler:say("Good luck and good hunt!", cid)
			player:addItem(26382, 1)
			player:removeMoney(100)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Come back when you have the money.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		end
	else
		npcHandler:say("Maybe later.", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end

local function onAddFocus(cid) end

local function onReleaseFocus(cid) end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())