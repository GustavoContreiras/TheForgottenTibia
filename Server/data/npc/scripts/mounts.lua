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
	local mountId = 0

	if msgcontains(msg, "mounts") then
		npcHandler:say("I have {horses}, {widow queen}, {racing bird}, {war bear}, {black sheep}, {midnight panther}, {draptor}, {titanica}, {tin lizzard}, {blazebringer}, {rapid boar}, {stampor}, {undead cavebear}, {tiger slug}, {uniwheel}, {crystal wolf}, {kingly deer}, {tamed panda}, {dromedary}, {king scorpion}, {shadow draptor}, {ladybug}, {manta}, {ironblight}, {magma}, {dragonling}, {gnarlhound}, {crimsom ray}, {steelbeak}, {water buffalo}, {armoured scorpion}, {armoured dragonling}, {armoured cavebear}, {the hellgrip}, {lion}, {golden lion} and {shock head}. The {donkey} is for free!", cid)
	
	elseif msgcontains(msg, "widow queen") then mountId = 1
	elseif msgcontains(msg, "racing bird") then mountId = 2
	elseif msgcontains(msg, "war bear") then mountId = 3
	elseif msgcontains(msg, "black sheep") then mountId = 4
	elseif msgcontains(msg, "midnight panther") then mountId = 5
	elseif msgcontains(msg, "draptor") then mountId = 6
	elseif msgcontains(msg, "titanica") then mountId = 7
	elseif msgcontains(msg, "tin lizzard") then mountId = 8
	elseif msgcontains(msg, "blazebringer") then mountId = 9
	elseif msgcontains(msg, "rapid boar") then mountId = 10
	elseif msgcontains(msg, "stampor") then mountId = 11
	elseif msgcontains(msg, "undead cavebear") then mountId = 12
	elseif msgcontains(msg, "donkey") then mountId = 13
	elseif msgcontains(msg, "tiger slug") then mountId = 14
	elseif msgcontains(msg, "uniwheel") then mountId = 15
	elseif msgcontains(msg, "crystal wolf") then mountId = 16	
	elseif msgcontains(msg, "brown war horse") then mountId = 17
	elseif msgcontains(msg, "kingly deer") then mountId = 18
	elseif msgcontains(msg, "tamed panda") then mountId = 19	
	elseif msgcontains(msg, "dromedary") then mountId = 20
	elseif msgcontains(msg, "king scorpion") then mountId = 21	
	elseif msgcontains(msg, "dark brown horse") then mountId = 22
	elseif msgcontains(msg, "armoured war horse") then mountId = 23
	elseif msgcontains(msg, "shadow draptor") then mountId = 24
	elseif msgcontains(msg, "grey horse") then mountId = 25
	elseif msgcontains(msg, "light brown horse") then mountId = 26
	elseif msgcontains(msg, "lady bug") then mountId = 27
	elseif msgcontains(msg, "manta") then mountId = 28
	elseif msgcontains(msg, "ironblight") then mountId = 29
	elseif msgcontains(msg, "magma") then mountId = 30
	elseif msgcontains(msg, "dragonling") then mountId = 31
	elseif msgcontains(msg, "gnarlhound") then mountId = 32
	elseif msgcontains(msg, "crimsom ray") then mountId = 33
	elseif msgcontains(msg, "steelbeak") then mountId = 34
	elseif msgcontains(msg, "water buffalo") then mountId = 35
	elseif msgcontains(msg, "armoured scorpion") then mountId = 36
	elseif msgcontains(msg, "armoured dragonling") then mountId = 37
	elseif msgcontains(msg, "armoured cavebear") then mountId = 38
	elseif msgcontains(msg, "the hellgrip") then mountId = 39
	elseif msgcontains(msg, "lion") then mountId = 40
	elseif msgcontains(msg, "golden lion") then mountId = 41
	elseif msgcontains(msg, "shock head") then mountId = 42
	
	end

	if player:hasMount(mountId) and mountId ~= 0 then
		npcHandler:say("Well... It looks like you already have it!", cid)
	else
		npcHandler:say("It costs " .. mounts[mountId][2] .. " gold coins, can I go bring it to you?", cid)
		npcHandler.topic[cid] = mountId
	end

	if npcHandler.topic[cid] == mountId and mountId ~= 0 then 
		if msgcontains(msg, "yes") then
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