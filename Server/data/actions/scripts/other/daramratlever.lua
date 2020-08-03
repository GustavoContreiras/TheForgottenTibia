local config = {
	bridgePositions = {
		Position(32792, 33059, 9),
		Position(32792, 33060, 9),
		Position(32792, 33061, 9)
	},
	bridgeID = 5770,
	waterID = 4615
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile, thing, creature
	for i = 1, #config.bridgePositions do
		tile = Tile(config.bridgePositions[i])
		if tile then
			thing, creature = tile:getItemById(item.itemid == 1945 and config.waterID or config.bridgeID), tile:getTopCreature()
			if thing then
				thing:transform(item.itemid == 1945 and config.bridgeID or config.waterID)
			end
		end
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
