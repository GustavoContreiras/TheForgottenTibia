--[[local ﻿mounts = 
{ 
	--["mount"] = {id = x},
	["widow queen"] = {id = 1}
}]]

function onSay(player, words, param)

	--local word = mounts[string.lower(param)]
	--local mountdoll_id = 9019 -- id do mount doll

	player:addMount(1)

	--[[if player:getItemCount(mountdoll_id) > 0 then
		if param ~= "" and word then
			if not player:hasMount(word.id) and player:removeItem(mountdoll_id, 1) then
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You got your mount!")
				player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				player:addMount(1)
			else
				player:sendCancelMessage("You already have this mount.")
			end
		else
			player:sendCancelMessage("This mount does not exist.")
		end
	else
		player:sendCancelMessage("You must have a mount doll in your backpack!")
	end]]

	return true
end