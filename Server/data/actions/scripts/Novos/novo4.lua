local BOSScad = "Rupture" -- boss name
local BOSS_POScd = {x = 32331, y = 31252, z = 14} -- boss spawn
   
local roomcd = {fromx = 32326, tox = 32347, fromy = 31240, toy = 31262, z = 14} -- boss room 
 
local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creaturecad = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creaturecad.uid)) then
                    return true
                end
            end
        end
    end
    return false
end


function AddBOSScad()

local BOSScad = 0
for x = roomcd.fromx, roomcd.tox do
for y = roomcd.fromy, roomcd.toy do
for z = roomcd.z, roomcd.z do

creaturecad = {x = x, y = y, z = z}
mobcd = getTopCreature(creaturecad).uid

    if getCreatureName(mobcd) == BOSScad then
        BOSScad = 1
    end
end
end
end

if BOSScad == 1 then
end

if BOSScad == 0 then
		local monster = Game.createMonster("Rupture", Position(32331, 31252, 14))
        --monster:setReward(true)		
end

return true
end


function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(94532) < 1) then	
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 32326, y = 31240, z = 14, stackpos = 100}, {x = 32347, y = 31261, z = 14, stackpos = 100}) then
				pos1cd = {x = 32309, y = 31248, z = getCreaturePosition(cid).z}
				pos2cd = {x = 32309, y = 31249, z = getCreaturePosition(cid).z}
				pos3cd = {x = 32309, y = 31250, z = getCreaturePosition(cid).z}
				pos4cd = {x = 32309, y = 31251, z = getCreaturePosition(cid).z}
				pos5cd = {x = 32309, y = 31252, z = getCreaturePosition(cid).z}
				
				if(isPlayer(getTopCreature(pos1cd).uid)) then
				if(isPlayer(getTopCreature(pos2cd).uid)) then
				if(isPlayer(getTopCreature(pos3cd).uid)) then
				if(isPlayer(getTopCreature(pos4cd).uid)) then
				if(isPlayer(getTopCreature(pos5cd).uid)) then
				
					doTeleportThing(getTopCreature(pos1cd).uid, {x = 32343, y = 31253, z = 14})
					doTeleportThing(getTopCreature(pos2cd).uid, {x = 32343, y = 31252, z = 14})
					doTeleportThing(getTopCreature(pos3cd).uid, {x = 32343, y = 31251, z = 14})
					doTeleportThing(getTopCreature(pos4cd).uid, {x = 32343, y = 31249, z = 14})
					doTeleportThing(getTopCreature(pos5cd).uid, {x = 32343, y = 31248, z = 14})
					

		   setGlobalStorageValue(94532, 1)
		   addEvent(AddBOSScad, 5 * 1000)
		   addEvent(setGlobalStorageValue, 50*60*1000, 94532, 0)
		   
			
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