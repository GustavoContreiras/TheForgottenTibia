local BOSSb = "Plagirath" -- boss name
local BOSS1b = "Hellflayer" -- boss name
local BOSS2b = "Hellflayer" -- boss name
local BOSS_POSb = {x = 33172, y = 31502, z = 13} -- boss spawn
local BOSS_POS1b = {x = 33171, y = 31500, z = 13} -- boss spawn
local BOSS_POS2b = {x = 33175, y = 31498, z = 13} -- boss spawn
   
local roomb = {fromx = 33157, tox = 33184, fromy = 31491, toy = 31513, z = 13} -- boss room

local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creatureb = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creatureb.uid)) then
                    return true
                end
            end
        end
    end
    return false
end

function AddBossb()

local bossb = 0
for x = roomb.fromx, roomb.tox do
for y = roomb.fromy, roomb.toy do
for z = roomb.z, roomb.z do

creatureb = {x = x, y = y, z = z}
mobb = getTopCreature(creatureb).uid

    if getCreatureName(mobb) == BOSSb then
        bossb = 1
    end
end
end
end

if bossb == 1 then
end

if bossb == 0 then
        Game.createMonster(BOSSb, BOSS_POSb)
end

return true
end

function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(93522) < 1) then
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33157, y = 31491, z = 13, stackpos = 255}, {x = 33184, y = 31513, z = 13, stackpos = 255}) then
				pos1b = {x = 33229, y = 31500, z = getCreaturePosition(cid).z}
				pos2b = {x = 33229, y = 31501, z = getCreaturePosition(cid).z}
				pos3b = {x = 33229, y = 31502, z = getCreaturePosition(cid).z}
				pos4b = {x = 33229, y = 31503, z = getCreaturePosition(cid).z}
				pos5b = {x = 33229, y = 31504, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1b).uid)) then
				if(isPlayer(getTopCreature(pos2b).uid)) then
				if(isPlayer(getTopCreature(pos3b).uid)) then
				if(isPlayer(getTopCreature(pos4b).uid)) then
				if(isPlayer(getTopCreature(pos5b).uid)) then
					doTeleportThing(getTopCreature(pos1b).uid, {x = 33170, y = 31509, z = 13})
					doTeleportThing(getTopCreature(pos2b).uid, {x = 33171, y = 31509, z = 13})
					doTeleportThing(getTopCreature(pos3b).uid, {x = 33172, y = 31509, z = 13})
					doTeleportThing(getTopCreature(pos4b).uid, {x = 33173, y = 31509, z = 13})
					doTeleportThing(getTopCreature(pos5b).uid, {x = 33174, y = 31509, z = 13})

		addEvent(AddBossb, 5 * 1000)
		setGlobalStorageValue(93522, 1)
		addEvent(setGlobalStorageValue, 20*60*1000, 93522, 0)
			
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