function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local split = param:split(",")
	if not split[1] then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Usage: /resetlevel Player")
		return false
	end

	local target = Player(split[1])
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "RESETING")
	local targetName = target:getName()
	target:remove()
	db.query("UPDATE `players` SET `level`=8,`max_level_reached`=8,`experience`=4200,`maglevel`=0,`resets`=2,`blessings`=5,`skill_points`=24,`skill_points_total`=24,`skill_fist`=8,`skill_club`=8,`skill_sword`=8,`skill_axe`=8,`skill_dist`=8,`skill_shielding`=8,`skill_fishing`=8 WHERE `name`='"..targetName.."'")
	return false
end
