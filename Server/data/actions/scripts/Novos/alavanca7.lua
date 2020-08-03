local BOSSg = "Shulgrax" -- boss name
local BOSS1g = "Demon" -- boss name
local BOSS2g = "Demon" -- boss name
local BOSS_POSg = {x = 33485, y = 32786, z = 13} -- boss spawn
local BOSS_POS1g = {x = 33479, y = 32788, z = 13} -- boss spawn
local BOSS_POS2g = {x = 33490, y = 32788, z = 13} -- boss spawn
   
local roomg = {fromx = 33473, tox = 33499, fromy = 32775, toy = 32798, z = 13} -- boss room

local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creatureg = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creatureg.uid)) then
                    return true
                end
            end
        end
    end
    return false
end

function AddBossg()

local bossg = 0
for x = roomg.fromx, roomg.tox do
for y = roomg.fromy, roomg.toy do
for z = roomg.z, roomg.z do

creatureg = {x = x, y = y, z = z}
mobg = getTopCreature(creatureg).uid

    if getCreatureName(mobg) == BOSSg then
        bossg = 1
    end
end
end
end

if bossg == 1 then
end

if bossg == 0 then
        Game.createMonster(BOSSg, BOSS_POSg)
end

return true
end

function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(93527) < 1) then
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33473, y = 32775, z = 13, stackpos = 255}, {x = 33499, y = 32798, z = 13, stackpos = 255}) then
				pos1g = {x = 33434, y = 32785, z = getCreaturePosition(cid).z}
				pos2g = {x = 33434, y = 32786, z = getCreaturePosition(cid).z}
				pos3g = {x = 33434, y = 32787, z = getCreaturePosition(cid).z}
				pos4g = {x = 33434, y = 32788, z = getCreaturePosition(cid).z}
				pos5g = {x = 33434, y = 32789, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1g).uid)) then
				if(isPlayer(getTopCreature(pos2g).uid)) then
				if(isPlayer(getTopCreature(pos3g).uid)) then
				if(isPlayer(getTopCreature(pos4g).uid)) then
				if(isPlayer(getTopCreature(pos5g).uid)) then
					doTeleportThing(getTopCreature(pos1g).uid, {x = 33482, y = 32794, z = 13})
					doTeleportThing(getTopCreature(pos2g).uid, {x = 33483, y = 32794, z = 13})
					doTeleportThing(getTopCreature(pos3g).uid, {x = 33485, y = 32794, z = 13})
					doTeleportThing(getTopCreature(pos4g).uid, {x = 33486, y = 32794, z = 13})
					doTeleportThing(getTopCreature(pos5g).uid, {x = 33489, y = 32794, z = 13})

		addEvent(AddBossg, 5 * 1000)
		setGlobalStorageValue(93527, 1)
		addEvent(setGlobalStorageValue, 20*60*1000, 93527, 0)
		
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