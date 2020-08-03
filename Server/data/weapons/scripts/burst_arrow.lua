local combat = Combat()
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_BURSTARROW)

local area = createCombatArea( { {1, 1, 1}, {1, 3, 1}, {1, 1, 1} } )
combat:setArea(area)

function onGetFormulaValues(cid, level, maglevel)
	min = 0
	max = -((level * 2) + (maglevel * 3)) * 0.6 
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onUseWeapon(player, var)
	return combat:execute(player, var)
end
