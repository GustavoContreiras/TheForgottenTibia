skillsWindow = nil
skillsButton = nil
applyButton = nil

healthButton = nil
healthValueLabel = nil
newHealthArrowLabel = nil
newHealthValueLabel = nil

manaButton = nil
manaValueLabel = nil
newManaArrowLabel = nil
newManaValueLabel = nil

skillPointsButton = nil
skillPointsValueLabel = nil
newSkillPointsArrowLabel = nil
newSkillPointsValueLabel = nil

capacityButton = nil
capacityValueLabel = nil
newCapacityArrowLabel = nil
newCapacityValueLabel = nil

walkSpeedButton = nil
walkSpeedValueLabel = nil
newWalkSpeedArrowLabel = nil
newWalkSpeedValueLabel = nil

attackSpeedButton = nil
attackSpeedValueLabel = nil
newAttackSpeedArrowLabel = nil
newAttackSpeedValueLabel = nil

magicButton = nil
magicValueLabel = nil
newMagicArrowLabel = nil
newMagicValueLabel = nil
magicPlusButton = nil
magicMinusButton = nil

vitalityButton = nil
vitalityValueLabel = nil
newVitalityArrowLabel = nil
newVitalityValueLabel = nil
vitalityPlusButton = nil
vitalityMinusButton = nil

strenghtButton = nil
strenghtValueLabel = nil
newStrenghtArrowLabel = nil
newStrenghtValueLabel = nil
strenghtPlusButton = nil
strenghtMinusButton = nil

defenceButton = nil
defenceValueLabel = nil
newDefenceArrowLabel = nil
newDefenceValueLabel = nil
defencePlusButton = nil
defenceMinusButton = nil

dexterityButton = nil
dexterityValueLabel = nil
newDexterityArrowLabel = nil
newDexterityValueLabel = nil
dexterityPlusButton = nil
dexterityMinusButton = nil

intelligenceButton = nil
intelligenceValueLabel = nil
newIntelligenceArrowLabel = nil
newIntelligenceValueLabel = nil
intelligencePlusButton = nil
intelligenceMinusButton = nil

faithButton = nil
faithValueLabel = nil
newFaithArrowLabel = nil
newFaithValueLabel = nil
faithPlusButton = nil
faithMinusButton = nil

enduranceButton = nil
enduranceValueLabel = nil
newEnduranceArrowLabel = nil
newEnduranceValueLabel = nil
endurancePlusButton = nil
enduranceMinusButton = nil

criticalDamageButton = nil
criticalValueLabel = nil

player = nil

newSkillPoints = nil
newMagic = nil
newVitality = nil
newStrenght = nil
newDefence = nil
newDexterity = nil
newIntelligence = nil
newFaith = nil
newEndurance = nil

function init()

	skillsButton = modules.client_topmenu.addRightGameToggleButton('skillsButton', tr('Skills') .. ' (Ctrl+S)', '/images/topbuttons/skills', toggle)
	
	skillsWindow = g_ui.loadUI('skills', modules.game_interface.getRightPanel())
	
	applyButton = skillsWindow:recursiveGetChildById('applybutton')

	healthButton = skillsWindow:recursiveGetChildById('health')
	healthValueLabel = healthButton:recursiveGetChildById('value')
	newHealthArrowLabel = healthButton:recursiveGetChildById('arrow')
	newHealthValueLabel = healthButton:recursiveGetChildById('newValue')

	manaButton = skillsWindow:recursiveGetChildById('mana')
	manaValueLabel = manaButton:recursiveGetChildById('value')
	newManaArrowLabel = manaButton:recursiveGetChildById('arrow')
	newManaValueLabel = manaButton:recursiveGetChildById('newValue')
	
	skillPointsButton = skillsWindow:recursiveGetChildById('skillpoints')
	skillPointsValueLabel = skillPointsButton:recursiveGetChildById('value')
	newSkillPointsArrowLabel = skillPointsButton:recursiveGetChildById('arrow')
	newSkillPointsValueLabel = skillPointsButton:recursiveGetChildById('newValue')

	capacityButton = skillsWindow:recursiveGetChildById('capacity')
	capacityValueLabel = capacityButton:recursiveGetChildById('value')
	newCapacityArrowLabel = capacityButton:recursiveGetChildById('arrow')
	newCapacityValueLabel = capacityButton:recursiveGetChildById('newValue')

	walkSpeedButton = skillsWindow:recursiveGetChildById('walkspeed')
	walkSpeedValueLabel = walkSpeedButton:recursiveGetChildById('value')
	newWalkSpeedArrowLabel = walkSpeedButton:recursiveGetChildById('arrow')
	newWalkSpeedValueLabel = walkSpeedButton:recursiveGetChildById('newValue')

	attackSpeedButton = skillsWindow:recursiveGetChildById('attackspeed')
	attackSpeedValueLabel = attackSpeedButton:recursiveGetChildById('value')
	newAttackSpeedArrowLabel = attackSpeedButton:recursiveGetChildById('arrow')
	newAttackSpeedValueLabel = attackSpeedButton:recursiveGetChildById('newValue')

	magicButton = skillsWindow:recursiveGetChildById('magiclevel')
	magicValueLabel = magicButton:recursiveGetChildById('value')
	newMagicArrowLabel = magicButton:recursiveGetChildById('arrow')
	newMagicValueLabel = magicButton:recursiveGetChildById('newValue')
	magicPlusButton = magicButton:recursiveGetChildById('plusbutton')
	magicMinusButton = magicButton:recursiveGetChildById('minusbutton')

	vitalityButton = skillsWindow:recursiveGetChildById('skillId0')
	vitalityValueLabel = vitalityButton:recursiveGetChildById('value')
	newVitalityArrowLabel = vitalityButton:recursiveGetChildById('arrow')
	newVitalityValueLabel = vitalityButton:recursiveGetChildById('newValue')
	vitalityPlusButton = vitalityButton:recursiveGetChildById('plusbutton')
	vitalityMinusButton = vitalityButton:recursiveGetChildById('minusbutton')

	strenghtButton = skillsWindow:recursiveGetChildById('skillId1')
	strenghtValueLabel = strenghtButton:recursiveGetChildById('value')
	newStrenghtArrowLabel = strenghtButton:recursiveGetChildById('arrow')
	newStrenghtValueLabel = strenghtButton:recursiveGetChildById('newValue')
	strenghtPlusButton = strenghtButton:recursiveGetChildById('plusbutton')
	strenghtMinusButton = strenghtButton:recursiveGetChildById('minusbutton')

	defenceButton = skillsWindow:recursiveGetChildById('skillId5')
	defenceValueLabel = defenceButton:recursiveGetChildById('value')
	newDefenceArrowLabel = defenceButton:recursiveGetChildById('arrow')
	newDefenceValueLabel = defenceButton:recursiveGetChildById('newValue')
	defencePlusButton = defenceButton:recursiveGetChildById('plusbutton')
	defenceMinusButton = defenceButton:recursiveGetChildById('minusbutton')

	dexterityButton = skillsWindow:recursiveGetChildById('skillId4')
	dexterityValueLabel = dexterityButton:recursiveGetChildById('value')
	newDexterityArrowLabel = dexterityButton:recursiveGetChildById('arrow')
	newDexterityValueLabel = dexterityButton:recursiveGetChildById('newValue')
	dexterityPlusButton = dexterityButton:recursiveGetChildById('plusbutton')
	dexterityMinusButton = dexterityButton:recursiveGetChildById('minusbutton')

	intelligenceButton = skillsWindow:recursiveGetChildById('skillId3')
	intelligenceValueLabel = intelligenceButton:recursiveGetChildById('value')
	newIntelligenceArrowLabel = intelligenceButton:recursiveGetChildById('arrow')
	newIntelligenceValueLabel = intelligenceButton:recursiveGetChildById('newValue')
	intelligencePlusButton = intelligenceButton:recursiveGetChildById('plusbutton')
	intelligenceMinusButton = intelligenceButton:recursiveGetChildById('minusbutton')

	faithButton = skillsWindow:recursiveGetChildById('skillId2')
	faithValueLabel = faithButton:recursiveGetChildById('value')
	newFaithArrowLabel = faithButton:recursiveGetChildById('arrow')
	newFaithValueLabel = faithButton:recursiveGetChildById('newValue')
	faithPlusButton = faithButton:recursiveGetChildById('plusbutton')
	faithMinusButton = faithButton:recursiveGetChildById('minusbutton')

	enduranceButton = skillsWindow:recursiveGetChildById('skillId6')
	enduranceValueLabel = enduranceButton:recursiveGetChildById('value')
	newEnduranceArrowLabel = enduranceButton:recursiveGetChildById('arrow')
	newEnduranceValueLabel = enduranceButton:recursiveGetChildById('newValue')
	endurancePlusButton = enduranceButton:recursiveGetChildById('plusbutton')
	enduranceMinusButton = enduranceButton:recursiveGetChildById('minusbutton')
	
	criticalChanceButton = skillsWindow:recursiveGetChildById('skillId7')
	criticalChanceValueLabel = criticalChanceButton:recursiveGetChildById('value')
	
	criticalDamageButton = skillsWindow:recursiveGetChildById('skillId8')
	criticalDamageValueLabel = criticalDamageButton:recursiveGetChildById('value')
	
	g_keyboard.bindKeyDown('Ctrl+S', toggle)
			
	skillsButton:setOn(true)
	skillsWindow:setup()
	
	connect(LocalPlayer, {
		onExperienceChange = onExperienceChange,
		onLevelChange = onLevelChange,
		onHealthChange = onHealthChange,
		onManaChange = onManaChange,
		onSoulChange = onSoulChange,
		onSkillPointsChange = onSkillPointsChange,
		onFreeCapacityChange = onFreeCapacityChange,
		onTotalCapacityChange = onTotalCapacityChange,
		onSpeedChange = onSpeedChange,
		onBaseSpeedChange = onBaseSpeedChange,
		onAttackSpeedChange = onAttackSpeedChange,
		onStaminaChange = onStaminaChange,
		onRegenerationChange = onRegenerationChange,
		onBaseMagicLevelChange = onBaseMagicLevelChange,
		onMagicLevelChange = onMagicLevelChange,
		onNewBaseMagicLevelChange = onNewBaseMagicLevelChange,
		onBaseSkillChange = onBaseSkillChange,
		onSkillChange = onSkillChange,
		onNewBaseSkillChange = onNewBaseSkillChange,
	})
	
	connect(g_game, {
		onGameEnd = offline
	})
