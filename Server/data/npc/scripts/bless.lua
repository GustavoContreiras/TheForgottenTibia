local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local function greetCallback(cid) return true end

local function creatureSayCallback(cid, type, msg)

	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	price = 200

	if player:getLevel() >= 20 then
		price = player:getLevel() * 10
	elseif player:getLevel() >= 50 then
		price = player:getLevel() * 20
		if price > 5000 then
			price = 5000
		end
	end

	if msgcontains(msg, "bless") then
		if not player:hasBlessing(1) then
			npcHandler:say("Do you want to buy the {first bless} for " .. price .. " gold coins?", cid)
			npcHandler.topic[cid] = 1
		elseif not player:hasBlessing(2) then
			npcHandler:say("Do you want to buy the {second bless} for " .. price .. " gold coins?", cid)
			npcHandler.topic[cid] = 2
		elseif not player:hasBlessing(3) then
			npcHandler:say("Do you want to buy the {third bless} for " .. price .. " gold coins?", cid)
			npcHandler.topic[cid] = 3
		elseif not player:hasBlessing(4) then
			npcHandler:say("Do you want to buy the {fourth bless} for " .. price .. " gold coins?", cid)
			npcHandler.topic[cid] = 4
		elseif not player:hasBlessing(5) then
			npcHandler:say("Do you want to buy the {fifth bless} for " .. price .. " gold coins?", cid)
			npcHandler.topic[cid] = 5
		end

	elseif (msgcontains(msg, "yes") or msgcontains(msg, "first")) and npcHandler.topic[cid] == 1 then
		if player:getMoney() >= price then
			if not player:hasBlessing(1) then
				player:addBlessing(1)
				player:removeMoney(price)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say("Here you are, the first one! Do you want the next {bless}?", cid)
				npcHandler.topic[cid] = 2
			else
				npcHandler:say("You already got this one!", cid)
				npcHandler.topic[cid] = 0
			end
		else
			npcHandler:say("I'm sorry but you will need more money.", cid)
			npcHandler.topic[cid] = 0
		end

	elseif (msgcontains(msg, "yes") or msgcontains(msg, "second")) and npcHandler.topic[cid] == 2 then
		if player:getMoney() >= price then
			if not player:hasBlessing(2) then
				player:addBlessing(2)
				player:removeMoney(price)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say("Here you are, the second one! Do you want the next {bless}?", cid)
				npcHandler.topic[cid] = 3
			else
				npcHandler:say("You already got this one!", cid)
				npcHandler.topic[cid] = 0
			end
		else
			npcHandler:say("I'm sorry but you will need more money.", cid)
			npcHandler.topic[cid] = 0
		end

	elseif (msgcontains(msg, "yes") or msgcontains(msg, "third")) and npcHandler.topic[cid] == 3 then
		if player:getMoney() >= price then
			if not player:hasBlessing(3) then
				player:addBlessing(3)
				player:removeMoney(price)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say("Here you are, the third one! Do you want the next {bless}?", cid)
				npcHandler.topic[cid] = 4
			else
				npcHandler:say("You already got this one!", cid)
				npcHandler.topic[cid] = 0
			end
		else
			npcHandler:say("I'm sorry but you will need more money.", cid)
			npcHandler.topic[cid] = 0
		end

	elseif (msgcontains(msg, "yes") or msgcontains(msg, "fourth")) and npcHandler.topic[cid] == 4 then
		if player:getMoney() >= price then
			if not player:hasBlessing(4) then
				player:addBlessing(4)
				player:removeMoney(price)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say("Here you are, the fourth one! Do you want the next {bless}?", cid)
				npcHandler.topic[cid] = 5
			else
				npcHandler:say("You already got this one!", cid)
				npcHandler.topic[cid] = 0
			end
		else
			npcHandler:say("I'm sorry but you will need more money.", cid)
			npcHandler.topic[cid] = 0
		end

	elseif (msgcontains(msg, "yes") or msgcontains(msg, "fifth")) and npcHandler.topic[cid] == 5 then
		if player:getMoney() >= price then
			if not player:hasBlessing(5) then
				player:addBlessing(5)
				player:removeMoney(price)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler:say("Here you are, the last one! May God be with you.", cid)
			else
				npcHandler:say("You already got this one!", cid)
				npcHandler.topic[cid] = 0
			end
		else
			npcHandler:say("I'm sorry but you will need more money.", cid)
		end
		npcHandler.topic[cid] = 0

	elseif msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
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