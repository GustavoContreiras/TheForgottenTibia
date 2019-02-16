local mounts = { 
  --[0] = {'Name', price},
	[1] = {'Widow Queen', 1},
	[2] = {'Racing Bird', 1},
	[3] = {'War Bear', 1},
	[4] = {'Black Sheep', 1},
	[5] = {'Midnight Panther', 1},
	[6] = {'Draptor', 1},
	[7] = {'Titanica', 1},
	[8] = {'Tin Lizzard', 1},
	[9] = {'Blazebringer', 1},
	[10] = {'Rapid Boar', 1},
	[11] = {'Stampor', 1},
	[12] = {'Undead Cavebear', 1},
	[13] = {'Donkey', 1},
	[14] = {'Tiger Slug', 1},
	[15] = {'Uniwheel', 1},
	[16] = {'Crystal Wolf', 1},
	[17] = {'Brown War Horse', 10000},
	[18] = {'Kingly Deer', 1},
	[19] = {'Tamed Panda', 1},
	[20] = {'Dromedary', 1},
	[21] = {'King Scorpion', 1},
	[22] = {'Rented Horse', 1000},
	[23] = {'Armoured War Horse', 5000},
	[24] = {'Shadow Draptor', 1},
	[25] = {'Rented Horse', 1000},
	[26] = {'Rented Horse', 1000},
	[27] = {'Ladybug', 1},
	[28] = {'Manta', 1},
	[29] = {'Ironblight', 1},
	[30] = {'Magma', 1},
	[31] = {'Dragonling', 1},
	[32] = {'Gnarlhound', 1},
	[33] = {'Crimson Ray', 1},
	[34] = {'Steelbeak', 1},
	[35] = {'Water Buffalo', 1},
	[36] = {'Armoured Scorpion', 1},
	[37] = {'Armoured Dragonling', 1},
	[38] = {'Armoured Cavebear', 1},
	[39] = {'The Hellgrip', 1},
	[40] = {'Lion', 1},
	[41] = {'Golden Lion', 1},
	[42] = {'Shock Head', 1}
}

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

	if msgcontains(msg, "mounts") then
		npcHandler:say("For now, the only mounts avaible are four kinds of {horses}. But if you're afraid of horses I have a {donkey} back there.", cid)

	-- DONKEY --
	elseif msgcontains(msg, "donkey") then
		local mountId = 13
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have a donkey!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("This one is for free! I don't have much space back there. But I need to know one thing first. Do you really want it?", cid)
			npcHandler.topic[cid] = 13
		end

	elseif npcHandler.topic[cid] == 13 and msgcontains(msg, "yes") then
		local mountId = 13
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have a donkey!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 13 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)

	-- HORSES --
	elseif msgcontains(msg, "horses") then
			npcHandler:say("I have a {dark brown} horse, a {grey} one and a {light brown}. Also there is a {brown war horse}, he is the fastest. And if you have money enough, we can {equip} him with a special {armor} for horses.", cid)
			npcHandler.topic[cid] = 1

	-- DARK BROWN HORSE --
	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "dark") or msgcontains(msg, "dark brown") or msgcontains(msg, "dark brown horse") then
		local mountId = 22
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have that one!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("These kind is known for their friendship with humans, they are very loyal. It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = 22
		end
	elseif npcHandler.topic[cid] == 22 and msgcontains(msg, "yes") then
		local mountId = 22
 		if not player:hasMount(mountId) and player:getMoney() >= mounts[mountId][2] then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Sorry, but it looks like you don't have enough money.", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 22 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)

	-- GRAY HORSE --
	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "grey") or msgcontains(msg, "grey horse") then
		local mountId = 25
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have that!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("These kind is known for their friendship with humans, they are very loyal. It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = 25
		end
	elseif npcHandler.topic[cid] == 25 and msgcontains(msg, "yes") then
		local mountId = 25
 		if not player:hasMount(mountId) and player:getMoney() >= mounts[mountId][2] then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Sorry, but it looks like you don't have enough money.", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 25 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)

	-- LIGHT BROWN HORSE --
	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "light") or msgcontains(msg, "light brown") or msgcontains(msg, "light brown horse") then
		local mountId = 26
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have that!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("These kind is known for their friendship with humans, they are very loyal. It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = 26
		end
	elseif npcHandler.topic[cid] == 26 and msgcontains(msg, "yes") then
		local mountId = 26
 		if not player:hasMount(mountId) and player:getMoney() >= mounts[mountId][2] then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
		else
			npcHandler:say("Sorry, but it looks like you don't have enough money.", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 26 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)

	-- BROWN WAR HORSE --
	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "war horse") or msgcontains(msg, "brown war horse") then
		local mountId = 17
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have that!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("This is a great choice, he is as fast as any other mountable wild animal. It will cost you " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = 17
		end
	elseif npcHandler.topic[cid] == 17 and msgcontains(msg, "yes") then
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		local mountId = 17
 		if not player:hasMount(mountId) and player:getMoney() >= mounts[mountId][2] then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
		else
			npcHandler:say("Sorry, but it looks like you don't have enough money.", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 17 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)

	-- ARMOURED WAR HORSE --
	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "armor") or msgcontains(msg, "equip") then
		local mountId = 23
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you did that already!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It will cost you " .. mounts[mountId][2] .. " gold coins, is he ready?", cid)
			npcHandler.topic[cid] = 23
		elseif not player:hasMount(17) then
			npcHandler:say("You need a {war horse} to do that.", cid)
		end
	elseif npcHandler.topic[cid] == 23 and msgcontains(msg, "yes") then
		local mountId = 23
 		if not player:hasMount(mountId) and player:getMoney() >= mounts[mountId][2] then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
		else
			npcHandler:say("Sorry, but it looks like you don't have enough money.", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 23 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
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