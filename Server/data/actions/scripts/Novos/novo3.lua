local BOSScac = "Eradicator" -- boss name
local BOSS_POScc = {x = 32311, y = 31284, z = 14} -- boss spawn
   
local roomcc = {fromx = 32299, tox = 32319, fromy = 31273, toy = 31295, z = 14} -- boss room   
 
local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creaturecac = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creaturecac.uid)) then
                    return true
                end
            end
        end
    end
    return false
end


function AddBOSScac()

local BOSScac = 0
for x = roomcc.fromx, roomcc.tox do
for y = roomcc.fromy, roomcc.toy do
for z = roomcc.z, roomcc.z do

creaturecac = {x = x, y = y, z = z}
mobcc = getTopCreature(creaturecac).uid

    if getCreatureName(mobcc) == BOSScac then
        BOSScac = 1
    end
end
end
end

if BOSScac == 1 then
end

if BOSScac == 0 then
		local monster = Game.createMonster("Eradicator", Position(32311, 31284, 14))
        --monster:setReward(true)		
end

return true
end


function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(94531) < 1) then	
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 32299, y = 31273, z = 14, stackpos = 100}, {x = 32319, y = 31294, z = 14, stackpos = 100}) then
				pos1cc = {x = 32334, y = 31284, z = getCreaturePosition(cid).z}
				pos2cc = {x = 32334, y = 31285, z = getCreaturePosition(cid).z}
				pos3cc = {x = 32334, y = 31286, z = getCreaturePosition(cid).z}
				pos4cc = {x = 32334, y = 31287, z = getCreaturePosition(cid).z}
				pos5cc = {x = 32334, y = 31288, z = getCreaturePosition(cid).z}
				
				if(isPlayer(getTopCreature(pos1cc).uid)) then
				if(isPlayer(getTopCreature(pos2cc).uid)) then
				if(isPlayer(getTopCreature(pos3cc).uid)) then
				if(isPlayer(getTopCreature(pos4cc).uid)) then
				if(isPlayer(getTopCreature(pos5cc).uid)) then
				
					doTeleportThing(getTopCreature(pos1cc).uid, {x = 32301, y = 31287, z = 14})
					doTeleportThing(getTopCreature(pos2cc).uid, {x = 32301, y = 31286, z = 14})
					doTeleportThing(getTopCreature(pos3cc).uid, {x = 32301, y = 31285, z = 14})
					doTeleportThing(getTopCreature(pos4cc).uid, {x = 32301, y = 31283, z = 14})
					doTeleportThing(getTopCreature(pos5cc).uid, {x = 32301, y = 31281, z = 14})
					

		   setGlobalStorageValue(94531, 1)
		   addEvent(AddBOSScac, 5 * 1000)
		   addEvent(setGlobalStorageValue, 50*60*1000, 94531, 0)
		   
			
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