local BOSSca = "The Hunger" -- boss name
local BOSS1ca = "Greed" -- boss name
local BOSS2ca = "Greed" -- boss name
local BOSS_POSca = {x = 32245, y = 31371, z = 14} -- boss spawn
local BOSS_POS1ca = {x = 32246, y = 31377, z = 14} -- boss spawn
local BOSS_POS2ca = {x = 32244, y = 31365, z = 14} -- boss spawn
   
local roomca = {fromx = 32234, tox = 32254, fromy = 31361, toy = 31384, z = 14} -- boss room 
 
local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creatureca = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creatureca.uid)) then
                    return true
                end
            end
        end
    end
    return false
end


function AddBossca()

local bossca = 0
for x = roomca.fromx, roomca.tox do
for y = roomca.fromy, roomca.toy do
for z = roomca.z, roomca.z do

creatureca = {x = x, y = y, z = z}
mobca = getTopCreature(creatureca).uid

    if getCreatureName(mobca) == BOSSca then
        bossca = 1
    end
end
end
end

if bossca == 1 then
end

if bossca == 0 then
		local monster = Game.createMonster("The Hunger", Position(32245, 31372, 14))
        --monster:setReward(true)		
end

return true
end


function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(94529) < 1) then	
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 32233, y = 31361, z = 14, stackpos = 100}, {x = 32255, y = 31384, z = 14, stackpos = 100}) then
				pos1ca = {x = 32079, y = 31313, z = getCreaturePosition(cid).z}
				pos2ca = {x = 32079, y = 31314, z = getCreaturePosition(cid).z}
				pos3ca = {x = 32079, y = 31315, z = getCreaturePosition(cid).z}
				pos4ca = {x = 32079, y = 31316, z = getCreaturePosition(cid).z}
				pos5ca = {x = 32079, y = 31317, z = getCreaturePosition(cid).z}
				
				if(isPlayer(getTopCreature(pos1ca).uid)) then
				if(isPlayer(getTopCreature(pos2ca).uid)) then
				if(isPlayer(getTopCreature(pos3ca).uid)) then
				if(isPlayer(getTopCreature(pos4ca).uid)) then
				if(isPlayer(getTopCreature(pos5ca).uid)) then
				
					doTeleportThing(getTopCreature(pos1ca).uid, {x = 32234, y = 31369, z = 14})
					doTeleportThing(getTopCreature(pos2ca).uid, {x = 32234, y = 31370, z = 14})
					doTeleportThing(getTopCreature(pos3ca).uid, {x = 32234, y = 31371, z = 14})
					doTeleportThing(getTopCreature(pos4ca).uid, {x = 32234, y = 31372, z = 14})
					doTeleportThing(getTopCreature(pos5ca).uid, {x = 32234, y = 31374, z = 14})
					

		   setGlobalStorageValue(94529, 1)
		   addEvent(AddBossca, 5 * 1000)
		   addEvent(setGlobalStorageValue, 50*60*1000, 94529, 0)
		   
			
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