end

function terminate()

	disconnect(LocalPlayer, {
		onExperienceChange = onExperienceChange,
		onLevelChange = onLevelChange,
		onHealthChange = onHealthChange,
		onManaChange = onManaChange,
		onSoulChange = onSoulChange,
		onSkillPointsChange = onSkillPointsChange,
		onFreeCapacityChange = onFreeCapacityChange,
		onTotalCapacityChange = onTotalCapacityChange,
		onSpeedChange = onSpeedChange,
		onBaseSpeedChange = onBaseSpeedChange,
		onAttackSpeedChange = onAttackSpeedChange,
		onStaminaChange = onStaminaChange,
		onRegenerationChange = onRegenerationChange,
		onBaseMagicLevelChange = onBaseMagicLevelChange,
		onMagicLevelChange = onMagicLevelChange,
		onNewBaseMagicLevelChange = onNewBaseMagicLevelChange,
		onBaseSkillChange = onBaseSkillChange,
		onSkillChange = onSkillChange,
		onNewBaseSkillChange = onNewBaseSkillChange,
	})
	
	disconnect(g_game, {
		onGameStart = resetChanges,
		onGameEnd = offline
	})

	g_keyboard.unbindKeyDown('Ctrl+S')
	
	healthButton:destroy()
	healthValueLabel = nil
	newHealthArrowLabel = nil
	newHealthValueLabel = nil

	manaButton:destroy()
	manaValueLabel = nil
	newManaArrowLabel = nil
	newManaValueLabel = nil

	skillPointsButton:destroy()
	skillPointsValueLabel = nil
	newSkillPointsArrowLabel = nil
	newSkillPointsValueLabel = nil

	capacityButton:destroy()
	capacityValueLabel = nil
	newCapacityArrowLabel = nil
	newCapacityValueLabel = nil

	walkSpeedButton:destroy()
	walkSpeedValueLabel = nil
	newWalkSpeedArrowLabel = nil
	newWalkSpeedValueLabel = nil

	attackSpeedButton:destroy()
	attackSpeedValueLabel = nil
	newAttackSpeedArrowLabel = nil
	newAttackSpeedValueLabel = nil

	magicButton:destroy()
	magicValueLabel = nil
	newMagicArrowLabel = nil
	newMagicValueLabel = nil


	vitalityButton:destroy()
	newVitalityArrowLabel = nil
	newVitalityValueLabel = nil


	strenghtButton:destroy()
	strenghtValueLabel = nil
	newStrenghtArrowLabel = nil
	newStrenghtValueLabel = nil

	defenceButton:destroy()
	defenceValueLabel = nil
	newDefenceArrowLabel = nil
	newDefenceValueLabel = nil
	
	dexterityButton:destroy()
	dexterityValueLabel = nil
	newDexterityArrowLabel = nil
	newDexterityValueLabel = nil

	intelligenceButton:destroy()
	intelligenceValueLabel = nil
	newIntelligenceArrowLabel = nil
	newIntelligenceValueLabel = nil

	faithButton:destroy()
	faithValueLabel = nil
	newFaithArrowLabel = nil
	newFaithValueLabel = nil

	enduranceButton:destroy()
	enduranceValueLabel = nil
	newEnduranceArrowLabel = nil
	newEnduranceValueLabel = nil
	
	criticalChanceButton:destroy()
	criticalChanceValueLabel = nil
	
	criticalDamageButton:destroy()
	criticalDamageValueLabel = nil

	player = nil

	pointsUsed = nil
	newMagic = nil
	newVitality = nil
	newStrenght = nil
	newDefence = nil
	newDexterity = nil
	newIntelligence = nil
	newFaith = nil
	newEndurance = nil

	applyButton:destroy()
	skillsWindow:destroy()
	skillsButton:destroy()
end

function setSkillsTooltips()
	
	local skillMagic = skillsWindow:recursiveGetChildById('magiclevel')
	skillMagic:setTooltip('+ spell damage\n+ rune damage\n+ 15 mana       ')

	local skillVitality = skillsWindow:recursiveGetChildById('skillId0')
	skillVitality:setTooltip('+ 15 health')

	local skillStrenght = skillsWindow:recursiveGetChildById('skillId1')
	skillStrenght:setTooltip('+ melee damage   \n+ distance damage\n+ 5 capacity         ')

	local skillFaith = skillsWindow:recursiveGetChildById('skillId2')
	skillFaith:setTooltip('+ 2% of maximum damage for rod\n+ support spells                             \n+ healing spells                              \n+ 10 mana                                     ')

	local skillIntelligence = skillsWindow:recursiveGetChildById('skillId3')
	skillIntelligence:setTooltip('+ 1% of maximum damage for wand\n+ attack spells                                 \n+ 10 mana                                       ')

	local skillDexterity = skillsWindow:recursiveGetChildById('skillId4')
	skillDexterity:setTooltip('+ distance damage     \n+ 0.25 walk speed      \n+ 0.25% attack speed')

	local skillResistance = skillsWindow:recursiveGetChildById('skillId5')
	skillResistance:setTooltip('+ resistance to physical damage\n+ 5 health                                ')

	local skillEndurance = skillsWindow:recursiveGetChildById('skillId6')
	skillEndurance:setTooltip('+ 15 capacity\n+ 5 health     ')
	
end

function onClickApply()

	if not player then 
		player = g_game.getLocalPlayer()
		resetChanges()
	end
	
	if not player then
		print('[onClickApply] player == nil') 
		return 
	end

	if newMagic == -1 then newMagic = player:getBaseMagicLevel() end
	if newVitality == -1 then newVitality = player:getBaseSkillLevel(Skill.Fist) end
	if newStrenght == -1 then newStrenght = player:getBaseSkillLevel(Skill.Club) end
	if newDefence == -1 then newDefence = player:getBaseSkillLevel(Skill.Shielding) end
	if newDexterity == -1 then newDexterity = player:getBaseSkillLevel(Skill.Distance) end
	if newIntelligence == -1 then newIntelligence = player:getBaseSkillLevel(Skill.Axe) end
	if newFaith == -1 then newFaith = player:getBaseSkillLevel(Skill.Sword) end
	if newEndurance == -1 then newEndurance = player:getBaseSkillLevel(Skill.Fishing) end
	
	--[[print('\nNew magic: ' .. newMagic)
	print('New vitality: ' .. newVitality)
	print('New strenght: ' .. newStrenght)
	print('New defence: ' .. newDefence)
	print('New dexterity: ' .. newDexterity)
	print('New intelligence: ' .. newIntelligence)
	print('New faith: ' .. newFaith)
	print('New endurance: ' .. newEndurance .. '\n')]]
	
	g_game.applyNewSkills(newMagic, newVitality, newStrenght, newDefence, newDexterity, newIntelligence, newFaith, newEndurance)
	
	magicMinusButton:setVisible(false)
	vitalityMinusButton:setVisible(false)
	strenghtMinusButton:setVisible(false)
	defenceMinusButton:setVisible(false)
	dexterityMinusButton:setVisible(false)
	intelligenceMinusButton:setVisible(false)
	faithMinusButton:setVisible(false)
	enduranceMinusButton:setVisible(false)
	
	setExtraLabelsInvisible()
end

