local BOSSa = "Razzagorn" -- boss name
local BOSS1a = "Demon" -- boss name
local BOSS2a = "Demon" -- boss name
local BOSS_POSa = {x = 33430, y = 32469, z = 14} -- boss spawn
local BOSS_POS1a = {x = 33425, y = 32471, z = 14} -- boss spawn
local BOSS_POS2a = {x = 33425, y = 32464, z = 14} -- boss spawn
   
local rooma = {fromx = 33413, tox = 33442, fromy = 32455, toy = 32482, z = 14} -- boss room

local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creature = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creature.uid)) then
                    return true
                end
            end
        end
    end
    return false
end

function AddBossa()

local bossa = 0
for x = rooma.fromx, rooma.tox do
for y = rooma.fromy, rooma.toy do
for z = rooma.z, rooma.z do

creature = {x = x, y = y, z = z}
moba = getTopCreature(creature).uid

    if getCreatureName(moba) == BOSSa then
        bossa = 1
    end
end
end
end

if bossa == 1 then
end

if bossa == 0 then
        Game.createMonster(BOSSa, BOSS_POSa)
end

return true
end

function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(93524) < 1) then
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33410, y = 32454, z = 14, stackpos = 255}, {x = 33442, y = 32482, z = 14, stackpos = 255}) then
				pos1a = {x = 33388, y = 32457, z = getCreaturePosition(cid).z}
				pos2a = {x = 33389, y = 32457, z = getCreaturePosition(cid).z}
				pos3a = {x = 33390, y = 32457, z = getCreaturePosition(cid).z}
				pos4a = {x = 33391, y = 32457, z = getCreaturePosition(cid).z}
				pos5a = {x = 33392, y = 32457, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1a).uid)) then
				if(isPlayer(getTopCreature(pos2a).uid)) then
				if(isPlayer(getTopCreature(pos3a).uid)) then
				if(isPlayer(getTopCreature(pos4a).uid)) then
				if(isPlayer(getTopCreature(pos5a).uid)) then
					doTeleportThing(getTopCreature(pos1a).uid, {x = 33417, y = 32471, z = 14})
					doTeleportThing(getTopCreature(pos2a).uid, {x = 33417, y = 32470, z = 14})
					doTeleportThing(getTopCreature(pos3a).uid, {x = 33417, y = 32469, z = 14})
					doTeleportThing(getTopCreature(pos4a).uid, {x = 33417, y = 32468, z = 14})
					doTeleportThing(getTopCreature(pos5a).uid, {x = 33417, y = 32466, z = 14})

		addEvent(AddBossa, 5 * 1000)
		setGlobalStorageValue(93524, 1)
		addEvent(setGlobalStorageValue, 20*60*1000, 93524, 0)
		
		    end
	      end
	 end
     end
	 end
	 else doPlayerSendTextMessage(cid,19,"There are players inside the room or is missing players here.")
end

end
else 
doPlayerSendCancel(cid, "Please, wait 20 minutes counting the last use to start again.")
end
	return true
end