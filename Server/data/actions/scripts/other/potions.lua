local ultimateHealthPot = 8473
local greatHealthPot = 7591
local greatManaPot = 7590
local greatSpiritPot = 8472
local strongHealthPot = 7588
local strongManaPot = 7589
local healthPot = 7618
local manaPot = 7620
local smallHealthPot = 8704
local antidotePot = 8474
local greatEmptyPot = 7635
local strongEmptyPot = 7634
local emptyPot = 7636

local removeOnUse = true

local antidote = Combat()
antidote:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
antidote:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
antidote:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
antidote:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
antidote:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)

local exhaust = Condition(CONDITION_EXHAUST_HEAL)
exhaust:setParameter(CONDITION_PARAM_TICKS, (configManager.getNumber(configKeys.EX_ACTIONS_DELAY_INTERVAL) - 200))
-- 1000 - 100 due to exact condition timing. -100 doesn't hurt us, and players don't have reminding ~50ms exhaustion.

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if target == nil then
		return true
	end

	if not target:isPlayer() then
		return true
	end

	if player:getCondition(CONDITION_EXHAUST_HEAL) then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
		return true
	end

	local itemId = item:getId()
	if itemId == antidotePot then
		if not antidote:execute(target, numberToVariant(target:getId())) then
			return false
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		item:remove(1)
		if not removeOnUse then player:addItem(emptyPot, 1) end
	elseif itemId == smallHealthPot then
		if not doTargetCombatHealth(0, target, COMBAT_HEALING, 60, 90, CONST_ME_MAGIC_BLUE) then
			return false
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		item:remove(1)
		if not removeOnUse then player:addItem(emptyPot, 1) end
	elseif itemId == healthPot then
		if not doTargetCombatHealth(0, target, COMBAT_HEALING, 125, 175, CONST_ME_MAGIC_BLUE) then
			return false
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		item:remove(1)
		if not removeOnUse then player:addItem(emptyPot, 1) end
	elseif itemId == manaPot then
		if not doTargetCombatMana(0, target, 75, 125, CONST_ME_MAGIC_BLUE) then
			return false
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		item:remove(1)
		if not removeOnUse then player:addItem(emptyPot, 1) end
	elseif itemId == strongHealthPot then
		if target:getLevel() < 50 and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by players of level 50 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		if not doTargetCombatHealth(0, target, COMBAT_HEALING, 250, 350, CONST_ME_MAGIC_BLUE) then
			return false
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		item:remove(1)
		if not removeOnUse then player:addItem(strongEmptyPot, 1) end
	elseif itemId == strongManaPot then
		if target:getLevel() < 50 and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by players of level 50 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		if not doTargetCombatMana(0, target, 115, 185, CONST_ME_MAGIC_BLUE) then
			return false
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		item:remove(1)
		if not removeOnUse then player:addItem(strongEmptyPot, 1) end
	elseif itemId == greatSpiritPot then
		if target:getLevel() < 80 and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by players of level 80 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		if not doTargetCombatHealth(0, target, COMBAT_HEALING, 250, 350, CONST_ME_MAGIC_BLUE) or not doTargetCombatMana(0, target, 100, 200, CONST_ME_MAGIC_BLUE) then
			return false
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		item:remove(1)
		if not removeOnUse then player:addItem(greatEmptyPot, 1) end
	elseif itemId == greatHealthPot then
		if target:getLevel() < 80 and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by players of level 80 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		if not doTargetCombatHealth(0, target, COMBAT_HEALING, 425, 575, CONST_ME_MAGIC_BLUE) then
			return false
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		item:remove(1)
		if not removeOnUse then player:addItem(greatEmptyPot, 1) end
	elseif itemId == greatManaPot then
		if target:getLevel() < 80 and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by players of level 80 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		if not doTargetCombatMana(0, target, 150, 250, CONST_ME_MAGIC_BLUE) then
			return false
		end
		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		item:remove(1)
		if not removeOnUse then player:addItem(greatEmptyPot, 1) end
	elseif itemId == ultimateHealthPot then
		if target:getLevel() < 130 and not getPlayerFlagValue(player, PlayerFlag_IgnoreSpellCheck) then
			player:say("This potion can only be consumed by players of level 130 or higher.", TALKTYPE_MONSTER_SAY)
			return true
		end

		if not doTargetCombatHealth(0, target, COMBAT_HEALING, 650, 850, CONST_ME_MAGIC_BLUE) then
			return false
		end

		player:addCondition(exhaust)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		item:remove(1)
		if not removeOnUse then player:addItem(greatEmptyPot, 1) end
	end
	return true
end