function onClickAdd(id)

	if not player then 
		player = g_game.getLocalPlayer()
		resetChanges()
	end
	
	if not player then
		print('[onClickAdd] player == nil') 
		return 
	end
			
	if id == 'magiclevel' then
		if newSkillPoints - 3 >= 0 then
		
			print('[+] magic')
		
			applyButton:setVisible(true)
			
			if newSkillPoints == -1 or newSkillPoints == nil then newSkillPoints = player:getSkillPoints() end
			
			newSkillPoints = newSkillPoints - 3
			newSkillPointsArrowLabel:setVisible(true)
			newSkillPointsValueLabel:setText(newSkillPoints)
			newSkillPointsValueLabel:setWidth(newSkillPointsValueLabel:getTextSize().width)
			newSkillPointsValueLabel:setVisible(true)

			if newMagic == -1 or newMagic == nil then newMagic = player:getBaseMagicLevel() end

			newMagic = newMagic + 1
			newMagicArrowLabel:setVisible(true)
			newMagicValueLabel:setText(newMagic)
			newMagicValueLabel:setWidth(newMagicValueLabel:getTextSize().width)
			newMagicValueLabel:setVisible(true)
			magicMinusButton:setVisible(true)
			
			local initialMana = 10
			local levelsMana = 5 * (player:getLevel() - 1)
			local magicMana = 15 * math.max(newMagic, player:getBaseMagicLevel())
			local intelligenceMana = 10 * (math.max(newIntelligence, player:getBaseSkillLevel(Skill.Axe)) - 8)
			local faithMana = 10 * (math.max(newFaith, player:getBaseSkillLevel(Skill.Sword)) - 8)
			
			local newMaxMana = initialMana + levelsMana + magicMana + intelligenceMana + faithMana
			newManaArrowLabel:setVisible(true)
			newManaValueLabel:setText(newMaxMana)
			newManaValueLabel:setWidth(newManaValueLabel:getTextSize().width)
			newManaValueLabel:setVisible(true)

		end
	else
		if newSkillPoints - 1 >= 0 then
		
			applyButton:setVisible(true)
				
			newSkillPoints = newSkillPoints - 1
			newSkillPointsArrowLabel:setVisible(true)
			newSkillPointsValueLabel:setText(newSkillPoints)
			newSkillPointsValueLabel:setWidth(newSkillPointsValueLabel:getTextSize().width)
			newSkillPointsValueLabel:setVisible(true)
		
			if id == 'skillId0' then
			
				print('[+] vitality')
			
				if newVitality < 8 or newVitality == nil then newVitality = player:getBaseSkillLevel(Skill.Fist) end
				
				newVitality = newVitality + 1
				newVitalityArrowLabel:setVisible(true)
				newVitalityValueLabel:setText(newVitality)
				newVitalityValueLabel:setWidth(newVitalityValueLabel:getTextSize().width)
				newVitalityValueLabel:setVisible(true)
				vitalityMinusButton:setVisible(true)
				
				local initialHealth = 120
				local levelsHealth = 5 * (player:getLevel() - 1)
				local vitalityHealth = 15 * (math.max(newVitality, player:getBaseSkillLevel(Skill.Fist)) - 8)
				local defenceHealth = 5 * (math.max(newDefence, player:getBaseSkillLevel(Skill.Shielding)) - 8)
				local enduranceHealth = 5 * (math.max(newEndurance, player:getBaseSkillLevel(Skill.Fishing)) - 8)
				
				local newMaxHealth = initialHealth + levelsHealth + vitalityHealth + defenceHealth + enduranceHealth
				newHealthArrowLabel:setVisible(true)
				newHealthValueLabel:setText(newMaxHealth)
				newHealthValueLabel:setWidth(newHealthValueLabel:getTextSize().width)
				newHealthValueLabel:setVisible(true)
						
			elseif id == 'skillId1' then
			
				print('[+] strenght')
			
				if newStrenght < 8 or newStrenght == nil then newStrenght = player:getBaseSkillLevel(Skill.Club) end
				
				newStrenght = newStrenght + 1
				newStrenghtArrowLabel:setVisible(true)
				newStrenghtValueLabel:setText(newStrenght)
				newStrenghtValueLabel:setWidth(newStrenghtValueLabel:getTextSize().width)
				newStrenghtValueLabel:setVisible(true)
				strenghtMinusButton:setVisible(true)
				
				local initialCapacity = 36500
				local levelsCapacity = 500 * (player:getLevel() - 1)
				local strenghtCapacity= 500 * (math.max(newStrenght, player:getBaseSkillLevel(Skill.Club)) - 8)
				local enduranceCapacity = 1500 * (math.max(newEndurance, player:getBaseSkillLevel(Skill.Fishing)) - 8)
				
				local newMaxCapacity = initialCapacity + levelsCapacity + strenghtCapacity + enduranceCapacity
				newCapacityArrowLabel:setVisible(true)
				newCapacityValueLabel:setText(newMaxCapacity / 100.0)
				newCapacityValueLabel:setWidth(newCapacityValueLabel:getTextSize().width)
				newCapacityValueLabel:setVisible(true)
			
			elseif id == 'skillId2' then
			
				print('[+] faith')
			
				if newFaith < 8 or newFaith == nil then newFaith = player:getBaseSkillLevel(Skill.Sword) end
				
				newFaith = newFaith + 1
				newFaithArrowLabel:setVisible(true)
				newFaithValueLabel:setText(newFaith)
				newFaithValueLabel:setWidth(newFaithValueLabel:getTextSize().width)
				newFaithValueLabel:setVisible(true)
				faithMinusButton:setVisible(true)
				
				local initialMana = 10
				local levelsMana = 5 * (player:getLevel() - 1)
				local magicMana = 15 * math.max(newMagic, player:getBaseMagicLevel())
				local intelligenceMana = 10 * (math.max(newIntelligence, player:getBaseSkillLevel(Skill.Axe)) - 8)
				local faithMana = 10 * (math.max(newFaith, player:getBaseSkillLevel(Skill.Sword)) - 8)
				
				local newMaxMana = initialMana + levelsMana + magicMana + intelligenceMana + faithMana
				newManaArrowLabel:setVisible(true)
				newManaValueLabel:setText(newMaxMana)
				newManaValueLabel:setWidth(newManaValueLabel:getTextSize().width)
				newManaValueLabel:setVisible(true)
				
			elseif id == 'skillId3' then
			
				print('[+] intelligence')
			
				if newIntelligence < 8 or newIntelligence == nil then newIntelligence = player:getBaseSkillLevel(Skill.Axe) end
				
				newIntelligence = newIntelligence + 1
				newIntelligenceArrowLabel:setVisible(true)
				newIntelligenceValueLabel:setText(newIntelligence)
				newIntelligenceValueLabel:setWidth(newIntelligenceValueLabel:getTextSize().width)
				newIntelligenceValueLabel:setVisible(true)
				intelligenceMinusButton:setVisible(true)
				
				local initialMana = 10
				local levelsMana = 5 * (player:getLevel() - 1)
				local magicMana = 15 * math.max(newMagic, player:getBaseMagicLevel())
				local intelligenceMana = 10 * (math.max(newIntelligence, player:getBaseSkillLevel(Skill.Axe)) - 8)
				local faithMana = 10 * (math.max(newFaith, player:getBaseSkillLevel(Skill.Sword)) - 8)
				
				local newMaxMana = initialMana + levelsMana + magicMana + intelligenceMana + faithMana
				newManaArrowLabel:setVisible(true)
				newManaValueLabel:setText(newMaxMana)
				newManaValueLabel:setWidth(newManaValueLabel:getTextSize().width)
				newManaValueLabel:setVisible(true)
				
			elseif id == 'skillId4' then
			
				print('[+] dexterity')
			
				if newDexterity < 8 or newDexterity == nil then newDexterity = player:getBaseSkillLevel(Skill.Distance) end
				
				newDexterity = newDexterity + 1
				newDexterityArrowLabel:setVisible(true)
				newDexterityValueLabel:setText(newDexterity)
				newDexterityValueLabel:setWidth(newDexterityValueLabel:getTextSize().width)
				newDexterityValueLabel:setVisible(true)
				dexterityMinusButton:setVisible(true)
				
				local initialWalkSpeed = player:getBaseSpeed()
				local dexterityWalkSpeed = 0.25 * (math.max(newDexterity, player:getBaseSkillLevel(Skill.Distance)) - player:getBaseSkillLevel(Skill.Distance))
				
				local newWalkSpeed = initialWalkSpeed + dexterityWalkSpeed
				newWalkSpeedArrowLabel:setVisible(true)
				newWalkSpeedValueLabel:setText(newWalkSpeed)
				newWalkSpeedValueLabel:setWidth(newWalkSpeedValueLabel:getTextSize().width)
				newWalkSpeedValueLabel:setVisible(true)
				
				local initialAttackSpeed = player:getAttackSpeed()
				
				if initialAttackSpeed == 1000 then --isDualWielding
					initialAttackSpeed = 2020 - (player:getBaseSkillLevel(Skill.Distance) * 2.5)
				end
				
				local dexterityAttackSpeed = 0.25 * (math.max(newDexterity, player:getBaseSkillLevel(Skill.Distance)) - player:getBaseSkillLevel(Skill.Distance))
				
				local newAttackSpeed = initialAttackSpeed + dexterityAttackSpeed
				newAttackSpeedArrowLabel:setVisible(true)
				newAttackSpeedValueLabel:setText(newWalkSpeed)
				newAttackSpeedValueLabel:setWidth(newAttackSpeedValueLabel:getTextSize().width)
				newAttackSpeedValueLabel:setVisible(true)
				
			elseif id == 'skillId5' then
			
				print('[+] defence')
			
				if newDefence < 8 or newDefence == nil then newDefence = player:getBaseSkillLevel(Skill.Shielding) end
				
				newDefence = newDefence + 1
				newDefenceArrowLabel:setVisible(true)
				newDefenceValueLabel:setText(newDefence)
				newDefenceValueLabel:setWidth(newDefenceValueLabel:getTextSize().width)
				newDefenceValueLabel:setVisible(true)
				defenceMinusButton:setVisible(true)
				
				local initialHealth = 120
				local levelsHealth = 5 * (player:getLevel() - 1)
				local vitalityHealth = 15 * (math.max(newVitality, player:getBaseSkillLevel(Skill.Fist)) - 8)
				local defenceHealth = 5 * (math.max(newDefence, player:getBaseSkillLevel(Skill.Shielding)) - 8)
				local enduranceHealth = 5 * (math.max(newEndurance, player:getBaseSkillLevel(Skill.Fishing)) - 8)
				
				local newMaxHealth = initialHealth + levelsHealth + vitalityHealth + defenceHealth + enduranceHealth
				newHealthArrowLabel:setVisible(true)
				newHealthValueLabel:setText(newMaxHealth)
				newHealthValueLabel:setWidth(newHealthValueLabel:getTextSize().width)
				newHealthValueLabel:setVisible(true)
				
			elseif id == 'skillId6' then
			
				print('[+] endurance')
			
				if newEndurance < 8 or newEndurance == nil then newEndurance = player:getBaseSkillLevel(Skill.Fishing) end
				
				newEndurance = newEndurance + 1
				newEnduranceArrowLabel:setVisible(true)
				newEnduranceValueLabel:setText(newEndurance)
				newEnduranceValueLabel:setWidth(newEnduranceValueLabel:getTextSize().width)
				newEnduranceValueLabel:setVisible(true)
				enduranceMinusButton:setVisible(true)
				
				local initialHealth = 120
				local levelsHealth = 5 * (player:getLevel() - 1)
				local vitalityHealth = 15 * (math.max(newVitality, player:getBaseSkillLevel(Skill.Fist)) - 8)
				local defenceHealth = 5 * (math.max(newDefence, player:getBaseSkillLevel(Skill.Shielding)) - 8)
				local enduranceHealth = 5 * (math.max(newEndurance, player:getBaseSkillLevel(Skill.Fishing)) - 8)
				
				local newMaxHealth = initialHealth + levelsHealth + vitalityHealth + defenceHealth + enduranceHealth
				newHealthArrowLabel:setVisible(true)
				newHealthValueLabel:setText(newMaxHealth)
				newHealthValueLabel:setWidth(newHealthValueLabel:getTextSize().width)
				newHealthValueLabel:setVisible(true)
				
				local initialCapacity = 36500
				local levelsCapacity = 500 * (player:getLevel() - 1)
				local strenghtCapacity = 500 * (math.max(newStrenght, player:getBaseSkillLevel(Skill.Club)) - 8)
				local enduranceCapacity = 1500 * (math.max(newEndurance, player:getBaseSkillLevel(Skill.Fishing)) - 8)
				
				local newMaxCapacity = initialCapacity + levelsCapacity + strenghtCapacity + enduranceCapacity
				newCapacityArrowLabel:setVisible(true)
				newCapacityValueLabel:setText(newMaxCapacity / 100.0)
				newCapacityValueLabel:setWidth(newCapacityValueLabel:getTextSize().width)
				newCapacityValueLabel:setVisible(true)
			end			
		end		
	end
