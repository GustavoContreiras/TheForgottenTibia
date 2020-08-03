function Creature:onChangeOutfit(outfit)
	return true
end

function Creature:onAreaCombat(tile, isAggressive)
	return RETURNVALUE_NOERROR
end

function Creature:onTargetCombat(target)
	if not self then return true end
	if self:isPlayer() and target:isMonster() then
		target:registerEvent("extra_loot_d")
	end
	if creature:getStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL) == 1 then
		if target:getStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL) == 1 then
			return RETURNVALUE_NOERROR
		elseif target:getStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL) == 0 then
			creature:sendCancelMessage("You cannot attack someone that is on your team.")
			return false
		end
	elseif creature:getStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL) == 1 then
		if target:getStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL) == 1 then
			return RETURNVALUE_NOERROR
		elseif target:getStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL) == 0 then
			creature:sendCancelMessage("You cannot attack someone that is on your team.")
			return false
		end
	end
end
