local BOSS = "Mazoran" -- boss name
local BOSS1 = "Hellflayer" -- boss name
local BOSS2 = "Hellflayer" -- boss name
local BOSS_POS = {x = 33585, y = 32687, z = 14} -- boss spawn
local BOSS_POS1 = {x = 33580, y = 32690, z = 14} -- boss spawn
local BOSS_POS2 = {x = 33590, y = 32690, z = 14} -- boss spawn
   
local room = {fromx = 33572, tox = 33601, fromy = 32678, toy = 32700, z = 14} -- boss room

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

function AddBoss()

local boss = 0
for x = room.fromx, room.tox do
for y = room.fromy, room.toy do
for z = room.z, room.z do

creature = {x = x, y = y, z = z}
mob = getTopCreature(creature).uid

    if getCreatureName(mob) == BOSS then
        boss = 1
    end
end
end
end

if boss == 1 then
end

if boss == 0 then
        Game.createMonster(BOSS, BOSS_POS)

end

return true
end

function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(93521) < 1) then
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33571, y = 32677, z = 14, stackpos = 255}, {x = 33601, y = 32700, z = 14, stackpos = 255}) then
				pos1 = {x = 33593, y = 32644, z = getCreaturePosition(cid).z}
				pos2 = {x = 33593, y = 32645, z = getCreaturePosition(cid).z}
				pos3 = {x = 33593, y = 32646, z = getCreaturePosition(cid).z}
				pos4 = {x = 33593, y = 32647, z = getCreaturePosition(cid).z}
				pos5 = {x = 33593, y = 32648, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1).uid)) then
				if(isPlayer(getTopCreature(pos2).uid)) then
				if(isPlayer(getTopCreature(pos3).uid)) then
				if(isPlayer(getTopCreature(pos4).uid)) then
				if(isPlayer(getTopCreature(pos5).uid)) then
					doTeleportThing(getTopCreature(pos1).uid, {x = 33581, y = 32698, z = 14})
					doTeleportThing(getTopCreature(pos2).uid, {x = 33582, y = 32698, z = 14})
					doTeleportThing(getTopCreature(pos3).uid, {x = 33584, y = 32698, z = 14})
					doTeleportThing(getTopCreature(pos4).uid, {x = 33586, y = 32698, z = 14})
					doTeleportThing(getTopCreature(pos5).uid, {x = 33587, y = 32698, z = 14})

		addEvent(AddBoss, 5 * 1000)
		setGlobalStorageValue(93521, 1)
		addEvent(setGlobalStorageValue, 20*60*1000, 93521, 0)
		
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