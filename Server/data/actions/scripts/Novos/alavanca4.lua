local BOSSd = "Ragiaz" -- boss name
local BOSS1d = "Death Dragon" -- boss name
local BOSS2d = "Death Dragon" -- boss name
local BOSS_POSd = {x = 33482, y = 32333, z = 13} -- boss spawn
local BOSS_POS1d = {x = 33485, y = 32331, z = 13} -- boss spawn
local BOSS_POS2d = {x = 33478, y = 32332, z = 13} -- boss spawn
   
local roomd = {fromx = 33468, tox = 33494, fromy = 32321, toy = 32348, z = 13} -- boss room

local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creatured = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creatured.uid)) then
                    return true
                end
            end
        end
    end
    return false
end

function AddBossd()

local bossd = 0
for x = roomd.fromx, roomd.tox do
for y = roomd.fromy, roomd.toy do
for z = roomd.z, roomd.z do

creatured = {x = x, y = y, z = z}
mobd = getTopCreature(creatured).uid

    if getCreatureName(mobd) == BOSSd then
        bossd = 1
    end
end
end
end

if bossd == 1 then
end

if bossd == 0 then
        Game.createMonster(BOSSd, BOSS_POSd)

end

return true
end

function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(93523) < 1) then
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33472, y = 32323, z = 13, stackpos = 255}, {x = 33496, y = 32346, z = 13, stackpos = 255}) then
				pos1d = {x = 33456, y = 32356, z = getCreaturePosition(cid).z}
				pos2d = {x = 33457, y = 32356, z = getCreaturePosition(cid).z}
				pos3d = {x = 33458, y = 32356, z = getCreaturePosition(cid).z}
				pos4d = {x = 33459, y = 32356, z = getCreaturePosition(cid).z}
				pos5d = {x = 33460, y = 32356, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1d).uid)) then
				if(isPlayer(getTopCreature(pos2d).uid)) then
				if(isPlayer(getTopCreature(pos3d).uid)) then
				if(isPlayer(getTopCreature(pos4d).uid)) then
				if(isPlayer(getTopCreature(pos5d).uid)) then
					doTeleportThing(getTopCreature(pos1d).uid, {x = 33479, y = 32343, z = 13})
					doTeleportThing(getTopCreature(pos2d).uid, {x = 33480, y = 32343, z = 13})
					doTeleportThing(getTopCreature(pos3d).uid, {x = 33481, y = 32343, z = 13})
					doTeleportThing(getTopCreature(pos4d).uid, {x = 33483, y = 32343, z = 13})
					doTeleportThing(getTopCreature(pos5d).uid, {x = 33485, y = 32343, z = 13})

		addEvent(AddBossd, 5 * 1000)
		setGlobalStorageValue(93523, 1)
		addEvent(setGlobalStorageValue, 20*60*1000, 93523, 0)
		
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