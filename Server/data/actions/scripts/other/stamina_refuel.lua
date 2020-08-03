-- <action itemid="ITEMID" script="other/stamina_refuel.lua"/> 

local stamina_full = 42 * 60 -- config. 42 = horas

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if player:getStamina() >= stamina_full then
		player:sendCancelMessage("Your stamina is already full.")
	elseif player:getPremiumDays() < 1 then
		player:sendCancelMessage("You must have a premium account.")
	else
		player:setStamina(stamina_full)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Your stamina has been refilled.")
		item:remove(1)
	end
	
	return true
end