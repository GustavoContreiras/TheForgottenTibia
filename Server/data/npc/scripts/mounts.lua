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
	[30] = {'Magma', 20000},
	[31] = {'Dragonling', 20000},
	[32] = {'Gnarlhound', 20000},
	[33] = {'Crimson Ray', 20000},
	[34] = {'Steelbeak', 20000},
	[35] = {'Water Buffalo', 20000},
	[36] = {'Armoured Scorpion', 20000},
	[37] = {'Armoured Dragonling', 20000},
	[38] = {'Armoured Cavebear', 20000},
	[39] = {'The Hellgrip', 20000},
	[40] = {'Lion', 20000},
	[41] = {'Golden Lion', 20000},
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
	npcHandler.topic[cid] = 0
	
	if msgcontains(msg, "mounts") then
		npcHandler:say("I have {horses}, {widow queen}, {racing bird}, {war bear}, {black sheep}, {midnight panther}, {draptor}, {titanica}, {tin lizzard}, {blazebringer}, {rapid boar}, {stampor}, {undead cavebear}, {tiger slug}, {uniwheel}, {crystal wolf}, {kingly deer}, {tamed panda}, {dromedary}, {king scorpion}, {shadow draptor}, {ladybug}, {manta}, {ironblight}, {magma}, {dragonling}, {gnarlhound}, {crimsom ray}, {steelbeak}, {water buffalo}, {armoured scorpion}, {armoured dragonling}, {armoured cavebear}, {the hellgrip}, {lion}, {golden lion} and {shock head}. The {donkey} is for free!", cid)
	
	elseif msgcontains(msg, "widow queen") then npcHandler.topic[cid] = 1 
	elseif msgcontains(msg, "racing bird") then npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "war bear") then npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "black sheep") then npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "midnight panther") then npcHandler.topic[cid] = 5
	elseif msgcontains(msg, "draptor") then npcHandler.topic[cid] = 6
	elseif msgcontains(msg, "titanica") then npcHandler.topic[cid] = 7
	elseif msgcontains(msg, "tin lizzard") then npcHandler.topic[cid] = 8
	elseif msgcontains(msg, "blazebringer") then npcHandler.topic[cid] = 9
	elseif msgcontains(msg, "rapid boar") then npcHandler.topic[cid] = 10
	elseif msgcontains(msg, "stampor") then npcHandler.topic[cid] = 11
	elseif msgcontains(msg, "undead cavebear") then npcHandler.topic[cid] = 12
	elseif msgcontains(msg, "donkey") then npcHandler.topic[cid] = 13
	elseif msgcontains(msg, "tiger slug") then npcHandler.topic[cid] = 14
	elseif msgcontains(msg, "uniwheel") then npcHandler.topic[cid] = 15
	elseif msgcontains(msg, "crystal wolf") then npcHandler.topic[cid] = 16	
	elseif msgcontains(msg, "brown war horse") then npcHandler.topic[cid] = 17
	elseif msgcontains(msg, "kingly deer") then npcHandler.topic[cid] = 18
	elseif msgcontains(msg, "tamed panda") then npcHandler.topic[cid] = 19	
	elseif msgcontains(msg, "dromedary") then npcHandler.topic[cid] = 20
	elseif msgcontains(msg, "king scorpion") then npcHandler.topic[cid] = 21	
	elseif msgcontains(msg, "dark brown horse") then npcHandler.topic[cid] = 22
	elseif msgcontains(msg, "armoured war horse") then npcHandler.topic[cid] = 23
	elseif msgcontains(msg, "shadow draptor") then npcHandler.topic[cid] = 24
	elseif msgcontains(msg, "grey horse") then npcHandler.topic[cid] = 25
	elseif msgcontains(msg, "light brown horse") then npcHandler.topic[cid] = 26
	elseif msgcontains(msg, "lady bug") then npcHandler.topic[cid] = 27
	elseif msgcontains(msg, "manta") then npcHandler.topic[cid] = 28
	elseif msgcontains(msg, "ironblight") then npcHandler.topic[cid] = 29
	elseif msgcontains(msg, "magma") then npcHandler.topic[cid] = 30
	elseif msgcontains(msg, "dragonling") then npcHandler.topic[cid] = 31
	elseif msgcontains(msg, "gnarlhound") then npcHandler.topic[cid] = 32
	elseif msgcontains(msg, "crimsom ray") then npcHandler.topic[cid] = 33
	elseif msgcontains(msg, "steelbeak") then npcHandler.topic[cid] = 34
	elseif msgcontains(msg, "water buffalo") then npcHandler.topic[cid] = 35
	elseif msgcontains(msg, "armoured scorpion") then npcHandler.topic[cid] = 36
	elseif msgcontains(msg, "armoured dragonling") then npcHandler.topic[cid] = 37
	elseif msgcontains(msg, "armoured cavebear") then npcHandler.topic[cid] = 38
	elseif msgcontains(msg, "the hellgrip") then npcHandler.topic[cid] = 39
	elseif msgcontains(msg, "lion") then npcHandler.topic[cid] = 40
	elseif msgcontains(msg, "golden lion") then npcHandler.topic[cid] = 41
	elseif msgcontains(msg, "shock head") then npcHandler.topic[cid] = 42	
	end
	
	if npcHandler.topic[cid] ~= 0 and npcHandler.topic[cid] ~= 200 then 
		mountId = npcHandler.topic[cid]
		if player:hasMount(mountId) then
			npcHandler:say("Well... It looks like you already have it!", cid)
		elseif not player:hasMount(mountId) then
			npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
			npcHandler.topic[cid] = 200
		end
		
	elseif npcHandler.topic[cid] == 200 then 
		if msgcontains(msg, "yes") then
			if not player:hasMount(mountId) then 
				player:addMount(mountId)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:removeMoney(mounts[mountId][2])
				npcHandler:say("Here you are! Anything else?", cid)
			else
				npcHandler:say("Well... It looks like you already have it!", cid)
				npcHandler:releaseFocus(cid)
			end
		else
			npcHandler:say("Maybe later!", cid)
			npcHandler:releaseFocus(cid)
		end
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