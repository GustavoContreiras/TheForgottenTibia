local BOSScae = "World Devourer" -- boss name
local BOSS_POSce = {x = 32271, y = 31349, z = 14} -- boss spawn
   
local roomce = {fromx = 32260, tox = 32283, fromy = 31336, toy = 31359, z = 14} -- boss room  
 
local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creaturecae = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creaturecae.uid)) then
                    return true
                end
            end
        end
    end
    return false
end


function AddBOSScae()

local BOSScae = 0
for x = roomce.fromx, roomce.tox do
for y = roomce.fromy, roomce.toy do
for z = roomce.z, roomce.z do

creaturecae = {x = x, y = y, z = z}
mobce = getTopCreature(creaturecae).uid

    if getCreatureName(mobce) == BOSScae then
        BOSScae = 1
    end
end
end
end

if BOSScae == 1 then
end

if BOSScae == 0 then
		local monster = Game.createMonster("World Devourer", Position(32271, 31349, 14))
        --monster:setReward(true)		
end

return true
end


function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(94533) < 1) then	
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 32260, y = 31336, z = 14, stackpos = 100}, {x = 32283, y = 31359, z = 14, stackpos = 100}) then
				pos1ce = {x = 32207, y = 31284, z = getCreaturePosition(cid).z}
				pos2ce = {x = 32207, y = 31285, z = getCreaturePosition(cid).z}
				pos3ce = {x = 32207, y = 31286, z = getCreaturePosition(cid).z}
				pos4ce = {x = 32207, y = 31287, z = getCreaturePosition(cid).z}
				pos5ce = {x = 32207, y = 31288, z = getCreaturePosition(cid).z}
				
				if(isPlayer(getTopCreature(pos1ce).uid)) then
				if(isPlayer(getTopCreature(pos2ce).uid)) then
				if(isPlayer(getTopCreature(pos3ce).uid)) then
				if(isPlayer(getTopCreature(pos4ce).uid)) then
				if(isPlayer(getTopCreature(pos5ce).uid)) then
				
					doTeleportThing(getTopCreature(pos1ce).uid, {x = 32261, y = 31346, z = 14})
					doTeleportThing(getTopCreature(pos2ce).uid, {x = 32261, y = 31347, z = 14})
					doTeleportThing(getTopCreature(pos3ce).uid, {x = 32261, y = 31348, z = 14})
					doTeleportThing(getTopCreature(pos4ce).uid, {x = 32261, y = 31349, z = 14})
					doTeleportThing(getTopCreature(pos5ce).uid, {x = 32261, y = 31350, z = 14})
					

		   setGlobalStorageValue(94533, 1)
		   addEvent(AddBOSScae, 5 * 1000)
		   addEvent(setGlobalStorageValue, 50*60*1000, 94533, 0)
		   
			
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