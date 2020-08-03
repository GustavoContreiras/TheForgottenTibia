local BOSSc = "Destabilized Ferumbras" -- boss name
local BOSS1c = "Hellflayer" -- boss name
local BOSS2c = "Hellflayer" -- boss name
local BOSS_POSc = {x = 33409, y = 32286, z = 14} -- boss spawn
local BOSS_POS1c = {x = 33405, y = 32289, z = 14} -- boss spawn
local BOSS_POS2c = {x = 33412, y = 32289, z = 14} -- boss spawn
   
local roomc = {fromx = 33394, tox = 33426, fromy = 32274, toy = 32301, z = 14} -- boss room
 
local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creaturec = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creaturec.uid)) then
                    return true
                end
            end
        end
    end
    return false
end


function AddBossc()

local bossc = 0
for x = roomc.fromx, roomc.tox do
for y = roomc.fromy, roomc.toy do
for z = roomc.z, roomc.z do

creaturec = {x = x, y = y, z = z}
mobc = getTopCreature(creaturec).uid

    if getCreatureName(mobc) == BOSSc then
        bossc = 1
    end
end
end
end

if bossc == 1 then
end

if bossc == 0 then
		local monster = Game.createMonster("Destabilized Ferumbras", Position(33409, 32286, 14))
        monster:setReward(true)		
end

return true
end


function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(93520) < 1) then	
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33400, y = 32279, z = 14, stackpos = 100}, {x = 33417, y = 32295, z = 14, stackpos = 100}) then
				pos1c = {x = 33380, y = 32308, z = getCreaturePosition(cid).z}
				pos2c = {x = 33381, y = 32308, z = getCreaturePosition(cid).z}
				pos3c = {x = 33382, y = 32308, z = getCreaturePosition(cid).z}
				pos4c = {x = 33383, y = 32308, z = getCreaturePosition(cid).z}
				pos5c = {x = 33384, y = 32308, z = getCreaturePosition(cid).z}
				pos6c = {x = 33385, y = 32308, z = getCreaturePosition(cid).z}
				pos7c = {x = 33386, y = 32308, z = getCreaturePosition(cid).z}
				pos8c = {x = 33387, y = 32308, z = getCreaturePosition(cid).z}
				pos9c = {x = 33388, y = 32308, z = getCreaturePosition(cid).z}
				pos10c = {x = 33389, y = 32308, z = getCreaturePosition(cid).z}
				
				if(isPlayer(getTopCreature(pos1c).uid)) then
				if(isPlayer(getTopCreature(pos2c).uid)) then
				if(isPlayer(getTopCreature(pos3c).uid)) then
				if(isPlayer(getTopCreature(pos4c).uid)) then
				if(isPlayer(getTopCreature(pos5c).uid)) then
				if(isPlayer(getTopCreature(pos6c).uid)) then
				if(isPlayer(getTopCreature(pos7c).uid)) then
				if(isPlayer(getTopCreature(pos8c).uid)) then
				if(isPlayer(getTopCreature(pos9c).uid)) then
				if(isPlayer(getTopCreature(pos10c).uid)) then
					doTeleportThing(getTopCreature(pos1c).uid, {x = 33403, y = 32294, z = 14})
					doTeleportThing(getTopCreature(pos2c).uid, {x = 33404, y = 32294, z = 14})
					doTeleportThing(getTopCreature(pos3c).uid, {x = 33405, y = 32294, z = 14})
					doTeleportThing(getTopCreature(pos4c).uid, {x = 33406, y = 32294, z = 14})
					doTeleportThing(getTopCreature(pos5c).uid, {x = 33407, y = 32294, z = 14})					
					doTeleportThing(getTopCreature(pos6c).uid, {x = 33408, y = 32294, z = 14})
					doTeleportThing(getTopCreature(pos7c).uid, {x = 33409, y = 32294, z = 14})
					doTeleportThing(getTopCreature(pos8c).uid, {x = 33410, y = 32294, z = 14})
					doTeleportThing(getTopCreature(pos9c).uid, {x = 33411, y = 32294, z = 14})
					doTeleportThing(getTopCreature(pos10c).uid, {x = 33412, y = 32294, z = 14})
					

		   setGlobalStorageValue(93520, 1)
		   addEvent(AddBossc, 5 * 1000)
		   addEvent(setGlobalStorageValue, 50*60*1000, 93520, 0)
		   
			
	 end
	 end
	 end
     end
	 end
	 end
	 end
	 end
	 end
	 end
	else doPlayerSendTextMessage(cid,19,"There are players inside the room or is missing players here.")
end

end
else 
doPlayerSendCancel(cid, "Please, wait 50 minutes counting the last use to start again.")
end
	return true
end