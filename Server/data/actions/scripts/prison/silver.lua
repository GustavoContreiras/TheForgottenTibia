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


	silver = {x=33527, y=32419, z=12}

function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)
	if not player then
		return true
	end
	if(item.itemid == 22604) then
		if(itemEx.itemid == 22638) then
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33519, y = 32414, z = 12, stackpos = 255}, {x = 33534, y = 32429, z = 12, stackpos = 255}) then
		doTeleportThing(cid, silver)
	        doSummonCreature("terofar", {x=33524, y=32418, z=12})
		doRemoveItem(item.uid, 1)
			end
		end
	end
	return true
end