local BOSSf = "Tarbaz" -- boss name
local BOSS1f = "Demon" -- boss name
local BOSS2f = "Demon" -- boss name
local BOSS_POSf = {x = 33459, y = 32844, z = 11} -- boss spawn
local BOSS_POS1f = {x = 33455, y = 32843, z = 11} -- boss spawn
local BOSS_POS2f = {x = 33461, y = 32844, z = 11} -- boss spawn
   
local roomf = {fromx = 33447, tox = 33475, fromy = 32834, toy = 32856, z = 11} -- boss room

local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creaturef = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creaturef.uid)) then
                    return true
                end
            end
        end
    end
    return false
end

function AddBossf()

local bossf = 0
for x = roomf.fromx, roomf.tox do
for y = roomf.fromy, roomf.toy do
for z = roomf.z, roomf.z do

creaturef = {x = x, y = y, z = z}
mobf = getTopCreature(creaturef).uid

    if getCreatureName(mobf) == BOSSf then
        bossf = 1
    end
end
end
end

if bossf == 1 then
end

if bossf == 0 then
        Game.createMonster(BOSSf, BOSS_POSf)
end

return true
end

function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(93526) < 1) then
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33447, y = 32834, z = 11, stackpos = 255}, {x = 33475, y = 32856, z = 11, stackpos = 255}) then
				pos1f = {x = 33418, y = 32850, z = getCreaturePosition(cid).z}
				pos2f = {x = 33418, y = 32851, z = getCreaturePosition(cid).z}
				pos3f = {x = 33418, y = 32852, z = getCreaturePosition(cid).z}
				pos4f = {x = 33418, y = 32853, z = getCreaturePosition(cid).z}
				pos5f = {x = 33418, y = 32854, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1f).uid)) then
				if(isPlayer(getTopCreature(pos2f).uid)) then
				if(isPlayer(getTopCreature(pos3f).uid)) then
				if(isPlayer(getTopCreature(pos4f).uid)) then
				if(isPlayer(getTopCreature(pos5f).uid)) then
					doTeleportThing(getTopCreature(pos1f).uid, {x = 33456, y = 32851, z = 11})
					doTeleportThing(getTopCreature(pos2f).uid, {x = 33457, y = 32851, z = 11})
					doTeleportThing(getTopCreature(pos3f).uid, {x = 33458, y = 32851, z = 11})
					doTeleportThing(getTopCreature(pos4f).uid, {x = 33459, y = 32851, z = 11})
					doTeleportThing(getTopCreature(pos5f).uid, {x = 33461, y = 32851, z = 11})

		addEvent(AddBossf, 5 * 1000)
		setGlobalStorageValue(93526, 1)
		addEvent(setGlobalStorageValue, 20*60*1000, 93526, 0)
			
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