local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local SAVE_FREQUENCE = 7200 -- seconds
local saveTimer = SAVE_FREQUENCE

local vocation = {}
local town = {}
local destination = {}
local skillPointsResetStorage = 62492

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink() 
	saveTimer = saveTimer - 1
    if saveTimer == 0 then
        saveServer()
        broadcastMessage("Server saved.", MESSAGE_EVENT_ADVANCE)
        saveTimer = SAVE_FREQUENCE
    end                         
end

local function greetCallback(cid)
	return true
end

local function creatureSayCallback(cid, type, msg)

	local player = Player(cid)

	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, "hi") or msgcontains(msg, "hello") then
		npcHandler:addFocus(cid)

    	elseif msgcontains(msg, "save") then
    		saveServer()

	elseif msgcontains(msg, "clean") then
        	cleanMap()

	elseif msgcontains(msg, "help") then
		npcHandler:say("I can {reset} your skills, {heal} you, or give you a little {guide} about places in this city, like where to buy {bless} or {fight} for rewards. Also, I sell the rare {amulet of loss} and I can grant you a {title}.", cid)

	elseif msgcontains(msg, "givemeresets") then
		npcHandler:say("Here you are!", cid)
		
	elseif msgcontains(msg, "reset") then
		local price = player:getLevel() * player:getLevel() * 5
		if player:getResetsCount() > 0 then
			if not player:setSkills(0, 8, 8, 8, 8, 8, 8, 8) then
				npcHandler:say("It looks like you don't need it.", cid)
				npcHandler.topic[cid] = 0
			else
				player:setTitleDescription(0)
				if player:getResetsCount() > 0 then
					player:addResetsCount(-1)
				end
				npcHandler:say("And God said... REBORN!", cid)
				player:setHealth(player:getMaxHealth())
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			end
		else
			npcHandler:say("It will cost you " .. price .. " gold coins. Are you sure?", cid)
		end
		npcHandler.topic[cid] = 1

	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "yes") then
		local price = player:getLevel() * player:getLevel() * 5
		if player:getMoney() >= price then
			player:removeMoney(price)
			player:setTitleDescription(0)
			if not player:setSkills(0, 8, 8, 8, 8, 8, 8, 8) then
				npcHandler:say("It looks like you don't need it.", cid)
				player:addMoney(price)
				npcHandler.topic[cid] = 0
			else 
				player:setTitleDescription(0)
				if player:getResetsCount() > 0 then
					player:addResetsCount(-1)
				end
				npcHandler:say("And God said... REBORN!", cid)
				player:setHealth(player:getMaxHealth())
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			end
		else
			npcHandler:say("Sorry, but you don't have enough money.", cid)
		end

	elseif msgcontains(msg, "heal") then
		local player = Player(cid)
		if player:getHealth() < player:getMaxHealth() then
			player:setHealth(player:getMaxHealth())
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			npcHandler:say("May God bless you!", cid)
		else
			npcHandler:say("It doesn't look like you need healing.", cid)
		end

	elseif msgcontains(msg, "amulet") or msgcontains(msg, "aol") or msgcontains(msg, "amulet of loss") then
		npcHandler:say("It costs 15000 gold coins, do you want it?", cid)
		npcHandler.topic[cid] = 9

	-- se falar 'yes' depois de falar 'amulet of loss'
	elseif npcHandler.topic[cid] == 9 and msgcontains(msg, "yes") then
		if player:getMoney() > 15000 then
			player:removeMoney(15000)
			player:addItem(2173, 1)
			npcHandler:say("Anything else?", cid)
		else
			npcHandler:say("I'm sorry but you don't have enough money.", cid)
			npcHandler:releaseFocus(cid)
		end
		npcHandler.topic[cid] = 0

	elseif msgcontains(msg, "guide") then
		npcHandler:say("The depot is northwest from here. The {fighting arena} is on the east gate of the city, after the {weapons} and {equipment} shop. There is a ship north from here that can take you to {Yalahar} and a boat south west. The cemetery is located outside the city, you can get there through the south gate.", cid)
	
	elseif msgcontains(msg, "fight") or msgcontains(msg, "fighting arena") then
		npcHandler:say("There you can test you skills and spells without any death penalty.", cid)

	elseif msgcontains(msg, "weapons") or msgcontains(msg, "equipments") then
		npcHandler:say("You can sell and buy items there, but if you want to sell high valuated items, {William} will ask you to get some kind of special lamp in the {Djinn Tower}.", cid)

	elseif msgcontains(msg, "bless") or msgcontains(msg, "blessing") then
		npcHandler:say("All blesses can be acquired with {Alice} north from here.", cid)

	elseif msgcontains(msg, "alice") then
		npcHandler:say("She is a good priestess.", cid)

	elseif msgcontains(msg, "william") then
		npcHandler:say("He is a good man.", cid)

	elseif msgcontains(msg, "djinn tower") or msgcontains(msg, "djinn") then
		npcHandler:say("It's south from here, I don't know much more to tell you.", cid)

	elseif msgcontains(msg, "title") then
		npcHandler:say("I can nominate you as a {mage}, a {supporter}, a {ranger} or a {knight}. Also, I can {remove} it.", cid)
		npcHandler.topic[cid] = 9
		
	elseif msgcontains(msg, "remove title") then
		player:setTitleDescription(0)
		npcHandler:say("Done!", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)

	elseif npcHandler.topic[cid] == 9 and msgcontains(msg, "remove") then
		player:setTitleDescription(0)
		npcHandler:say("Done!", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)

	elseif npcHandler.topic[cid] == 9 and msgcontains(msg, "mage") then
		if player:getSkillLevel(SKILL_INTELLIGENCE) >= 60 then
			player:setTitleDescription(1)
			npcHandler:say("I grant you the mage title!", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		else
			npcHandler:say("You don't have enough intelligence. Come back when you have at least 60 intelligence.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		end

	elseif npcHandler.topic[cid] == 9 and msgcontains(msg, "supporter") then
		if player:getSkillLevel(SKILL_FAITH) >= 40 or player:getSkillLevel(SKILL_DEFENCE) >= 90 then
			player:setTitleDescription(2)
			npcHandler:say("I grant you the supporter title!", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		elseif player:getSkillLevel(SKILL_FAITH) < 40 and player:getSkillLevel(SKILL_DEFENCE) >= 90 then
			npcHandler:say("You don't have enough faith. Come back when you have at least 40 faith.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		elseif player:getSkillLevel(SKILL_FAITH) >= 40 and player:getSkillLevel(SKILL_DEFENCE) < 90 then
			npcHandler:say("You don't have enough defence. Come back when you have at least 90 defence.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		elseif player:getSkillLevel(SKILL_FAITH) < 40 and player:getSkillLevel(SKILL_DEFENCE) < 90 then
			npcHandler:say("You don't have enough defence or faith. Come back when you have at least 90 defence or 40 faith.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		end

	elseif npcHandler.topic[cid] == 9 and msgcontains(msg, "ranger") then
		if player:getSkillLevel(SKILL_DEXTERITY) >= 90 then
			player:setTitleDescription(3)
			npcHandler:say("I grant you the ranger title!", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		else
			npcHandler:say("You don't have enough dexterity. Come back when you have at least 90 dexterity.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		end

	elseif npcHandler.topic[cid] == 9 and msgcontains(msg, "knight") then
		if player:getSkillLevel(SKILL_STRENGHT) >= 90 then
			player:setTitleDescription(4)
			npcHandler:say("I grant you the knight title!", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		else
			npcHandler:say("You don't have enough strenght. Come back when you have at least 90 strenght.", cid)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
		end

	else
		npcHandler:say("Need {help}?", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

local function onAddFocus(cid)
	town[cid] = 0
	vocation[cid] = 0
	destination[cid] = 0
end

local function onReleaseFocus(cid)
	town[cid] = nil
	vocation[cid] = nil
	destination[cid] = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
