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


	bronze = {x=33570, y=32418, z=12}
	salabronze = {x=33606, y=32393, z=11}

function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)
	if not player then
		return true
	end
	if(item.itemid == 22606) then
		if(itemEx.itemid == 22636) then
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33560, y = 32414, z = 12, stackpos = 255}, {x = 33534, y = 32429, z = 12, stackpos = 255}) then
		doTeleportThing(cid, bronze)
	        doSummonCreature("zavarash", {x=33565, y=32418, z=12})
		doRemoveItem(item.uid, 1)
			end
		end
	end
	return true
end