end

function onClickRemove(id)

	if not player then 
		player = g_game.getLocalPlayer()
		resetChanges()
	end
	
	if not player then
		print('[onClickRemove] player == nil') 
		return 
	end
			
	if id == 'magiclevel' then
		
		print('[-] magic')
		
		newSkillPoints = newSkillPoints + 3
		
		if newSkillPoints >= player:getSkillPoints() then
			applyButton:setVisible(false)
			newSkillPointsArrowLabel:setVisible(false)
			newSkillPointsValueLabel:setText(newSkillPoints)
			newSkillPointsValueLabel:setWidth(newSkillPointsValueLabel:getTextSize().width)
			newSkillPointsValueLabel:setVisible(false)
		end

		newMagic = newMagic - 1
		
		if newMagic <= player:getBaseMagicLevel() then
			newMagicArrowLabel:setVisible(false)
			newMagicValueLabel:setText(newMagic)
			newMagicValueLabel:setWidth(newMagicValueLabel:getTextSize().width)
			newMagicValueLabel:setVisible(false)
			magicMinusButton:setVisible(false)
		end
		
		local initialMana = 10
		local levelsMana = 5 * (player:getLevel() - 1)
		local magicMana = 15 * math.max(newMagic, player:getBaseMagicLevel())
		local intelligenceMana = 10 * (math.max(newIntelligence, player:getBaseSkillLevel(Skill.Axe)) - 8)
		local faithMana = 10 * (math.max(newFaith, player:getBaseSkillLevel(Skill.Sword)) - 8)
		
		local newMaxMana = initialMana + levelsMana + magicMana + intelligenceMana + faithMana
		
		if newMaxMana <= player:getMaxMana() then
			newManaArrowLabel:setVisible(false)
			newManaValueLabel:setText(newMaxMana)
			newManaValueLabel:setWidth(newManaValueLabel:getTextSize().width)
			newManaValueLabel:setVisible(false)
		end

	else
	
		newSkillPoints = newSkillPoints + 1
		
		if newSkillPoints >= player:getSkillPoints() then
			applyButton:setVisible(false)
			newSkillPointsArrowLabel:setVisible(false)
			newSkillPointsValueLabel:setVisible(false)
		end
		
		newSkillPointsValueLabel:setText(newSkillPoints)
		newSkillPointsValueLabel:setWidth(newSkillPointsValueLabel:getTextSize().width)
						
		if id == 'skillId0' then
		
			print('[-] vitality')
					
			newVitality = newVitality - 1
			
			if newVitality <= player:getBaseSkillLevel(Skill.Fist) then
				newVitalityArrowLabel:setVisible(false)
				newVitalityValueLabel:setVisible(false)
				vitalityMinusButton:setVisible(false)
			end
			
			newVitalityValueLabel:setText(newVitality)
			newVitalityValueLabel:setWidth(newVitalityValueLabel:getTextSize().width)
			
			local initialHealth = 120
			local levelsHealth = 5 * (player:getLevel() - 1)
			local vitalityHealth = 15 * (math.max(newVitality, player:getBaseSkillLevel(Skill.Fist)) - 8)
			local defenceHealth = 5 * (math.max(newDefence, player:getBaseSkillLevel(Skill.Shielding)) - 8)
			local enduranceHealth = 5 * (math.max(newEndurance, player:getBaseSkillLevel(Skill.Fishing)) - 8)
			
			local newMaxHealth = initialHealth + levelsHealth + vitalityHealth + defenceHealth + enduranceHealth
			
			if newMaxHealth <= player:getMaxHealth() then
				newHealthArrowLabel:setVisible(false)
				newHealthValueLabel:setVisible(false)
			end
			
			newHealthValueLabel:setText(newMaxHealth)
			newHealthValueLabel:setWidth(newHealthValueLabel:getTextSize().width)
					
		elseif id == 'skillId1' then
		
			print('[-] strenght')
				
			newStrenght = newStrenght - 1
			
			if newStrenght <= player:getBaseSkillLevel(Skill.Club) then
				newStrenghtArrowLabel:setVisible(false)
				newStrenghtValueLabel:setVisible(false)
				strenghtMinusButton:setVisible(false)
			end
			
			newStrenghtValueLabel:setText(newStrenght)
			newStrenghtValueLabel:setWidth(newStrenghtValueLabel:getTextSize().width)
			
			local initialCapacity = 36500
			local levelsCapacity = 500 * (player:getLevel() - 1)
			local strenghtCapacity= 500 * (math.max(newStrenght, player:getBaseSkillLevel(Skill.Club)) - 8)
			local enduranceCapacity = 1500 * (math.max(newEndurance, player:getBaseSkillLevel(Skill.Fishing)) - 8)
			
			local newMaxCapacity = initialCapacity + levelsCapacity + strenghtCapacity + enduranceCapacity
						
			if newMaxCapacity <= player:getTotalCapacity() * 100 then
				newCapacityArrowLabel:setVisible(false)
				newCapacityValueLabel:setVisible(false)
			end
			
			newCapacityValueLabel:setText(newMaxCapacity / 100.0)
			newCapacityValueLabel:setWidth(newCapacityValueLabel:getTextSize().width)
		
		elseif id == 'skillId2' then
		
			print('[-] faith')
					
			newFaith = newFaith - 1
			
			if newFaith <= player:getBaseSkillLevel(Skill.Sword) then
				newFaithArrowLabel:setVisible(false)
				newFaithValueLabel:setVisible(false)
				faithMinusButton:setVisible(false)
			end
			
			newFaithValueLabel:setText(newFaith)
			newFaithValueLabel:setWidth(newFaithValueLabel:getTextSize().width)
			
			local initialMana = 10
			local levelsMana = 5 * (player:getLevel() - 1)
			local magicMana = 15 * math.max(newMagic, player:getBaseMagicLevel())
			local intelligenceMana = 10 * (math.max(newIntelligence, player:getBaseSkillLevel(Skill.Axe)) - 8)
			local faithMana = 10 * (math.max(newFaith, player:getBaseSkillLevel(Skill.Sword)) - 8)
			
			local newMaxMana = initialMana + levelsMana + magicMana + intelligenceMana + faithMana
			
			if newMaxMana <= player:getMaxMana() then
				newManaArrowLabel:setVisible(false)
				newManaValueLabel:setVisible(false)
			end
			
			newManaValueLabel:setText(newMaxMana)
			newManaValueLabel:setWidth(newManaValueLabel:getTextSize().width)
			
		elseif id == 'skillId3' then
		
			print('[-] intelligence')
					
			newIntelligence = newIntelligence - 1
			
			if newIntelligence <= player:getBaseSkillLevel(Skill.Axe) then
				newIntelligenceArrowLabel:setVisible(false)
				newIntelligenceValueLabel:setVisible(false)
				intelligenceMinusButton:setVisible(false)
			end
			
			newIntelligenceValueLabel:setText(newIntelligence)
			newIntelligenceValueLabel:setWidth(newIntelligenceValueLabel:getTextSize().width)
			
			local initialMana = 10
			local levelsMana = 5 * (player:getLevel() - 1)
			local magicMana = 15 * math.max(newMagic, player:getBaseMagicLevel())
			local intelligenceMana = 10 * (math.max(newIntelligence, player:getBaseSkillLevel(Skill.Axe)) - 8)
			local faithMana = 10 * (math.max(newFaith, player:getBaseSkillLevel(Skill.Sword)) - 8)
			
			local newMaxMana = initialMana + levelsMana + magicMana + intelligenceMana + faithMana
			
			if newMaxMana <= player:getMaxMana() then
				newManaArrowLabel:setVisible(false)
				newManaValueLabel:setVisible(false)
			end
			
			newManaValueLabel:setText(newMaxMana)
			newManaValueLabel:setWidth(newManaValueLabel:getTextSize().width)
			
		elseif id == 'skillId4' then
		
			print('[-] dexterity')
					
			newDexterity = newDexterity - 1
			
			if newDexterity <= player:getBaseSkillLevel(Skill.Distance) then
				newDexterityArrowLabel:setVisible(false)
				newDexterityValueLabel:setVisible(false)
				dexterityMinusButton:setVisible(false)
			end
			
			newDexterityValueLabel:setText(newDexterity)
			newDexterityValueLabel:setWidth(newDexterityValueLabel:getTextSize().width)
			
			local initialWalkSpeed = player:getBaseSpeed()
			local dexterityWalkSpeed = 0.25 * (math.max(newDexterity, player:getBaseSkillLevel(Skill.Distance)) - player:getBaseSkillLevel(Skill.Distance))
			
			local newWalkSpeed = initialWalkSpeed + dexterityWalkSpeed
			
			if newWalkSpeed <= player:getBaseSpeed() then
				newWalkSpeedArrowLabel:setVisible(trfalseue)
				newWalkSpeedValueLabel:setVisible(false)
			end
			
			newWalkSpeedValueLabel:setText(newWalkSpeed)
			newWalkSpeedValueLabel:setWidth(newWalkSpeedValueLabel:getTextSize().width)
		
			local initialAttackSpeed = player:getAttackSpeed()
				
			if initialAttackSpeed == 1000 then --isDualWielding
				initialAttackSpeed = 2020 - (player:getBaseSkillLevel(Skill.Distance) * 2.5)
			end
			
			local dexterityAttackSpeed = 0.25 * (math.max(newDexterity, player:getBaseSkillLevel(Skill.Distance)) - player:getBaseSkillLevel(Skill.Distance))
			
			local newAttackSpeed = initialAttackSpeed + dexterityAttackSpeed
			
			if newWalkSpeed <= player:getBaseSpeed() then
				newAttackSpeedArrowLabel:setVisible(false)
				newAttackSpeedValueLabel:setVisible(false)
			end
			
			newAttackSpeedValueLabel:setText(newWalkSpeed)
			newAttackSpeedValueLabel:setWidth(newAttackSpeedValueLabel:getTextSize().width)
			
		elseif id == 'skillId5' then
		
			print('[-] defence')
				
			newDefence = newDefence - 1
			
			if newDefence <= player:getBaseSkillLevel(Skill.Shielding) then
				newDefenceArrowLabel:setVisible(false)
				newDefenceValueLabel:setVisible(false)
				defenceMinusButton:setVisible(false)
			end
			
			newDefenceValueLabel:setText(newDefence)
			newDefenceValueLabel:setWidth(newDefenceValueLabel:getTextSize().width)
			
			local initialHealth = 120
			local levelsHealth = 5 * (player:getLevel() - 1)
			local vitalityHealth = 15 * (math.max(newVitality, player:getBaseSkillLevel(Skill.Fist)) - 8)
			local defenceHealth = 5 * (math.max(newDefence, player:getBaseSkillLevel(Skill.Shielding)) - 8)
			local enduranceHealth = 5 * (math.max(newEndurance, player:getBaseSkillLevel(Skill.Fishing)) - 8)
			
			local newMaxHealth = initialHealth + levelsHealth + vitalityHealth + defenceHealth + enduranceHealth
			
			if newMaxHealth <= player:getMaxHealth() then
				newHealthArrowLabel:setVisible(false)
				newHealthValueLabel:setVisible(false)
			end
			
			newHealthValueLabel:setText(newMaxHealth)
			newHealthValueLabel:setWidth(newHealthValueLabel:getTextSize().width)
			
		elseif id == 'skillId6' then
		
			print('[-] endurance')
				
			newEndurance = newEndurance - 1
			
			if newEndurance <= player:getBaseSkillLevel(Skill.Fishing) then
				newEnduranceArrowLabel:setVisible(false)
				newEnduranceValueLabel:setVisible(false)
				enduranceMinusButton:setVisible(false)
			end
			
			newEnduranceValueLabel:setText(newEndurance)
			newEnduranceValueLabel:setWidth(newEnduranceValueLabel:getTextSize().width)
			
			local initialHealth = 120
			local levelsHealth = 5 * (player:getLevel() - 1)
			local vitalityHealth = 15 * (math.max(newVitality, player:getBaseSkillLevel(Skill.Fist)) - 8)
			local defenceHealth = 5 * (math.max(newDefence, player:getBaseSkillLevel(Skill.Shielding)) - 8)
			local enduranceHealth = 5 * (math.max(newEndurance, player:getBaseSkillLevel(Skill.Fishing)) - 8)
			
			local newMaxHealth = initialHealth + levelsHealth + vitalityHealth + defenceHealth + enduranceHealth
			
			if newMaxHealth <= player:getMaxHealth() then
				newHealthArrowLabel:setVisible(false)
				newHealthValueLabel:setVisible(false)
			end
			newHealthValueLabel:setText(newMaxHealth)
			newHealthValueLabel:setWidth(newHealthValueLabel:getTextSize().width)
			
			local initialCapacity = 36500
			local levelsCapacity = 500 * (player:getLevel() - 1)
			local strenghtCapacity = 500 * (math.max(newStrenght, player:getBaseSkillLevel(Skill.Club)) - 8)
			local enduranceCapacity = 500 * (math.max(newEndurance, player:getBaseSkillLevel(Skill.Fishing)) - 8)
			
			local newMaxCapacity = initialCapacity + levelsCapacity + strenghtCapacity + enduranceCapacity
			
			if newMaxCapacity <= player:getTotalCapacity() * 100 then
				newCapacityArrowLabel:setVisible(false)
				newCapacityValueLabel:setVisible(false)
			end
			newCapacityValueLabel:setText(newMaxCapacity / 100.0)
			newCapacityValueLabel:setWidth(newCapacityValueLabel:getTextSize().width)
		end			
	end
