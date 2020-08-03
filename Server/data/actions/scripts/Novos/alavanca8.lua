local BOSSh = "The Shatterer" -- boss name
local BOSS1h = "Demon" -- boss name
local BOSS2h = "Demon" -- boss name
local BOSS_POSh = {x = 33414, y = 32417, z = 14} -- boss spawn
local BOSS_POS1h = {x = 33479, y = 32788, z = 13} -- boss spawn
local BOSS_POS2h = {x = 33490, y = 32788, z = 13} -- boss spawn
   
local roomh = {fromx = 33387, tox = 33441, fromy = 32390, toy = 32446, z = 14} -- boss room

local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creatureh = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creatureh.uid)) then
                    return true
                end
            end
        end
    end
    return false
end

function AddBossh()

local bossh = 0
for x = roomh.fromx, roomh.tox do
for y = roomh.fromy, roomh.toy do
for z = roomh.z, roomh.z do

creatureh = {x = x, y = y, z = z}
mobh = getTopCreature(creatureh).uid

    if getCreatureName(mobh) == BOSSh then
        bossh = 1
    end
end
end
end

if bossh == 1 then
end

if bossh == 0 then
        Game.createMonster(BOSSh, BOSS_POSh)
end

return true
end

function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(93528) < 1) then
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33387, y = 32390, z = 14, stackpos = 255}, {x = 33441, y = 32446, z = 14, stackpos = 255}) then
				pos1h = {x = 33405, y = 32467, z = getCreaturePosition(cid).z}
				pos2h = {x = 33406, y = 32467, z = getCreaturePosition(cid).z}
				pos3h = {x = 33407, y = 32467, z = getCreaturePosition(cid).z}
				pos4h = {x = 33408, y = 32467, z = getCreaturePosition(cid).z}
				pos5h = {x = 33409, y = 32467, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1h).uid)) then
				if(isPlayer(getTopCreature(pos2h).uid)) then
				if(isPlayer(getTopCreature(pos3h).uid)) then
				if(isPlayer(getTopCreature(pos4h).uid)) then
				if(isPlayer(getTopCreature(pos5h).uid)) then
					doTeleportThing(getTopCreature(pos1h).uid, {x = 33401, y = 32427, z = 14})
					doTeleportThing(getTopCreature(pos2h).uid, {x = 33406, y = 32430, z = 14})
					doTeleportThing(getTopCreature(pos3h).uid, {x = 33410, y = 32430, z = 14})
					doTeleportThing(getTopCreature(pos4h).uid, {x = 33414, y = 32428, z = 14})
					doTeleportThing(getTopCreature(pos5h).uid, {x = 33413, y = 32425, z = 14})

		addEvent(AddBossh, 5 * 1000)
		setGlobalStorageValue(93528, 1)
		addEvent(setGlobalStorageValue, 20*60*1000, 93528, 0)
			
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