local storages = {
	[26100] = SvargrondArena.Storages.Greenhorn,
	[27100] = SvargrondArena.Storages.Scrapper,
	[28100] = SvargrondArena.Storages.Warlord
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	-- Cannot use opened door
	if item.itemid == 5133 then
		return false
	end

	if player:getStorageValue(SvargrondArena.Storages.Arena) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This door seems to be sealed against unwanted intruders.')
		return true
	end

	-- Doors to rewards
	local cStorage = storages[item.actionid]
	if cStorage then
		if player:getStorageValue(cStorage) ~= 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It\'s locked.')
			return true
		end

		item:transform(item.itemid + 1)
		player:teleportTo(toPosition, true)

	-- Arena entrance doors
	else
		if player:getStorageValue(SvargrondArena.Storages.Pit) ~= 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This door seems to be sealed against unwanted intruders.')
			return true
		end

		item:transform(item.itemid + 1)
		player:teleportTo(toPosition, true)
	end

	return true
end
