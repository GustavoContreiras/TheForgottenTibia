local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, true)
combat:setFormula(COMBAT_FORMULA_SKILL, 0, 0, 1, 0)

function onUseWeapon(player, variant)

--[[	local target = Creature(variant:getNumber())
	
	if not combat:execute(player, variant) then
		return false
	end
		
	if math.random(1, 100) > 75 then 
		return false
	end
	
	
	if target:isPlayer() then
	--	player:addDamageCondition(target, CONDITION_BLEEDING, DAMAGELIST_CONSTANT_PERIOD, bleedingDamage, 1, 4)
	else
	--	player:addDamageCondition(target, CONDITION_BLEEDING, DAMAGELIST_CONSTANT_PERIOD, bleedingDamage, 2, 4)
	end
	
	return true]]
end