end

function expForLevel(level)
  return math.floor((50*level*level*level)/3 - 100*level*level + (850*level)/3 - 200)
end

function expToAdvance(currentLevel, currentExp)
  return expForLevel(currentLevel+1) - currentExp
end

function resetSkillColor(id)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setColor('#bbbbbb')
end

function toggleSkill(id, state)
  local skill = skillsWindow:recursiveGetChildById(id)
  skill:setVisible(state)
end

function setSkillBase(id, value, baseValue)
	if baseValue <= 0 or value < 0 then
		return
	end
	local skill = skillsWindow:recursiveGetChildById(id)
	local widget = skill:getChildById('value')

	if value > baseValue then
		widget:setColor('#008b00') -- green
		skill:setTooltip(baseValue .. ' +' .. (value - baseValue))
	elseif value < baseValue then
		widget:setColor('#b22222') -- red
		skill:setTooltip(baseValue .. ' ' .. (value - baseValue))
	else
		widget:setColor('#bbbbbb') -- default
		skill:removeTooltip()
	end
end

function setSkillValue(id, value)
	
	--if not skillWindow then return end

	local skill = skillsWindow:recursiveGetChildById(id)
	local widget = skill:getChildById('value')
	widget:setText(value)
	widget:setWidth(widget:getTextSize().width)
end

function setSkillNewValue(id, newValue, currentValue)

	local skill = skillsWindow:recursiveGetChildById(id)
	local widgetArrow = skill:getChildById('arrow')
	local widgetNewValue = skill:getChildById('newValue')
	widgetNewValue:setText(newValue)
	widgetNewValue:setWidth(widgetNewValue:getTextSize().width)
		
	if newValue <= currentValue or currentValue < 0 then
		widgetArrow:setVisible(false)
		widgetNewValue:setVisible(false)
	else
		widgetArrow:setVisible(true)
		widgetNewValue:setVisible(true)
	end
end

function setSkillColor(id, value)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setColor(value)
end

function setSkillTooltip(id, value)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setTooltip(value)
end

function setSkillPercent(id, percent, tooltip, color)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('percent')
  if widget then
    widget:setPercent(math.floor(percent))

    if tooltip then
      widget:setTooltip(tooltip)
    end

    if color then
    	widget:setBackgroundColor(color)
    end
  end
end

function checkAlert(id, value, maxValue, threshold, greaterThan)
  if greaterThan == nil then greaterThan = false end
  local alert = false

  -- maxValue can be set to false to check value and threshold
  -- used for regeneration checking
  if type(maxValue) == 'boolean' then
    if maxValue then
      return
    end

    if greaterThan then
      if value > threshold then
        alert = true
      end
    else
      if value < threshold then
        alert = true
      end
    end
  elseif type(maxValue) == 'number' then
    if maxValue < 0 then
      return
    end

    local percent = math.floor((value / maxValue) * 100)
    if greaterThan then
      if percent > threshold then
        alert = true
      end
    else
      if percent < threshold then
        alert = true
      end
    end
  end

  if alert then
    setSkillColor(id, '#b22222') -- red
  else
    resetSkillColor(id)
  end
end

function refresh()

	local player = g_game.getLocalPlayer()
	if not player then return end
	
	resetChanges()
	
	onExperienceChange(player, player:getExperience())
	onLevelChange(player, player:getLevel(), player:getLevelPercent())
	onHealthChange(player, player:getHealth(), player:getMaxHealth())
	onManaChange(player, player:getMana(), player:getMaxMana())
	onSoulChange(player, player:getSoul())
	onSkillPointsChange(player, player:getSkillPoints())
	onFreeCapacityChange(player, player:getFreeCapacity())
	onStaminaChange(player, player:getStamina())
	onMagicLevelChange(player, player:getMagicLevel())
	onBaseMagicLevelChange(player, player:getBaseMagicLevel())
	onNewBaseMagicLevelChange(player, player:getNewBaseMagicLevel())
	onRegenerationChange(player, player:getRegenerationTime())
	onSpeedChange(player, player:getSpeed())
	onAttackSpeedChange(player, player:getAttackSpeed())


	if expSpeedEvent then 
		expSpeedEvent:cancel() 
	end
	
	expSpeedEvent = cycleEvent(checkExpSpeed, 30*1000)
	
	local hasAdditionalSkills = g_game.getFeature(GameAdditionalSkills)
	
	for i = Skill.Fist, Skill.CriticalDamage do
	
		onSkillChange(player, i, player:getSkillLevel(i))
		onBaseSkillChange(player, i, player:getBaseSkillLevel(i))

		if i > Skill.Fishing then
			toggleSkill('skillId'.. i, hasAdditionalSkills)
		end
	end
	
	for i = Skill.Fist, Skill.Fishing do
		onNewBaseSkillChange(player, i, player:getNewBaseSkillLevel(i))
	end

	skillsWindow:setContentMinimumHeight(46)
	skillsWindow:setContentMaximumHeight(374)
		
