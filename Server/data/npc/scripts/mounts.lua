local mounts = { 
  --[0] = {'Name', price},
	[1] = {'Widow Queen', 20000},
	[2] = {'Racing Bird', 20000},
	[3] = {'War Bear', 20000},
	[4] = {'Black Sheep', 20000},
	[5] = {'Midnight Panther', 20000},
	[6] = {'Draptor', 20000},
	[7] = {'Titanica', 20000},
	[8] = {'Tin Lizzard', 20000},
	[9] = {'Blazebringer', 20000},
	[10] = {'Rapid Boar', 20000},
	[11] = {'Stampor', 20000},
	[12] = {'Undead Cavebear', 20000},
	[13] = {'Donkey', 1},
	[14] = {'Tiger Slug', 20000},
	[15] = {'Uniwheel', 20000},
	[16] = {'Crystal Wolf', 20000},
	[17] = {'Brown War Horse', 10000},
	[18] = {'Kingly Deer', 20000},
	[19] = {'Tamed Panda', 20000},
	[20] = {'Dromedary', 20000},
	[21] = {'King Scorpion', 20000},
	[22] = {'Rented Horse', 1000},
	[23] = {'Armoured War Horse', 5000},
	[24] = {'Shadow Draptor', 20000},
	[25] = {'Rented Horse', 1000},
	[26] = {'Rented Horse', 1000},
	[27] = {'Ladybug', 20000},
	[28] = {'Manta', 20000},
	[29] = {'Ironblight', 20000},
	[30] = {'Magma Crawler', 20000},
	[31] = {'Dragonling', 20000},
	[32] = {'Gnarlhound', 20000},
	[33] = {'Crimsom Ray', 20000},
	[34] = {'Steelbeak', 20000},
	[35] = {'Water Buffalo', 20000},
	[36] = {'Tombstinger', 20000},
	[37] = {'Platesaurian', 20000},
	[38] = {'Ursagrodon', 20000},
	[39] = {'The Hellgrip', 20000},
	[40] = {'Noble Lion', 20000},
	[41] = {'Desert King', 20000},
	[42] = {'Shock Head', 20000}
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
	local mountId = 0

	if msgcontains(msg, "mounts") then
		--[[npcHandler:say("I have {horses}, {widow queen}, {racing bird}, {war bear}, {black sheep}, {midnight panther}, {draptor}, {titanica}, {tin lizzard}, {blazebringer}, {rapid boar}, {stampor}, {undead cavebear}, {tiger slug}, {uniwheel}, {crystal wolf}, {kingly deer}, {tamed panda}, {dromedary}, {king scorpion}, {shadow draptor}, {ladybug}, {manta}, {ironblight}, {magma}, {dragonling}, {gnarlhound}, {crimsom ray}, {steelbeak}, {water buffalo}, {tombstinger}, {platesaurian}, {ursagrodon}, {the hellgrip}, {noble lion}, {desert king} and {shock head}. The {donkey} is for free!", cid)]]
		npcHandler:say("I have {horses}, {racing bird}, {war bear}, {midnight panther}, {draptor}, {titanica}, {tin lizzard}, {blazebringer}, {rapid boar}, {stampor}, {tiger slug}, {uniwheel}, {kingly deer}, {dromedary}, {king scorpion}, {shadow draptor}, {ironblight}, {magma}, {gnarlhound}, {crimsom ray}, {steelbeak}, {water buffalo}, {tombstinger}, {ursagrodon}, {desert king} and {shock head}. The {donkey} is for free!", cid)

	-- WIDOW QUEEN --
	--[[elseif msgcontains(msg, "widow queen") then
		mountId = 1
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "yes") then
		mountId = 1
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]
		
	-- RACING BIRD --
	elseif msgcontains(msg, "racing bird") then
		mountId = 2
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 2 and msgcontains(msg, "yes") then
		mountId = 2
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 2 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- WAR BEAR--
	elseif msgcontains(msg, "war bear") then
		mountId = 3
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 3 and msgcontains(msg, "yes") then
		mountId = 3
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 3 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- BLACK SHEEP --
	--[[elseif msgcontains(msg, "black sheep") then
		mountId = 4
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 4 and msgcontains(msg, "yes") then
		mountId = 4
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 4 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]
		
	-- MIDNIGHT PANTHER --
	elseif msgcontains(msg, "midnight panther") then
		mountId = 5
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 5 and msgcontains(msg, "yes") then
		mountId = 5
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 5 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- DRAPTOR --
	elseif msgcontains(msg, "draptor") then
		mountId = 6
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 6 and msgcontains(msg, "yes") then
		mountId = 6
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 6 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- TITANICA --
	elseif msgcontains(msg, "titanica") then
		mountId = 7
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 7 and msgcontains(msg, "yes") then
		mountId = 7
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 7 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- TIN LIZZARD --
	elseif msgcontains(msg, "tin lizzard") then
		mountId = 8
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 8 and msgcontains(msg, "yes") then
		mountId = 8
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 8 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- BLAZEBRINGER --
	elseif msgcontains(msg, "blazebringer") then
		mountId = 9
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 9 and msgcontains(msg, "yes") then
		mountId = 9
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 9 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- RAPID BOAR --
	elseif msgcontains(msg, "rapid boar") then
		mountId = 10
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 10 and msgcontains(msg, "yes") then
		mountId = 10
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 10 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- STAMPOR --
	elseif msgcontains(msg, "stampor") then
		mountId = 11
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 11 and msgcontains(msg, "yes") then
		mountId = 11
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 11 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- UNDEAD CAVEBEAR --
	--[[elseif msgcontains(msg, "undead cavebear") then
		mountId = 12
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 12 and msgcontains(msg, "yes") then
		mountId = 12
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 12 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]
		
	-- DONKEY --
	elseif msgcontains(msg, "donkey") then
		mountId = 13
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have a donkey!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("This one is for free! I don't have much space back there. But I need to know one thing first. Do you really want it?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 13 and msgcontains(msg, "yes") then
		mountId = 13
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
		
	-- TIGER SLUG --
	elseif msgcontains(msg, "tiger slug") then
		mountId = 14
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 14 and msgcontains(msg, "yes") then
		mountId = 14
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 14 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- UNIWHEEL --
	elseif msgcontains(msg, "uniwheel") then
		mountId = 15
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 15 and msgcontains(msg, "yes") then
		mountId = 15
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 15 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- CRYSTAL WOLF --
	--[[elseif msgcontains(msg, "crystal wolf") then
		mountId = 16
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 16 and msgcontains(msg, "yes") then
		mountId = 16
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 16 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]
		
	-- KINGLY DEER --
	elseif msgcontains(msg, "kingly deer") then
		mountId = 18
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 18 and msgcontains(msg, "yes") then
		mountId = 18
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 18 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- TAMED PANDA --
	--[[elseif msgcontains(msg, "tamed panda") then
		mountId = 19
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 19 and msgcontains(msg, "yes") then
		mountId = 19
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 19 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]
	
	-- DROMEDARY --
	elseif msgcontains(msg, "dromedary") then
		mountId = 20
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 20 and msgcontains(msg, "yes") then
		mountId = 20
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 20 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- KING SCORPION --
	elseif msgcontains(msg, "king scorpion") then
		mountId = 21
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 21 and msgcontains(msg, "yes") then
		mountId = 21
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 21 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- SHADOW DRAPTOR --
	elseif msgcontains(msg, "shadow draptor") then
		mountId = 24
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 24 and msgcontains(msg, "yes") then
		mountId = 24
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 24 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- LADY BUG --
	--[[elseif msgcontains(msg, "ladybug") then
		mountId = 27
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 27 and msgcontains(msg, "yes") then
		mountId = 27
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 27 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]
	
	-- MANTA --
	--[[elseif msgcontains(msg, "manta") then
		mountId = 28
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 28 and msgcontains(msg, "yes") then
		mountId = 28
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 28 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]
	
	-- IRONBLIGHT --
	elseif msgcontains(msg, "ironblight") then
		mountId = 29
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 29 and msgcontains(msg, "yes") then
		mountId = 29
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 29 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- MAGMA --
	elseif msgcontains(msg, "magma") then
		mountId = 30
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 30 and msgcontains(msg, "yes") then
		mountId = 30
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 30 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- DRAGONLING --
	--[[elseif msgcontains(msg, "dragonling") then
		mountId = 31
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 31 and msgcontains(msg, "yes") then
		mountId = 31
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 31 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]
	
	-- Gnarlhound --
	elseif msgcontains(msg, "gnarlhound") then
		mountId = 32
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 32 and msgcontains(msg, "yes") then
		mountId = 32
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 32 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- CRIMSOM RAY -- 
	elseif msgcontains(msg, "crimsom ray") then
		mountId = 33
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 33 and msgcontains(msg, "yes") then
		mountId = 33
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 33 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- STEELBEAK --
	elseif msgcontains(msg, "steelbeak") then
		mountId = 34
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 34 and msgcontains(msg, "yes") then
		mountId = 34
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 34 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- WATER BUFFALO --
	elseif msgcontains(msg, "water buffalo") then
		mountId = 35
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 35 and msgcontains(msg, "yes") then
		mountId = 35
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 35 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- TOMBSTINGER --
	elseif msgcontains(msg, "tombstinger") then
		mountId = 36
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 36 and msgcontains(msg, "yes") then
		mountId = 36
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 36 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- PLATESAURIAN --
	--[[elseif msgcontains(msg, "platesaurian") then
		mountId = 37
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 37 and msgcontains(msg, "yes") then
		mountId = 37
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 37 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]

	-- URSAGRODON --
	elseif msgcontains(msg, "ursagrodon") then
		mountId = 38
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 38 and msgcontains(msg, "yes") then
		mountId = 38 		
		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 38 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
	
	-- THE HELLGRIP --
	--[[elseif msgcontains(msg, "the hellgrip") then
		mountId = 39
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 39 and msgcontains(msg, "yes") then
		mountId = 39
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 39 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]
	
	-- LION --
	--[[elseif msgcontains(msg, "noble lion") then
		mountId = 40
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 40 and msgcontains(msg, "yes") then
		mountId = 40
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 40 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)]]
	
	-- GOLDEN LION --
	elseif msgcontains(msg, "desert king") or msgcontains(msg, "desert") then
		mountId = 41
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 41 and msgcontains(msg, "yes") then
		mountId = 41
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 41 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)
		
	-- SHOCK HEAD --
	elseif msgcontains(msg, "shock head") then
		mountId = 42
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end

	elseif npcHandler.topic[cid] == 42 and msgcontains(msg, "yes") then
		mountId = 42
 		if not player:hasMount(mountId) then 
			player:addMount(mountId)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:removeMoney(mounts[mountId][2])
			npcHandler:say("Here you are! Anything else?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Well... It looks like you already have it!", cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 42 and msgcontains(msg, "no") then
		npcHandler:say("Maybe later!", cid)
		npcHandler:releaseFocus(cid)

	-- HORSES --
	elseif msgcontains(msg, "horses") then
			npcHandler:say("I have a {dark brown} horse, a {grey} one and a {light brown}. Also there is a {brown war horse}, he is the fastest. And if you have money enough, we can {equip} him with a special {armor} for horses.", cid)
			npcHandler.topic[cid] = 0

	-- DARK BROWN HORSE --
	elseif npcHandler.topic[cid] == 0 and msgcontains(msg, "dark") or msgcontains(msg, "dark brown") or msgcontains(msg, "dark brown horse") then
		mountId = 22
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have that one!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("These kind is known for their friendship with humans, they are very loyal. It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end
	elseif npcHandler.topic[cid] == 22 and msgcontains(msg, "yes") then
		mountId = 22
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
	elseif npcHandler.topic[cid] == 0 and (msgcontains(msg, "grey") or msgcontains(msg, "grey horse") or msgcontains(msg, "gray")) then
		mountId = 25
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have that!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("These kind is known for their friendship with humans, they are very loyal. It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end
	elseif npcHandler.topic[cid] == 25 and msgcontains(msg, "yes") then
		mountId = 25
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
	elseif npcHandler.topic[cid] == 0 and msgcontains(msg, "light") or msgcontains(msg, "light brown") or msgcontains(msg, "light brown horse") then
		mountId = 26
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have that!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("These kind is known for their friendship with humans, they are very loyal. It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end
	elseif npcHandler.topic[cid] == 26 and msgcontains(msg, "yes") then
		mountId = 26
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
		mountId = 17
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have that!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("This is a great choice, he is as fast as any other mountable wild animal. It will cost you " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = mountId
		end
	elseif npcHandler.topic[cid] == 17 and msgcontains(msg, "yes") then
		mountId = 17
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
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
	elseif npcHandler.topic[cid] == 0 and msgcontains(msg, "armor") or msgcontains(msg, "equip") then
		mountId = 23
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you did that already!", cid)
		elseif not player:hasMount(mountId) and player:hasMount(17) then
			npcHandler:say("It will cost you " .. mounts[mountId][2] .. " gold coins, is he ready?", cid)
			npcHandler.topic[cid] = mountId
		elseif not player:hasMount(mountId) then
			npcHandler:say("You need a {war horse} to do that.", cid)
		end
	elseif npcHandler.topic[cid] == 23 and msgcontains(msg, "yes") then
		mountId = 23
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
