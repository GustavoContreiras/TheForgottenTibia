local BOSScab = "The Rage" -- boss name
local BOSS_POScb = {x = 32296, y = 31368, z = 14} -- boss spawn
   
local roomcb = {fromx = 32289, tox = 32312, fromy = 31361, toy = 31384, z = 14} -- boss room  
 
local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creaturecab = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creaturecab.uid)) then
                    return true
                end
            end
        end
    end
    return false
end


function AddBosscab()

local bosscab = 0
for x = roomcb.fromx, roomcb.tox do
for y = roomcb.fromy, roomcb.toy do
for z = roomcb.z, roomcb.z do

creaturecab = {x = x, y = y, z = z}
mobcb = getTopCreature(creaturecab).uid

    if getCreatureName(mobcb) == BOSScab then
        bosscab = 1
    end
end
end
end

if bosscab == 1 then
end

if bosscab == 0 then
		local monster = Game.createMonster("The Rage", Position(32296, 31368, 14))
        --monster:setReward(true)		
end

return true
end


function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(94530) < 1) then	
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 32290, y = 31360, z = 14, stackpos = 100}, {x = 32312, y = 31384, z = 14, stackpos = 100}) then
				pos1cb = {x = 32272, y = 31374, z = getCreaturePosition(cid).z}
				pos2cb = {x = 32272, y = 31375, z = getCreaturePosition(cid).z}
				pos3cb = {x = 32272, y = 31376, z = getCreaturePosition(cid).z}
				pos4cb = {x = 32272, y = 31377, z = getCreaturePosition(cid).z}
				pos5cb = {x = 32272, y = 31378, z = getCreaturePosition(cid).z}
				
				if(isPlayer(getTopCreature(pos1cb).uid)) then
				if(isPlayer(getTopCreature(pos2cb).uid)) then
				if(isPlayer(getTopCreature(pos3cb).uid)) then
				if(isPlayer(getTopCreature(pos4cb).uid)) then
				if(isPlayer(getTopCreature(pos5cb).uid)) then
				
					doTeleportThing(getTopCreature(pos1cb).uid, {x = 32309, y = 31369, z = 14})
					doTeleportThing(getTopCreature(pos2cb).uid, {x = 32309, y = 31370, z = 14})
					doTeleportThing(getTopCreature(pos3cb).uid, {x = 32309, y = 31372, z = 14})
					doTeleportThing(getTopCreature(pos4cb).uid, {x = 32309, y = 31373, z = 14})
					doTeleportThing(getTopCreature(pos5cb).uid, {x = 32309, y = 31374, z = 14})
					

		   setGlobalStorageValue(94530, 1)
		   addEvent(AddBosscab, 5 * 1000)
		   addEvent(setGlobalStorageValue, 50*60*1000, 94530, 0)
		   
			
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