end

function offline()
  if expSpeedEvent then expSpeedEvent:cancel() expSpeedEvent = nil end
end

function toggle()
  if skillsButton:isOn() then
    skillsWindow:close()
    skillsButton:setOn(false)
  else
    skillsWindow:open()
    skillsButton:setOn(true)
  end
end

function checkExpSpeed()
  local player = g_game.getLocalPlayer()
  if not player then return end

  local currentExp = player:getExperience()
  local currentTime = g_clock.seconds()
  if player.lastExps ~= nil then
    player.expSpeed = (currentExp - player.lastExps[1][1])/(currentTime - player.lastExps[1][2])
    onLevelChange(player, player:getLevel(), player:getLevelPercent())
  else
    player.lastExps = {}
  end
  table.insert(player.lastExps, {currentExp, currentTime})
  if #player.lastExps > 30 then
    table.remove(player.lastExps, 1)
  end
end

function setExtraLabelsInvisible()

	applyButton:setVisible(false)
	
	newHealthArrowLabel:setVisible(false)
	newHealthValueLabel:setText('')
	newHealthValueLabel:setWidth(newHealthValueLabel:getTextSize().width)
	newHealthValueLabel:setVisible(false)
	
	newManaArrowLabel:setVisible(false)
	newManaValueLabel:setText('')
	newManaValueLabel:setWidth(newManaValueLabel:getTextSize().width)
	newManaValueLabel:setVisible(false)
		
	newSkillPointsArrowLabel:setVisible(false)
	newSkillPointsValueLabel:setText('')
	newSkillPointsValueLabel:setWidth(newSkillPointsValueLabel:getTextSize().width)
	newSkillPointsValueLabel:setVisible(false)
	
	newCapacityArrowLabel:setVisible(false)
	newCapacityValueLabel:setText('')
	newCapacityValueLabel:setWidth(newCapacityValueLabel:getTextSize().width)
	newCapacityValueLabel:setVisible(false)
	
	newWalkSpeedArrowLabel:setVisible(false)
	newWalkSpeedValueLabel:setText('')
	newWalkSpeedValueLabel:setWidth(newWalkSpeedValueLabel:getTextSize().width)
	newWalkSpeedValueLabel:setVisible(false)
	
	newAttackSpeedArrowLabel:setVisible(false)
	newAttackSpeedValueLabel:setText('')
	newAttackSpeedValueLabel:setWidth(newAttackSpeedValueLabel:getTextSize().width)
	newAttackSpeedValueLabel:setVisible(false)
	
	newMagicArrowLabel:setVisible(false)
	newMagicValueLabel:setText('')
	newMagicValueLabel:setWidth(newMagicValueLabel:getTextSize().width)
	newMagicValueLabel:setVisible(false)
	magicPlusButton:setVisible(false)
	
	
	newVitalityArrowLabel:setVisible(false)
	newVitalityValueLabel:setText('')
	newVitalityValueLabel:setWidth(newVitalityValueLabel:getTextSize().width)
	newVitalityValueLabel:setVisible(false)
	vitalityPlusButton:setVisible(false)
	
	newStrenghtArrowLabel:setVisible(false)
	newStrenghtValueLabel:setText('')
	newStrenghtValueLabel:setWidth(newStrenghtValueLabel:getTextSize().width)
	newStrenghtValueLabel:setVisible(false)
	strenghtPlusButton:setVisible(false)
	
	newDefenceArrowLabel:setVisible(false)
	newDefenceValueLabel:setText('')
	newDefenceValueLabel:setWidth(newDefenceValueLabel:getTextSize().width)
	newDefenceValueLabel:setVisible(false)
	defencePlusButton:setVisible(false)
	
	newDexterityArrowLabel:setVisible(false)
	newDexterityValueLabel:setText('')
	newDexterityValueLabel:setWidth(newDexterityValueLabel:getTextSize().width)
	newDexterityValueLabel:setVisible(false)
	dexterityPlusButton:setVisible(false)
	
	newIntelligenceArrowLabel:setVisible(false)
	newIntelligenceValueLabel:setText('')
	newIntelligenceValueLabel:setWidth(newIntelligenceValueLabel:getTextSize().width)
	newIntelligenceValueLabel:setVisible(false)
	intelligencePlusButton:setVisible(false)
	
	newFaithArrowLabel:setVisible(false)
	newFaithValueLabel:setText('')
	newFaithValueLabel:setWidth(newFaithValueLabel:getTextSize().width)
	newFaithValueLabel:setVisible(false)
	faithPlusButton:setVisible(false)
	
	newEnduranceArrowLabel:setVisible(false)
	newEnduranceValueLabel:setText('')
	newEnduranceValueLabel:setWidth(newEnduranceValueLabel:getTextSize().width)
	newEnduranceValueLabel:setVisible(false)
	endurancePlusButton:setVisible(false)
end

function resetChanges()

	if not player then 
		player = g_game.getLocalPlayer()
	end
	
	if not player then
		print('[resetChanges] player == nil') 
		return 
	end

	newSkillPoints = player:getSkillPoints()
	newMagic = player:getBaseMagicLevel()
	newVitality = player:getBaseSkillLevel(Skill.Fist)
	newStrenght = player:getBaseSkillLevel(Skill.Club)
	newDefence = player:getBaseSkillLevel(Skill.Shielding)
	newDexterity = player:getBaseSkillLevel(Skill.Distance)
	newIntelligence = player:getBaseSkillLevel(Skill.Axe)
	newFaith = player:getBaseSkillLevel(Skill.Sword)
	newEndurance = player:getBaseSkillLevel(Skill.Fishing)

	newSkillPointsValueLabel:setText(newSkillPoints)
	magicValueLabel:setText(newMagic)
	vitalityValueLabel:setText(newVitality)
	strenghtValueLabel:setText(newStrenght)
	defenceValueLabel:setText(newDefence)
	dexterityValueLabel:setText(newDexterity)
	intelligenceValueLabel:setText(newIntelligence)
	faithValueLabel:setText(newFaith)
	enduranceValueLabel:setText(newEndurance)
	
	--[[print('\nNew magic: ' .. newMagic)
	print('New vitality: ' .. newVitality)
	print('New strenght: ' .. newStrenght)
	print('New defence: ' .. newDefence)
	print('New dexterity: ' .. newDexterity)
	print('New intelligence: ' .. newIntelligence)
	print('New faith: ' .. newFaith)
	print('New endurance: ' .. newEndurance .. '\n')]]
	
	setExtraLabelsInvisible()
	checkPlusAndMinusButtons(player, newSkillPoints)
	
end

function checkPlusAndMinusButtons(localPlayer, skillPoints)

	if skillPoints >= 3 then
		magicPlusButton:setVisible(true)
	else
		magicPlusButton:setVisible(false)
	end
		
	if skillPoints >= 1 then
		vitalityPlusButton:setVisible(true)
		strenghtPlusButton:setVisible(true)
		defencePlusButton:setVisible(true)
		dexterityPlusButton:setVisible(true)
		intelligencePlusButton:setVisible(true)
		faithPlusButton:setVisible(true)
		endurancePlusButton:setVisible(true)
	else
		vitalityPlusButton:setVisible(false)
		strenghtPlusButton:setVisible(false)
		defencePlusButton:setVisible(false)
		dexterityPlusButton:setVisible(false)
		intelligencePlusButton:setVisible(false)
		faithPlusButton:setVisible(false)
		endurancePlusButton:setVisible(false)
	end
			
	if newMagic > localPlayer:getBaseMagicLevel() then
		magicMinusButton:setVisible(true)
	else
		magicMinusButton:setVisible(false)
	end
	
	if newStrenght > localPlayer:getBaseSkillLevel(Skill.Club) then
		strenghtMinusButton:setVisible(true)
	else
		strenghtMinusButton:setVisible(false)
	end
		
	if newDefence > localPlayer:getBaseSkillLevel(Skill.Shielding) then
		defenceMinusButton:setVisible(true)
	else
		defenceMinusButton:setVisible(false)
	end

	if newDexterity > localPlayer:getBaseSkillLevel(Skill.Distance) then
		dexterityMinusButton:setVisible(true)
	else
		dexterityMinusButton:setVisible(false)
	end
		
	if newIntelligence > localPlayer:getBaseSkillLevel(Skill.Axe) then
		intelligenceMinusButton:setVisible(true)
	else
		intelligenceMinusButton:setVisible(false)
	end
			
	if newDefence > localPlayer:getBaseSkillLevel(Skill.Sword) then
		faithMinusButton:setVisible(true)
	else
		faithMinusButton:setVisible(false)
	end

	if newEndurance > localPlayer:getBaseSkillLevel(Skill.Fishing) then
		enduranceMinusButton:setVisible(true)
	else
		enduranceMinusButton:setVisible(false)
	end
	
end

function onMiniWindowClose()
	skillsButton:setOn(false)	
end

function onMiniWindowOpen()

	player = g_game.getLocalPlayer()
	
	resetChanges()

	skillsButton:setOn(true)
	
	magicMinusButton:setVisible(false)
	vitalityMinusButton:setVisible(false)
	strenghtMinusButton:setVisible(false)
	defenceMinusButton:setVisible(false)
	dexterityMinusButton:setVisible(false)
	intelligenceMinusButton:setVisible(false)
	faithMinusButton:setVisible(false)
	enduranceMinusButton:setVisible(false)
	
	
	
