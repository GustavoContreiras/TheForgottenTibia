local BOSSe = "Zamulosh" -- boss name
local BOSS1e = "Zamulosh" -- boss name
local BOSS2e = "Zamulosh" -- boss name
local BOSS_POSe = {x = 33643, y = 32756, z = 11} -- boss spawn
local BOSS_POS1e = {x = 33643, y = 32756, z = 11} -- boss spawn
local BOSS_POS2e = {x = 33649, y = 32757, z = 11} -- boss spawn
   
local roome = {fromx = 33629, tox = 33657, fromy = 32746, toy = 32767, z = 11} -- boss room

local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creaturee = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creaturee.uid)) then
                    return true
                end
            end
        end
    end
    return false
end

function AddBosse()

local bosse = 0
for x = roome.fromx, roome.tox do
for y = roome.fromy, roome.toy do
for z = roome.z, roome.z do

creaturee = {x = x, y = y, z = z}
mobe = getTopCreature(creaturee).uid

    if getCreatureName(mobe) == BOSSe then
        bosse = 1
    end
end
end
end

if bosse == 1 then
end

if bosse == 0 then
        Game.createMonster(BOSSe, BOSS_POSe)
end

return true
end

function onUse(cid, item, fromPosition, itemEx) 
	local player = Player(cid)
	if not player then
		return true
	end
	if(getGlobalStorageValue(93525) < 1) then
        if item.itemid == 9825 then 
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33629, y = 32746, z = 11, stackpos = 255}, {x = 33657, y = 32767, z = 11, stackpos = 255}) then
				pos1e = {x = 33680, y = 32741, z = getCreaturePosition(cid).z}
				pos2e = {x = 33680, y = 32742, z = getCreaturePosition(cid).z}
				pos3e = {x = 33680, y = 32743, z = getCreaturePosition(cid).z}
				pos4e = {x = 33680, y = 32744, z = getCreaturePosition(cid).z}
				pos5e = {x = 33680, y = 32745, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1e).uid)) then
				if(isPlayer(getTopCreature(pos2e).uid)) then
				if(isPlayer(getTopCreature(pos3e).uid)) then
				if(isPlayer(getTopCreature(pos4e).uid)) then
				if(isPlayer(getTopCreature(pos5e).uid)) then
					doTeleportThing(getTopCreature(pos1e).uid, {x = 33639, y = 32763, z = 11})
					doTeleportThing(getTopCreature(pos2e).uid, {x = 33640, y = 32763, z = 11})
					doTeleportThing(getTopCreature(pos3e).uid, {x = 33642, y = 32763, z = 11})
					doTeleportThing(getTopCreature(pos4e).uid, {x = 33645, y = 32763, z = 11})
					doTeleportThing(getTopCreature(pos5e).uid, {x = 33647, y = 32763, z = 11})

		addEvent(AddBosse, 5 * 1000)
		setGlobalStorageValue(93525, 1)
		addEvent(setGlobalStorageValue, 20*60*1000, 93525, 0)
		
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