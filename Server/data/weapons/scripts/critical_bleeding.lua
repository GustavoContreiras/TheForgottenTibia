local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setFormula(COMBAT_FORMULA_SKILL, 0, 0, 1, 0)

function onUseWeapon(player, variant, variantTwo, variantThree, variantFour)

	local weaponType = variantTwo:getString()
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "weaponType: " .. weaponType)
	local isDualWielding = variantThree:getNumber() == 1
	local damage = variantFour:getNumber()
	local critical = CRITICAL[weaponType]
	local target = Creature(variant:getNumber())
	
	if not critical then
		return false
	end
	
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "weaponType: " .. weaponType .. " / damage: " .. damage)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, string.format(variantThree:getNumber()))
	
	if not combat:execute(player, variant) then
		return false
	end
		
	if math.random(1, 100) > critical.chance then 
		return false
	end
	
	local bleedingDamage
	local criticalDamage
	
	if target:isPlayer() then
		bleedingDamage = math.floor((player:getEffectiveSkillLevel(SKILL_STRENGHT) * 0.01) + 1)
		criticalDamage = math.floor(damage * critical.amount / 2)
		player:addDamageCondition(target, CONDITION_BLEEDING, DAMAGELIST_CONSTANT_PERIOD, bleedingDamage, 1, 4)
	else
		bleedingDamage = math.floor((player:getEffectiveSkillLevel(SKILL_STRENGHT) * 0.02) + 1)
		criticalDamage = damage * critical.amount
		player:addDamageCondition(target, CONDITION_BLEEDING, DAMAGELIST_CONSTANT_PERIOD, bleedingDamage, 2, 4)
	end

	target:setHealth(target:getHealth() - criticalDamage)
	target:getPosition():sendMagicEffect(CONST_ME_CRITICAL_DAMAGE)
	
	return true
end