end

function onExperienceChange(localPlayer, value)
  setSkillValue('experience', value)
end

function onLevelChange(localPlayer, value, percent)
  setSkillValue('level', value)
  local text = tr('You have %s percent to go', 100 - percent) .. '\n' ..
               tr('%s of experience left', expToAdvance(localPlayer:getLevel(), localPlayer:getExperience()))

  if localPlayer.expSpeed ~= nil then
     local expPerHour = math.floor(localPlayer.expSpeed * 3600)
     if expPerHour > 0 then
        local nextLevelExp = expForLevel(localPlayer:getLevel()+1)
        local hoursLeft = (nextLevelExp - localPlayer:getExperience()) / expPerHour
        local minutesLeft = math.floor((hoursLeft - math.floor(hoursLeft))*60)
        hoursLeft = math.floor(hoursLeft)
        text = text .. '\n' .. tr('%d of experience per hour', expPerHour)
        text = text .. '\n' .. tr('Next level in %d hours and %d minutes', hoursLeft, minutesLeft)
     end
  end

  setSkillPercent('level', percent, text)
end

function onHealthChange(localPlayer, health, maxHealth)
  setSkillValue('health', health)
  checkAlert('health', health, maxHealth, 30)
end

function onManaChange(localPlayer, mana, maxMana)
  setSkillValue('mana', mana)
  checkAlert('mana', mana, maxMana, 30)
end

function onSoulChange(localPlayer, soul)
  setSkillValue('soul', soul)
end

function onSkillPointsChange(localPlayer, skillPoints)

	if not player then 
		player = g_game.getLocalPlayer()
		resetChanges()
	end
	
	if not player then
		print('[onClickApply] player == nil') 
		return 
	end

	if newMagic == -1 then newMagic = player:getBaseMagicLevel() end
	if newVitality == -1 then newVitality = player:getBaseSkillLevel(Skill.Fist) end
	if newStrenght == -1 then newStrenght = player:getBaseSkillLevel(Skill.Club) end
	if newDefence == -1 then newDefence = player:getBaseSkillLevel(Skill.Shielding) end
	if newDexterity == -1 then newDexterity = player:getBaseSkillLevel(Skill.Distance) end
	if newIntelligence == -1 then newIntelligence = player:getBaseSkillLevel(Skill.Axe) end
	if newFaith == -1 then newFaith = player:getBaseSkillLevel(Skill.Sword) end
	if newEndurance == -1 then newEndurance = player:getBaseSkillLevel(Skill.Fishing) end

	skillPointsValueLabel:setText(skillPoints)
	skillPointsValueLabel:setWidth(skillPointsValueLabel:getTextSize().width)
		
	if skillPoints >= 3 then
		magicPlusButton:setVisible(true)
	else
		magicPlusButton:setVisible(false)
	end
		
	if skillPoints >= 1 then
		vitalityPlusButton:setVisible(true)
		strenghtPlusButton:setVisible(true)
		defencePlusButton:setVisible(true)
		dexterityPlusButton:setVisible(true)
		intelligencePlusButton:setVisible(true)
		faithPlusButton:setVisible(true)
		endurancePlusButton:setVisible(true)
	else
		vitalityPlusButton:setVisible(false)
		strenghtPlusButton:setVisible(false)
		defencePlusButton:setVisible(false)
		dexterityPlusButton:setVisible(false)
		intelligencePlusButton:setVisible(false)
		faithPlusButton:setVisible(false)
		endurancePlusButton:setVisible(false)
	end
		
	magicMinusButton:setVisible(false)
	vitalityMinusButton:setVisible(false)
	strenghtMinusButton:setVisible(false)
	defenceMinusButton:setVisible(false)
	dexterityMinusButton:setVisible(false)
	intelligenceMinusButton:setVisible(false)
	faithMinusButton:setVisible(false)
	enduranceMinusButton:setVisible(false)
end

function onFreeCapacityChange(localPlayer, freeCapacity)
  setSkillValue('capacity', freeCapacity)
  checkAlert('capacity', freeCapacity, localPlayer:getTotalCapacity(), 20)
end

function onTotalCapacityChange(localPlayer, totalCapacity)
  checkAlert('capacity', localPlayer:getFreeCapacity(), totalCapacity, 20)
end

function onStaminaChange(localPlayer, stamina)
  local hours = math.floor(stamina / 60)
  local minutes = stamina % 60
  if minutes < 10 then
    minutes = '0' .. minutes
  end
  local percent = math.floor(100 * stamina / (42 * 60)) -- max is 42 hours --TODO not in all client versions

  setSkillValue('stamina', hours .. ":" .. minutes)

  --TODO not all client versions have premium time
  if stamina > 2400 and g_game.getClientVersion() >= 1038 and localPlayer:isPremium() then
  	local text = tr("You have %s hours and %s minutes left", hours, minutes) .. '\n' ..
		tr("Now you will gain 50%% more experience")
		setSkillPercent('stamina', percent, text, 'green')
	elseif stamina > 2400 and g_game.getClientVersion() >= 1038 and not localPlayer:isPremium() then
		local text = tr("You have %s hours and %s minutes left", hours, minutes) .. '\n' ..
		tr("You will not gain 50%% more experience because you aren't premium player, now you receive only 1x experience points")
		setSkillPercent('stamina', percent, text, '#89F013')
	elseif stamina > 2400 and g_game.getClientVersion() < 1038 then
		local text = tr("You have %s hours and %s minutes left", hours, minutes) .. '\n' ..
		tr("If you are premium player, you will gain 50%% more experience")
		setSkillPercent('stamina', percent, text, 'green')
	elseif stamina <= 2400 and stamina > 840 then
		setSkillPercent('stamina', percent, tr("You have %s hours and %s minutes left", hours, minutes), 'orange')
	elseif stamina <= 840 and stamina > 0 then
		local text = tr("You have %s hours and %s minutes left", hours, minutes) .. "\n" ..
		tr("You gain only 50%% experience and you don't may gain loot from monsters")
		setSkillPercent('stamina', percent, text, 'red')
	elseif stamina == 0 then
		local text = tr("You have %s hours and %s minutes left", hours, minutes) .. "\n" ..
		tr("You don't may receive experience and loot from monsters")
		setSkillPercent('stamina', percent, text, 'black')
	end
end

function onRegenerationChange(localPlayer, regenerationTime)
  if not g_game.getFeature(GamePlayerRegenerationTime) or regenerationTime < 0 then
    return
  end
  local minutes = math.floor(regenerationTime / 60)
  local seconds = regenerationTime % 60
  if seconds < 10 then
    seconds = '0' .. seconds
  end

  setSkillValue('regenerationTime', minutes .. ":" .. seconds)
  checkAlert('regenerationTime', regenerationTime, false, 300)
end

function onBaseSpeedChange(localPlayer, baseSpeed)

	print('baseSpeed: ' .. baseSpeed)

	walkSpeedValueLabel:setText(baseSpeed)
	walkSpeedValueLabel:setWidth(walkSpeedValueLabel:getTextSize().width)
	
	currentSpeed = localPlayer:getSpeed()
	
	if currentSpeed > baseSpeed then
		walkSpeedValueLabel:setColor('#008b00') -- green
		walkSpeedButton:setTooltip(baseSpeed .. ' +' .. (currentSpeed - baseSpeed))
	elseif currentSpeed < baseSpeed then
		walkSpeedValueLabel:setColor('#b22222') -- red
		walkSpeedButton:setTooltip(baseSpeed .. ' ' .. (currentSpeed - baseSpeed))
	else
		walkSpeedValueLabel:setColor('#bbbbbb') -- default
		walkSpeedButton:removeTooltip()
	end
end

function onSpeedChange(localPlayer, speed)

	print('speed: ' .. speed)

	walkSpeedValueLabel:setText(speed)
	walkSpeedValueLabel:setWidth(walkSpeedValueLabel:getTextSize().width)
	
	baseSpeed = localPlayer:getBaseSpeed()
	
	if speed > baseSpeed then
		walkSpeedValueLabel:setColor('#008b00') -- green
		walkSpeedButton:setTooltip(baseSpeed .. ' +' .. (speed - baseSpeed))
	elseif speed < baseSpeed then
		walkSpeedValueLabel:setColor('#b22222') -- red
		walkSpeedButton:setTooltip(baseSpeed .. ' ' .. (speed - baseSpeed))
	else
		walkSpeedValueLabel:setColor('#bbbbbb') -- default
		walkSpeedButton:removeTooltip()
	end
end

function onAttackSpeedChange(localPlayer, attackSpeed)

	local value = ((2000 - attackSpeed) / 10) + 100
	local valueDecimalTxt = '' .. value % 1
	
	if valueDecimalTxt == '0.3' or valueDecimalTxt == '0.8' then
		value = value - 0.05
	end

	attackSpeedValueLabel:setText(value .. '%')
	attackSpeedValueLabel:setWidth(attackSpeedValueLabel:getTextSize().width)
	
	if attackSpeed == 1000 then
		attackSpeedValueLabel:setColor('#008b00') -- green
		attackSpeedButton:setTooltip('Dual wielding')
	else
		attackSpeedValueLabel:setColor('#bbbbbb') -- default
		attackSpeedButton:removeTooltip()
	end
end

function onBaseMagicLevelChange(localPlayer, baseMagicLevel)
	setSkillBase('magiclevel', localPlayer:getMagicLevel(), baseMagicLevel)
	setSkillsTooltips()
end

