local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creature = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creature.uid)) then
                    return true
                end
            end
        end
    end
    return false
end


	copper = {x=33607, y=32418, z=12}

function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)
	if not player then
		return true
	end
	if(item.itemid == 22605) then
		if(itemEx.itemid == 22634) then
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33600, y = 32414, z = 12, stackpos = 255}, {x = 33575, y = 32429, z = 12, stackpos = 255}) then
		doTeleportThing(cid, copper)
	        doSummonCreature("horadron", {x=33606, y=32417, z=12})
		doRemoveItem(item.uid, 1)
			end
		end
	end
	return true
end