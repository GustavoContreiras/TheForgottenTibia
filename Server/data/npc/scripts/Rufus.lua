local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local destination = {}

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

	if msgcontains(msg, "mountains") or msgcontains(msg, "mountain") and npcHandler.topic[cid] == 0 then
		destination[cid] = Position(33187, 31395, 7)
		local player = Player(cid)
		local destination = destination[cid]
		npcHandler:releaseFocus(cid)
		player:teleportTo(destination)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
	elseif msgcontains(msg, "desert") or msgcontains(msg, "yurez") and npcHandler.topic[cid] == 0 then
		destination[cid] = Position(33250, 31516, 7)
		local player = Player(cid)
		local destination = destination[cid]
		npcHandler:releaseFocus(cid)
		player:teleportTo(destination)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

local function onAddFocus(cid)
	destination[cid] = 0
end

local function onReleaseFocus(cid)
	destination[cid] = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())