function onMagicLevelChange(localPlayer, magicLevel)
	local baseMagic = localPlayer:getBaseMagicLevel()
	
	if baseMagic <= 0 or magicLevel < 0 then
		return
	end

	magicValueLabel:setText(magicLevel)
	magicValueLabel:setWidth(magicValueLabel:getTextSize().width)

	if magicLevel > baseMagic then
		magicValueLabel:setColor('#008b00') -- green
		magicValueLabel:setTooltip(baseMagic .. ' +' .. (magicLevel - baseMagic))
	elseif magicLevel < baseMagic then
		magicValueLabel:setColor('#b22222') -- red
		magicValueLabel:setTooltip(baseMagic .. ' ' .. (magicLevel - baseMagic))
	else
		magicValueLabel:setColor('#bbbbbb') -- default
		magicValueLabel:removeTooltip()
	end
	
	setSkillsTooltips()
end

function onNewBaseMagicLevelChange(localPlayer, newBaseMagicLevel)
	setSkillNewValue('magiclevel', newBaseMagicLevel, localPlayer:getBaseMagicLevel())
end

function onBaseSkillChange(localPlayer, id, baseLevel)
	setSkillBase('skillId'..id, localPlayer:getSkillLevel(id), baseLevel)
	setSkillsTooltips()
end

function onSkillChange(localPlayer, id, level)
	
	--if id ~= 0 then
	--	setSkillValue('skillId' .. id, level)
	--	setSkillBase('skillId'.. id, localPlayer:getSkillLevel(id), level)
		setSkillsTooltips()
	--end

	if id == Skill.Fist then
	
		local baseVitality = localPlayer:getBaseSkillLevel(Skill.Fist)
		
		if baseVitality <= 0 or level < 0 then
			return
		end
		
		vitalityValueLabel:setText(math.max(baseVitality, level))
		vitalityValueLabel:setWidth(vitalityValueLabel:getTextSize().width)
		
		if level > baseVitality then
			vitalityValueLabel:setColor('#008b00') -- green
			vitalityValueLabel:setTooltip(baseVitality .. ' +' .. (level - baseVitality))
		elseif level < baseVitality then
			vitalityValueLabel:setColor('#b22222') -- red
			vitalityValueLabel:setTooltip(baseVitality .. ' ' .. (level - baseVitality))
		else
			vitalityValueLabel:setColor('#bbbbbb') -- default
			vitalityValueLabel:removeTooltip()
		end
	
	elseif id == Skill.Club then
		
		local baseStrenght = localPlayer:getBaseSkillLevel(Skill.Club)

		if baseStrenght <= 0 or level < 0 then
			return
		end
		
		strenghtValueLabel:setText(math.max(baseStrenght, level))
		strenghtValueLabel:setWidth(strenghtValueLabel:getTextSize().width)
		
		if level > baseStrenght then
			strenghtValueLabel:setColor('#008b00') -- green
			strenghtValueLabel:setTooltip(baseStrenght .. ' +' .. (level - baseStrenght))
		elseif level < baseStrenght then
			strenghtValueLabel:setColor('#b22222') -- red
			strenghtValueLabel:setTooltip(baseStrenght .. ' ' .. (level - baseStrenght))
		else
			strenghtValueLabel:setColor('#bbbbbb') -- default
			strenghtValueLabel:removeTooltip()
		end
		
	elseif id == Skill.Sword then
		
		local baseFaith = localPlayer:getBaseSkillLevel(Skill.Sword)

		if baseFaith <= 0 or level < 0 then
			return
		end
		
		faithValueLabel:setText(math.max(baseFaith, level))
		faithValueLabel:setWidth(faithValueLabel:getTextSize().width)
		
		if level > baseFaith then
			faithValueLabel:setColor('#008b00') -- green
			faithValueLabel:setTooltip(baseFaith .. ' +' .. (level - baseFaith))
		elseif level < baseFaith then
			faithValueLabel:setColor('#b22222') -- red
			faithValueLabel:setTooltip(baseFaith .. ' ' .. (level - baseFaith))
		else
			faithValueLabel:setColor('#bbbbbb') -- default
			faithValueLabel:removeTooltip()
		end
		
	elseif id == Skill.Axe then
		
		local baseIntelligence = localPlayer:getBaseSkillLevel(Skill.Axe)

		if baseIntelligence <= 0 or level < 0 then
			return
		end
		
		intelligenceValueLabel:setText(math.max(baseIntelligence, level))
		intelligenceValueLabel:setWidth(intelligenceValueLabel:getTextSize().width)
		
		if level > baseIntelligence then
			intelligenceValueLabel:setColor('#008b00') -- green
			intelligenceValueLabel:setTooltip(baseIntelligence .. ' +' .. (level - baseIntelligence))
		elseif level < baseIntelligence then
			intelligenceValueLabel:setColor('#b22222') -- red
			intelligenceValueLabel:setTooltip(baseIntelligence .. ' ' .. (level - baseIntelligence))
		else
			intelligenceValueLabel:setColor('#bbbbbb') -- default
			intelligenceValueLabel:removeTooltip()
		end
		
	elseif id == Skill.Distance then
		
		local baseDexterity = localPlayer:getBaseSkillLevel(Skill.Distance)

		if baseDexterity <= 0 or level < 0 then
			return
		end
		
		dexterityValueLabel:setText(math.max(baseDexterity, level))
		dexterityValueLabel:setWidth(dexterityValueLabel:getTextSize().width)
		
		if level > baseDexterity then
			dexterityValueLabel:setColor('#008b00') -- green
			dexterityValueLabel:setTooltip(baseDexterity .. ' +' .. (level - baseDexterity))
		elseif level < baseDexterity then
			dexterityValueLabel:setColor('#b22222') -- red
			dexterityValueLabel:setTooltip(baseDexterity .. ' ' .. (level - baseDexterity))
		else
			dexterityValueLabel:setColor('#bbbbbb') -- default
			dexterityValueLabel:removeTooltip()
		end
		
	elseif id == Skill.Shielding then
		
		local baseDefence = localPlayer:getBaseSkillLevel(Skill.Shielding)

		if baseDefence <= 0 or level < 0 then
			return
		end
		
		defenceValueLabel:setText(math.max(baseDefence, level))
		defenceValueLabel:setWidth(defenceValueLabel:getTextSize().width)
		
		if level > baseDefence then
			defenceValueLabel:setColor('#008b00') -- green
			defenceValueLabel:setTooltip(baseDefence .. ' +' .. (level - baseDefence))
		elseif level < baseDefence then
			defenceValueLabel:setColor('#b22222') -- red
			defenceValueLabel:setTooltip(baseDefence .. ' ' .. (level - baseDefence))
		else
			defenceValueLabel:setColor('#bbbbbb') -- default
			defenceValueLabel:removeTooltip()
		end
		
	elseif id == Skill.Fishing then
		
		local baseEndurance = localPlayer:getBaseSkillLevel(Skill.Fishing)

		if baseEndurance <= 0 or level < 0 then
			return
		end
		
		enduranceValueLabel:setText(math.max(baseEndurance, level))
		enduranceValueLabel:setWidth(enduranceValueLabel:getTextSize().width)
		
		if level > baseEndurance then
			enduranceValueLabel:setColor('#008b00') -- green
			enduranceValueLabel:setTooltip(baseEndurance .. ' +' .. (level - baseEndurance))
		elseif level < baseEndurance then
			enduranceValueLabel:setColor('#b22222') -- red
			enduranceValueLabel:setTooltip(baseEndurance .. ' ' .. (level - baseEndurance))
		else
			enduranceValueLabel:setColor('#bbbbbb') -- default
			enduranceValueLabel:removeTooltip()
		end
	
	elseif id == Skill.CriticalChance then
		
		local baseCriticalChance = localPlayer:getBaseSkillLevel(Skill.CriticalChance)

		if baseCriticalChance < 0 or level < 0 then
			return
		end
		
		criticalChanceValueLabel:setText(math.max(baseCriticalChance, level))
		criticalChanceValueLabel:setWidth(criticalChanceValueLabel:getTextSize().width)
		
		if level > baseCriticalChance then
			criticalChanceValueLabel:setColor('#008b00') -- green
			criticalChanceValueLabel:setTooltip(baseCriticalChance .. ' +' .. (level - baseCriticalChance))
		elseif level < baseCriticalChance then
			criticalChanceValueLabel:setColor('#b22222') -- red
			criticalChanceValueLabel:setTooltip(baseCriticalChance .. ' ' .. (level - baseCriticalChance))
		else
			criticalChanceValueLabel:setColor('#bbbbbb') -- default
			criticalChanceValueLabel:removeTooltip()
		end
	
	elseif id == Skill.CriticalDamage then
		
		local baseCriticalDamage = localPlayer:getBaseSkillLevel(Skill.CriticalDamage)

		if baseCriticalDamage < 0 or level < 0 then
			return
		end
		
		criticalDamageValueLabel:setText(math.max(baseCriticalDamage, level))
		criticalDamageValueLabel:setWidth(criticalDamageValueLabel:getTextSize().width)
		
		if level > baseCriticalDamage then
			criticalDamageValueLabel:setColor('#008b00') -- green
			criticalDamageValueLabel:setTooltip(baseCriticalDamage .. ' +' .. (level - baseCriticalDamage))
		elseif level < baseCriticalDamage then
			criticalDamageValueLabel:setColor('#b22222') -- red
			criticalDamageValueLabel:setTooltip(baseCriticalDamage .. ' ' .. (level - baseCriticalDamage))
		else
			criticalDamageValueLabel:setColor('#bbbbbb') -- default
			criticalDamageValueLabel:removeTooltip()
		end		
	end
end

function onNewBaseSkillChange(localPlayer, id, level)
	setSkillNewValue('skillId' .. id, level, localPlayer:getBaseSkillLevel(id))
end