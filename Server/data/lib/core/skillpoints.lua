local pointsStorage = 62490 				-- where the points are stored
local modalId = 4869						-- id of the modal window
local TextModalId = 4870 					-- so player may return to skill window
local skillPointsAdvanceStorage = 62491 	-- storage to avoid giving points twice for same level

local maxMagic = 10			-- maximum magic till level 8
local maxVitality = 20		-- maximum vitality till level 8
local maxStrenght = 20		-- maximum strenght till level 8
local maxIntelligence = 20	-- maximum intelligence till level 8
local maxFaith = 20			-- maximum faith till level 8
local maxDexterity = 20		-- maximum dexterity till level 8
local maxResistance = 20	-- maximum resistance till level 8
local maxEndurance = 20		-- maximum endurance till level 8

-- level 8 = 24
-- level 40 = 152 (315 gp, 205 mana, 755 cap)
-- level 60 = 212 (415 hp, 305 mana, 955 cap)
-- level 80 = 252 (515 hp, 405 mana, 1155 cap)
-- level 100 = 272 (615 hp, 505 mana, 1355 cap)
-- level 110 = 277 (665 hp, 555 mana, 1455 cap)
-- level 120 = 282 (715 hp, 605 mana, 1555 cap)
-- level 130 = 287 (765 hp, 555 mana, 1655 cap)
-- level 140 = 292 (815 hp, 705 mana, 1755 cap)
-- level 150 = 297 (865 hp, 755 mana, 1855 cap)

local configPoints = {
	pointsOnAdvanceRook = 2, 	-- points per level till end phase rook
	levelPhaseRook = 8,			-- end level of phase rook
	pointsOnAdvance1 = 4,		-- points per level till end phase 1
	levelPhase1 = 40,			-- end level of phase 1
	pointsOnAdvance2 = 3,		-- points per level till end phase 2
	levelPhase2 = 60,			-- end level of phase 2
	pointsOnAdvance3 = 2,		-- points per level till end phase 3
	levelPhase3 = 80,			-- end level of phase 3
	pointsOnAdvance4 = 1,		-- points per level till end phase 4
	levelPhase4 = 100,			-- end level of phase 4
	initialMagicPoints = 0,			-- points when reseting
	initialVitalityPoints = 8,		-- points when reseting
	initialStrenghtPoints = 8,		-- points when reseting
	initialIntelligencePoints = 8,	-- points when reseting
	initialFaithPoints = 8,			-- points when reseting
	initialDexterityPoints = 8,		-- points when reseting
	initialResistancePoints = 8,	-- points when reseting
	initialEndurancePoints = 8		-- points when reseting
} 

local titleNoSkillSelected = "No skill selected"
local descNoSkillSelected = "Select a skill to assign."

local titleMaximumValue = "Maximum value reached"
local descMaximumValue = "You need more level to advance"
local descMaximumGlobalValue = "You have reached the maximum skill.\n"

local titleMinimumValue = "Minimum value reached"
local descMinimumValue = "You can not remove anymore.\n"

local titleNotEnoughPoints = "Not enough points"
local descNotEnoughPoints = "Get more level to receive more.\n"

local titleNotInPZ = "Out of protection zone"
local descNotInPZ = "You need to go to a protection zone."

local titleCanNotReset = "Can not reset"
local descCanNotReset = "You already have minimum skills."

local pointsAvailable = "Skill points available"
local pointAvailable = "Skill point available"

local magic = {
	pointsCost = 3, 
	manaGain = configManager.getNumber(configKeys.MAGIC_MANAGAIN)}

local vitality = {
	pointsCost = 1, 
	healthGain = configManager.getNumber(configKeys.VITALITY_HEALTHGAIN)}

local strenght = {
	pointsCost = 1,
	healthGain = configManager.getNumber(configKeys.STRENGHT_HEALTHGAIN),
	capGain = configManager.getNumber(configKeys.STRENGHT_CAPGAIN) / 100}

local resistance = {
	pointsCost = 1,
    healthGain = configManager.getNumber(configKeys.RESISTANCE_HEALTHGAIN),
	capGain = configManager.getNumber(configKeys.RESISTANCE_CAPGAIN) / 100}

local dexterity = {
	pointsCost = 1, 
	walkSpeedGainInterface = 0.25, 		-- changeable only through sources
	attackSpeedGainInterface = 0.25}	-- changeable only through sources

local intelligence = {
	pointsCost = 1, 
	manaGain = configManager.getNumber(configKeys.INTELLIGENCE_MANAGAIN)}

local faith = {
	pointsCost = 1, 
	manaGain = configManager.getNumber(configKeys.FAITH_MANAGAIN)}

local endurance = {
	pointsCost = 1, 
	capGain = configManager.getNumber(configKeys.ENDURANCE_CAPGAIN) / 100,
	healthGain = configManager.getNumber(configKeys.ENDURANCE_HEALTHGAIN)}

local skills = { -- skill name, player skill value, cost to raise
    [1] = {'Magic', function(player) return player:getBaseMagicLevel() end, magic.pointsCost},
    [2] = {'Vitality', function(player) return player:getSkillLevel(SKILL_VITALITY) end, vitality.pointsCost},
    [3] = {'Strenght', function(player) return player:getSkillLevel(SKILL_STRENGHT) end, strenght.pointsCost},
    [4] = {'Defence', function(player) return player:getSkillLevel(SKILL_RESISTANCE) end, resistance.pointsCost},
    [5] = {'Dexterity', function(player) return player:getSkillLevel(SKILL_DEXTERITY) end, dexterity.pointsCost},
    [6] = {'Faith',	function(player) return player:getSkillLevel(SKILL_FAITH) end, faith.pointsCost},
    [7] = {'Intelligence', function(player) return player:getSkillLevel(SKILL_INTELLIGENCE) end, intelligence.pointsCost},
    [8] = {'Endurance',	function(player) return player:getSkillLevel(SKILL_ENDURANCE) end, endurance.pointsCost}
}

function Player:sendSkillPointsTutorialWelcomeWindow()
	self:registerEvent("skillPoints_tutorialWelcome")
 	local title = "Fibula Server Tutorial"
 	local message = "Welcome to the beginner tutorial.\n\nHere you will find all informations needed to play in this server and make your build.\n"
	local window = ModalWindow(4871, title, message)
	--window:addButton(0, "Go to PVP War Server") 
    window:addButton(1, "Advance") 
    window:setDefaultEnterButton(1)
    window:setDefaultEscapeButton(1)
    window:setPriority(true)
    window:sendToPlayer(self)
    return true
end

function Player:sendSkillPointsTutorialOneHandedMeleeWindow()
	self:registerEvent("skillPoints_tutorialOneHandedMelee")
	local title = "One-Handed Melee Weapons"
 	local message = "One-handed melee weapons are based 100% on strenght skill.\n\nYou can use them with a shield, like the classic gameplay, or with another melee or one-handed distance weapon, then you will be in dual wield mode that fixes your attack speed in 200% but downgrades your weapon attack to 75%.\n\nShields are based 100% on defence skill.\n\n"
    local window = ModalWindow(4872, title, message)
    window:addButton(1, "Advance")   
    window:setDefaultEnterButton(1)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(self)
    return true
end

function Player:sendSkillPointsTutorialTwoHandedMeleeWindow()
	self:registerEvent("skillPoints_tutorialTwoHandedMelee")
	local title = "Two-Handed Melee Weapons"
 	local message = "Two-handed melee weapons are based 100% on strenght skill.\n\nThey give 25% of critical hit chance and 100% of critical hit damage. It has a chance of applying bleeding condition to the enemy.\n"
    local window = ModalWindow(4873, title, message)
    window:addButton(1, "Advance")   
    window:setDefaultEnterButton(1)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(self)
    return true
end

function Player:sendSkillPointsTutorialOneHandedDistanceWindow()
	self:registerEvent("skillPoints_tutorialOneHandedDistance")
	local title = "One-Handed Distance Weapons"
 	local message = "One-handed distance weapons are based 100% on dexterity skill.\n\nIf you want to play as an one-handed ranger that uses a shield, your main skills will be dexterity and defence.\n"
    local window = ModalWindow(4874, title, message)
    window:addButton(1, "Advance")   
    window:setDefaultEnterButton(1)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(self)
    return true
end

function Player:sendSkillPointsTutorialTwoHandedDistanceWindow()
	self:registerEvent("skillPoints_tutorialTwoHandedDistance")
	local title = "Two-Handed Distance Weapons"
 	local message = "Two-handed distance weapons are based 75% on dexterity and 50% on strenght skill.\n\nIf you want to play as a two-handed ranger, they will be your main skills.\n"
    local window = ModalWindow(4875, title, message)
    window:addButton(1, "Advance")   
    window:setDefaultEnterButton(1)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(self)
	return true
end

function Player:sendSkillPointsTutorialMagesWindow()
	self:registerEvent("skillPoints_tutorialMages")
	local title = "Mages"
 	local message = "Mages will have to increase faith and/or intelligence and magic as main skills in order to get more power and acquire more spells.\n\nMagic gives more power to spells and runes.\n\nFaith gives access to support and healing spells (and divine attack spells).\n\nIntelligence gives access to attack spells.\n\nEach point you put in faith skill increases the rod's maximum damage in 2% and each point you put in intelligence skill increases the wand's maximum damage in 1%.\n\nThe maximum value for faith skill is 58.\nWhen you reach it, you will have all support and healing spells and 200% of rod's maximum damage.\n\nThe maximum value for intelligence skill is 108.\nWhen you reach it, you will have all attack spells and 200% of wand's maximum damage.\n\nCheck out our website or click on the 'spellbook button' on the top right corner of the client.\n\n\n\n"
    local window = ModalWindow(4876, title, message)
    window:addButton(1, "Advance")   
    window:setDefaultEnterButton(1)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(self)
	return true
end

function Player:sendSkillPointsTutorialNotesWindow()
	self:registerEvent("skillPoints_tutorialNotes")
	local title = "Notes"
 	local message = "From level 1 to 8, you will receive 2 points per level.\nFrom level 8 to 40, you will receive 4 points per level.\nFrom level 40 to 60, you will receive 3 points per level.\nFrom level 60 to 80, you will receive 2 points per level.\nFrom level 80 to 100, you will receive 1 point per level.\nAfter level 100, you will receive 1 point each 2 levels you get.\n\nYou will start in the beginner island and, when you reach level 8, you will have to talk to The Oracle to reborn in Rhyves.\n\nSome quest items are delivery directly to your special depot localized beside the normal depot in Rhyves.\n\nThere is a Guide NPC in the temple of Rhyves that can reset your skills and give you some tips.\nThe first reset is for free if you didn't reach level 60 yet, but after that it will cost a value based on your level.\n\nThere are new stats available in the skill panel: walk speed and attack speed.\n\nThe donkey mount gives +3 speed and can be get by talking to Palomino in the south gate of Rhyves.\n\n\n\n"
    local window = ModalWindow(4877, title, message)
    window:addButton(1, "Go to Character's Mastery")   
    window:setDefaultEnterButton(1)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(self)
	return true
end

function Player:addSkillLevels(skill)
    if isInArray({SKILL_VITALITY, SKILL_STRENGHT, SKILL_FAITH, SKILL_INTELLIGENCE, SKILL_DEXTERITY, SKILL_RESISTANCE, SKILL_ENDURANCE}, skill) then
        local xp = math.ceil(self:getVocation():getRequiredSkillTries(skill, self:getSkillLevel(skill) + 1) / configManager.getNumber(configKeys.RATE_SKILL))
        self:addSkillTries(skill, xp)
        return true
    end
    if skill == SKILL_MAGLEVEL then
        local xp = math.ceil(self:getVocation():getRequiredManaSpent(self:getBaseMagicLevel() + 1) / configManager.getNumber(configKeys.RATE_MAGIC))
        self:addManaSpent(xp)
        return true
    end
end
 
function Player:sendSkillPointsWindow()
    local pts = self:getStorageValue(pointsStorage)
    local blessings = self:getTotalBlessings()
    local freeReset = self:getStorageValue(62492)
    local window = nil
    
    if pts < 0 then
        self:setStorageValue(pointsStorage, 0)
        pts = 0
    end

    if freeReset < 0 then
        self:setStorageValue(62492, 0)
        freeReset = 0
    end


    if freeReset == 1 and self:getLevel() < 60 then
    	window = ModalWindow(modalId, "Character Mastery", "Available points: " .. pts .. " | Blessings: " .. blessings .. " | Resets left: 1")
    else
    	window = ModalWindow(modalId, "Character Mastery", "Available points: " .. pts .. " | Blessings: " .. blessings)
    end
    if pts >= 5 and pts < 20 then
        window:addButton(0, "Help")
        window:addButton(2, "           Assign 5           ")
        window:addButton(3, "           Assign 1           ")
        window:addButton(4, "             Exit             ")
    elseif pts >= 20 then
    	window:addButton(0, "Help")
    	window:addButton(1, "           Assign 20          ")
    	window:addButton(3, "           Assign 1           ")
        window:addButton(4, "             Exit             ")
    else
    	window:addButton(0, "Help")
    	window:addButton(3, "                    Assign                    ")
    	window:addButton(4, "                     Exit                     ")
    end
 
    for i = 1, #skills do
        if not skills[choiceId] then
        	if skills[i][1] == "Magic" then
        		if magic.manaGain > 0 then
                    if magic.pointsCost > 1 then
                        window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Spell Power, + Rune Power, +" .. magic.manaGain .. " Mana) (" .. magic.pointsCost .. " points)")
                    else
                        window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Spell Power, + Rune Power, +" .. magic.manaGain .. " Mana)")
                    end
                else
                    if magic.pointsCost > 1 then
                        window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Spell Power, + Rune Power) (" .. magic.pointsCost .. " points)")
                    else
                        window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Spell Power, + Rune Power)")
                    end
        		end
        	elseif skills[i][1] == "Vitality" then
        		if vitality.healthGain > 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+" .. vitality.healthGain .. " Health)")
        		end
        	elseif skills[i][1] == "Strenght" then
        		if strenght.healthGain > 0 and strenght.capGain == 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Melee Damage, + Two-Handed Distance Damage, +".. strenght.healthGain .. " Health)") 
        		elseif strenght.healthGain == 0 and strenght.capGain > 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Melee Damage, + Two-Handed Distance Damage, +".. strenght.capGain .. " Capacity)") 
        		elseif strenght.healthGain > 0 and strenght.capGain > 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Melee Damage, + Two-Handed Distance Damage, +".. strenght.healthGain .. " Health, +".. strenght.capGain .. " Capacity)")
                else
                    window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Melee Damage, + Two-Handed Distance Damage)")
        		end
        	elseif skills[i][1] == "Defence" then
        		if resistance.capGain > 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Shield Defence, +" .. resistance.capGain .. " Capacity)")
                elseif resistance.healthGain > 0 then
                    window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Shield Defence, +" .. resistance.healthGain .. " Health)")
                else
                    window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Shield Defence)")
        		end
        	elseif skills[i][1] == "Dexterity" then
        		if dexterity.walkSpeedGainInterface > 0 and dexterity.attackSpeedGainInterface == 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Distance Damage, +" .. dexterity.walkSpeedGainInterface .. " Walk Speed)")
        		elseif dexterity.walkSpeedGainInterface == 0 and dexteiry.attackSpeedGainInterface > 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Distance Damage, +" .. dexterity.attackSpeedGainInterface .. " Attack Speed)")
        		elseif dexterity.walkSpeedGainInterface > 0 and dexterity.attackSpeedGainInterface > 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Distance Damage, +" .. dexterity.walkSpeedGainInterface .. " Walk Speed +" .. dexterity.attackSpeedGainInterface .. " Attack Speed)")
        		else
                    window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+ Distance Damage)")
                end
            elseif skills[i][1] == "Intelligence" then
        		if intelligence.manaGain > 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+1% Wand's Maximum Damage, + Attack Spells, +" .. intelligence.manaGain .. " Mana)") 
        		end
        	elseif skills[i][1] == "Faith" then
        		if faith.manaGain > 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+2% Rod's Maximum Damage, + Support and Healing Spells, +" .. faith.manaGain .. " Mana)") 
        		end
        	elseif skills[i][1] == "Endurance" then
        		if endurance.capGain > 0 and endurance.healthGain == 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+" .. vitality.healthGain .. " Capacity)")
        		elseif endurance.capGain == 0 and endurance.healthGain > 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+" .. endurance.healthGain .. " Health)")
        		elseif endurance.capGain > 0 and endurance.healthGain > 0 then
        			window:addChoice(i, skills[i][1] .. ": " .. skills[i][2](self) .. " (+" .. vitality.healthGain .. " Capacity, +" .. endurance.healthGain .. " Health)")
        		end
        	end   
        end
    end
   
    window:setDefaultEnterButton(3)
    window:setDefaultEscapeButton(4)
    window:sendToPlayer(self)
    return true
end
 
function Player:skillWindowChoice(windowId, buttonId, choiceId)

    if windowId == modalId then

    	playerGuid = getPlayerGUID(self)

    	--------------------------------------------- TUTORIAL BUTTON ---------------------------------------------
    	if buttonId == 0 then
    		self:sendSkillPointsTutorialWelcomeWindow()

    	------------------------------------------- END TUTORIAL BUTTON -------------------------------------------

    	---------------------------------------------- ASSIGN BUTTON ----------------------------------------------
        elseif buttonId == 3 then

        	-- check if player selected a skill
            if not skills[choiceId] then
                local textWindow = ModalWindow(TextModalId, titleNoSkillSelected, descNoSkillSelected)
                textWindow:addButton(1, "Ok")
                textWindow:setDefaultEnterButton(1)
                textWindow:setDefaultEscapeButton(1)
                textWindow:sendToPlayer(self)
                return true
            end

            local pts = self:getStorageValue(pointsStorage)
            if pts < 0 then
                self:setStorageValue(pointsStorage, 0)
                pts = 0
            end
           
           	-- check if player has the points needed for advancing
            if pts - skills[choiceId][3] >= 0 then

            	-- ASSIGN MAGIC
            	if skills[choiceId][1] == "Magic" then
		            if not (self:assignSkillPoints(SKILL_MAGLEVEL)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN VITALITY
            	elseif skills[choiceId][1] == "Vitality" then
	            	if not (self:assignSkillPoints(SKILL_VITALITY)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN STRENGHT
	            elseif skills[choiceId][1] == "Strenght" then
	            	if not (self:assignSkillPoints(SKILL_STRENGHT)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN DEXTERITY
	            elseif skills[choiceId][1] == "Dexterity" then
	                if not (self:assignSkillPoints(SKILL_DEXTERITY)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN INTELLIGENCE
	            elseif skills[choiceId][1] == "Intelligence" then
	                if not (self:assignSkillPoints(SKILL_INTELLIGENCE)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		       	-- ASSIGN FAITH
	            elseif skills[choiceId][1] == "Faith" then
		            if not (self:assignSkillPoints(SKILL_FAITH)) then
		            	if self:getSkillLevel(SKILL_FAITH) == 58 then
                            local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumGlobalValue)
                            textWindow:addButton(1, "Ok")
                            textWindow:setDefaultEnterButton(1)
                            textWindow:setDefaultEscapeButton(1)
                            textWindow:sendToPlayer(self)
                        else
                            local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
                            textWindow:addButton(1, "Ok")
                            textWindow:setDefaultEnterButton(1)
                            textWindow:setDefaultEscapeButton(1)
                            textWindow:sendToPlayer(self)
                        end
                        return true
		            end

		        -- ASSIGN RESISTANCE
	            elseif skills[choiceId][1] == "Defence" then
	                if not (self:assignSkillPoints(SKILL_RESISTANCE)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

	            -- ASSIGN ENDURANCE
	            elseif skills[choiceId][1] == "Endurance" then
	                if not (self:assignSkillPoints(SKILL_ENDURANCE)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end
		        end
	            self:sendSkillPointsWindow()
            	return true
        	else
	            local textWindow = ModalWindow(TextModalId, titleNotEnoughPoints, descNotEnoughPoints)
	            textWindow:addButton(1, "Ok")
	            textWindow:setDefaultEnterButton(1)
	            textWindow:setDefaultEscapeButton(1)
	            textWindow:sendToPlayer(self)
	        	return true
	        end
        -------------------------------------------- END ASSIGN BUTTON --------------------------------------------

        --------------------------------------------- ASSIGN 5 BUTTON ---------------------------------------------
        elseif buttonId == 2 then

        	-- check if player selected a skill
            if not skills[choiceId] then
                local textWindow = ModalWindow(TextModalId, titleNoSkillSelected, descNoSkillSelected)
                textWindow:addButton(1, "Ok")
                textWindow:setDefaultEnterButton(1)
                textWindow:setDefaultEscapeButton(1)
                textWindow:sendToPlayer(self)
                return true
            end

            local pts = self:getStorageValue(pointsStorage)
            if pts < 0 then
                self:setStorageValue(pointsStorage, 0)
                pts = 0
            end
           
           	-- check if player has the points needed for advancing
            if pts - skills[choiceId][3] * 5 >= 0 then

            	-- ASSIGN 5 MAGIC
            	if skills[choiceId][1] == "Magic" then
		            if not (self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and
		            		self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN VITALITY
            	elseif skills[choiceId][1] == "Vitality" then
	            	if not (self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and
	            			self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN STRENGHT
	            elseif skills[choiceId][1] == "Strenght" then
	            	if not (self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and
	            			self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN DEXTERITY
	            elseif skills[choiceId][1] == "Dexterity" then
	                if not (self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and
	                		self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN INTELLIGENCE
	            elseif skills[choiceId][1] == "Intelligence" then
	                if not (self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and
							self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		       	-- ASSIGN FAITH
	            elseif skills[choiceId][1] == "Faith" then
		            if not (self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and
							self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH)) then
                        if self:getSkillLevel(SKILL_FAITH) == 58 then
                            local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumGlobalValue)
                            textWindow:addButton(1, "Ok")
                            textWindow:setDefaultEnterButton(1)
                            textWindow:setDefaultEscapeButton(1)
                            textWindow:sendToPlayer(self)
                        else
    		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
    			            textWindow:addButton(1, "Ok")
    			            textWindow:setDefaultEnterButton(1)
    			            textWindow:setDefaultEscapeButton(1)
    			            textWindow:sendToPlayer(self)
                        end
                        return true
		            end

		        -- ASSIGN RESISTANCE
	            elseif skills[choiceId][1] == "Defence" then
	                if not (self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and
							self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

	            -- ASSIGN ENDURANCE
	            elseif skills[choiceId][1] == "Endurance" then
	                if not (self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and
	                		self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end
		        end
	            self:sendSkillPointsWindow()
            	return true
        	else
	            local textWindow = ModalWindow(TextModalId, titleNotEnoughPoints, descNotEnoughPoints)
	            textWindow:addButton(1, "Ok")
	            textWindow:setDefaultEnterButton(1)
	            textWindow:setDefaultEscapeButton(1)
	            textWindow:sendToPlayer(self)
	        	return true
	        end
        ------------------------------------------- END ASSIGN 5 BUTTON -------------------------------------------

        --------------------------------------------- ASSIGN 20 BUTTON --------------------------------------------
        elseif buttonId == 1 then

        	-- check if player selected a skill
            if not skills[choiceId] then
                local textWindow = ModalWindow(TextModalId, titleNoSkillSelected, descNoSkillSelected)
                textWindow:addButton(1, "Ok")
                textWindow:setDefaultEnterButton(1)
                textWindow:setDefaultEscapeButton(1)
                textWindow:sendToPlayer(self)
                return true
            end

            local pts = self:getStorageValue(pointsStorage)
            if pts < 0 then
                self:setStorageValue(pointsStorage, 0)
                pts = 0
            end
           
           	-- check if player has the points needed for advancing
            if pts - skills[choiceId][3] * 20 >= 0 then

            	-- ASSIGN 20 MAGIC
            	if skills[choiceId][1] == "Magic" then
		            if not (self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and
		            		self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and
		            		self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and
		            		self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and
		            		self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and
		            		self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL) and
		            		self:assignSkillPoints(SKILL_MAGLEVEL) and self:assignSkillPoints(SKILL_MAGLEVEL)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN 20 VITALITY
            	elseif skills[choiceId][1] == "Vitality" then
	            	if not (self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and
	            			self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and
	            			self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and
	            			self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and
	            			self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and
	            			self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY) and
	            			self:assignSkillPoints(SKILL_VITALITY) and self:assignSkillPoints(SKILL_VITALITY)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN 20 STRENGHT
	            elseif skills[choiceId][1] == "Strenght" then
	            	if not (self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and
	            			self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and
	            			self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and
	            			self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and
	            			self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and
	            			self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT) and
	            			self:assignSkillPoints(SKILL_STRENGHT) and self:assignSkillPoints(SKILL_STRENGHT)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN 20 DEXTERITY
	            elseif skills[choiceId][1] == "Dexterity" then
	                if not (self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and
	                		self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and
	                		self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and
	                		self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and
	                		self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and
	                		self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY) and
	                		self:assignSkillPoints(SKILL_DEXTERITY) and self:assignSkillPoints(SKILL_DEXTERITY)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		        -- ASSIGN 20 INTELLIGENCE
	            elseif skills[choiceId][1] == "Intelligence" then
	                if not (self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and
	                		self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and
	                		self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and
	                		self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and
	                		self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and
	                		self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE) and
							self:assignSkillPoints(SKILL_INTELLIGENCE) and self:assignSkillPoints(SKILL_INTELLIGENCE)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

		       	-- ASSIGN 20 FAITH
	            elseif skills[choiceId][1] == "Faith" then
		            if not (self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and
		            		self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and
		            		self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and
		            		self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and
		            		self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and
		            		self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH) and
							self:assignSkillPoints(SKILL_FAITH) and self:assignSkillPoints(SKILL_FAITH)) then
                        if self:getSkillLevel(SKILL_FAITH) == 58 then
                            local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumGlobalValue)
                            textWindow:addButton(1, "Ok")
                            textWindow:setDefaultEnterButton(1)
                            textWindow:setDefaultEscapeButton(1)
                            textWindow:sendToPlayer(self)
                        else
    		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
    			            textWindow:addButton(1, "Ok")
    			            textWindow:setDefaultEnterButton(1)
    			            textWindow:setDefaultEscapeButton(1)
    			            textWindow:sendToPlayer(self)
                        end
                        return true
		            end

		        -- ASSIGN 20 RESISTANCE
	            elseif skills[choiceId][1] == "Defence" then
	                if not (self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and
	                		self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and
	                		self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and
	                		self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and
	                		self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and
	                		self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE) and
							self:assignSkillPoints(SKILL_RESISTANCE) and self:assignSkillPoints(SKILL_RESISTANCE)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end

	            -- ASSIGN 20 ENDURANCE
	            elseif skills[choiceId][1] == "Endurance" then
	                if not (self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and
	                		self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and
	                		self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and
	                		self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and
	                		self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and
	                		self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE) and
	                		self:assignSkillPoints(SKILL_ENDURANCE) and self:assignSkillPoints(SKILL_ENDURANCE)) then
		            	local textWindow = ModalWindow(TextModalId, titleMaximumValue, descMaximumValue)
			            textWindow:addButton(1, "Ok")
			            textWindow:setDefaultEnterButton(1)
			            textWindow:setDefaultEscapeButton(1)
			            textWindow:sendToPlayer(self)
			            return true
		            end
		        end
	            self:sendSkillPointsWindow()
            	return true
        	else
	            local textWindow = ModalWindow(TextModalId, titleNotEnoughPoints, descNotEnoughPoints)
	            textWindow:addButton(1, "Ok")
	            textWindow:setDefaultEnterButton(1)
	            textWindow:setDefaultEscapeButton(1)
	            textWindow:sendToPlayer(self)
	        	return true
	        end
        ------------------------------------------- END ASSIGN 20 BUTTON ------------------------------------------
    	end
        return false
    end
   
    if not (windowId == TextModalId) then
        return false
    end
       
    self:sendSkillPointsWindow()
    return false
end
 
function Player:addSkillPoints(count)
    count = math.max(1, count or 1)
   
    local pts = self:getStorageValue(pointsStorage)
    if pts < 0 then
        self:setStorageValue(pointsStorage, 0)
        pts = 0
    end
   
    return self:setStorageValue(pointsStorage, pts + count)
end
 
function Player:addSkillPointsOnLevelAdvance(oldLevel, newLevel)

    if self:getStorageValue(skillPointsAdvanceStorage) < newLevel then
    	if newLevel <= configPoints.levelPhaseRook then
    		if oldLevel == newLevel - 1 then
	    		self:addSkillPoints(configPoints.pointsOnAdvanceRook)
	    		self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, pointsAvailable .. " (+" .. configPoints.pointsOnAdvanceRook .. ")")
	    	else
	    		local levelsAdvanced = newLevel - oldLevel
	    		self:addSkillPoints(configPoints.pointsOnAdvanceRook * levelsAdvanced)
	    		for i = 1, levelsAdvanced do
	    			self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, pointsAvailable .. " (+" .. configPoints.pointsOnAdvanceRook .. ")")
	    		end
	    	end
    	elseif newLevel <= configPoints.levelPhase1 then
    		if oldLevel == newLevel - 1 then
        		self:addSkillPoints(configPoints.pointsOnAdvance1)
        		self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, pointsAvailable .. " (+" .. configPoints.pointsOnAdvance1 .. ")")
        	else
        		local levelsAdvanced = newLevel - oldLevel
        		self:addSkillPoints(configPoints.pointsOnAdvance1 * levelsAdvanced)
        		for i = 1, levelsAdvanced do
        			self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, pointsAvailable .. " (+" .. configPoints.pointsOnAdvance1 .. ")")
        		end
        	end
        elseif newLevel <= configPoints.levelPhase2 then
        	if oldLevel == newLevel - 1 then
	    		self:addSkillPoints(configPoints.pointsOnAdvance2)
	    		self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, pointsAvailable .. " (+" .. configPoints.pointsOnAdvance2 .. ")")
    		else
        		local levelsAdvanced = newLevel - oldLevel
        		self:addSkillPoints(configPoints.pointsOnAdvance2 * levelsAdvanced)
        		for i = 1, levelsAdvanced do
        			self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, pointsAvailable .. " (+" .. configPoints.pointsOnAdvance2 .. ")")
        		end
        	end
    	elseif newLevel <= configPoints.levelPhase3 then
    		if oldLevel == newLevel - 1 then
				self:addSkillPoints(configPoints.pointsOnAdvance3)
				self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, pointsAvailable .. " (+" .. configPoints.pointsOnAdvance3 .. ")")
			else
        		local levelsAdvanced = newLevel - oldLevel
        		self:addSkillPoints(configPoints.pointsOnAdvance3 * levelsAdvanced)
        		for i = 1, levelsAdvanced do
        			self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, pointsAvailable .. " (+" .. configPoints.pointsOnAdvance3 .. ")")
        		end
        	end
    	elseif newLevel <= configPoints.levelPhase4 then
			self:addSkillPoints(configPoints.pointsOnAdvance4)
			self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, pointAvailable .. " (+" .. configPoints.pointsOnAdvance4 .. ")")
    	elseif (newLevel % 2) == 0 then
			self:addSkillPoints(configPoints.pointsOnAdvance4)
			self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, pointAvailable .. " (+" .. configPoints.pointsOnAdvance4 .. ")")
		end
        self:setStorageValue(skillPointsAdvanceStorage, newLevel)
    end
    return true
end

function Player:assignSkillPoints(skill)

	if getPlayerLevel(self) >= 8 then
        maxMagic 		= math.ceil( math.max( getPlayerLevel(self) * math.max( 2.5 - (0.02 * (getPlayerLevel(self) - 8)), 1 ) * 0.5, getPlayerLevel(self) ) )
		maxVitality 	= math.ceil( math.max( getPlayerLevel(self) * math.max( 2.5 - (0.02 * (getPlayerLevel(self) - 8)), 1 ), getPlayerLevel(self) ) )
		maxStrenght 	= math.ceil( math.max( getPlayerLevel(self) * math.max( 2.5 - (0.02 * (getPlayerLevel(self) - 8)), 1 ), getPlayerLevel(self) ) )
		maxIntelligence = math.ceil( math.max( getPlayerLevel(self) * math.max( 2.5 - (0.02 * (getPlayerLevel(self) - 8)), 1 ), getPlayerLevel(self) ) )
		maxFaith 		= math.ceil( math.max( getPlayerLevel(self) * math.max( 2.5 - (0.02 * (getPlayerLevel(self) - 8)), 1 ), getPlayerLevel(self) ) )
		maxDexterity 	= math.ceil( math.max( getPlayerLevel(self) * math.max( 2.5 - (0.02 * (getPlayerLevel(self) - 8)), 1 ), getPlayerLevel(self) ) )
		maxResistance 	= math.ceil( math.max( getPlayerLevel(self) * math.max( 2.5 - (0.02 * (getPlayerLevel(self) - 8)), 1 ), getPlayerLevel(self) ) )
		maxEndurance 	= math.ceil( math.max( getPlayerLevel(self) * math.max( 2.5 - (0.02 * (getPlayerLevel(self) - 8)), 1 ), getPlayerLevel(self) ) )
	end

	if getPlayerLevel(self) >= 72 then
        maxMagic 		= 72
		maxVitality 	= 90
		maxStrenght 	= 90
		maxIntelligence = 90
		maxFaith 		= 90
		maxDexterity 	= 90
		maxResistance 	= 90
		maxEndurance 	= 90
	end

	if getPlayerLevel(self) > 90 then
        maxMagic 		= 72 + getPlayerLevel(self) - 90
		maxVitality 	= getPlayerLevel(self)
		maxStrenght 	= getPlayerLevel(self)
		maxIntelligence = getPlayerLevel(self)
		maxFaith 		= getPlayerLevel(self)
		maxDexterity 	= getPlayerLevel(self)
		maxResistance 	= getPlayerLevel(self)
		maxEndurance 	= getPlayerLevel(self)
	end

	if getPlayerLevel(self) > 100 then
        maxMagic 		= math.ceil(82 + (getPlayerLevel(self) - 100) / 2)
		maxVitality 	= getPlayerLevel(self)
		maxStrenght 	= getPlayerLevel(self)
		maxIntelligence = getPlayerLevel(self)
		maxFaith 		= getPlayerLevel(self)
		maxDexterity 	= getPlayerLevel(self)
		maxResistance 	= getPlayerLevel(self)
		maxEndurance 	= getPlayerLevel(self)
	end

	if getPlayerLevel(self) > 130 then
		maxVitality 	= 130
		maxStrenght 	= 130
		maxIntelligence = 130
		maxFaith 		= 130
		maxDexterity 	= 130
		maxResistance 	= 130
		maxEndurance 	= 130
	end

	if getPlayerLevel(self) > 135 then
		maxMagic 		= math.ceil(100 + (getPlayerLevel(self) - 135) / 2)
		maxVitality 	= 130
		maxStrenght 	= 130
		maxIntelligence = 130
		maxFaith 		= 130
		maxDexterity 	= 130
		maxResistance 	= 130
		maxEndurance 	= 130
	end

	if getPlayerLevel(self) > 153 then
		maxMagic 		= 110
		maxVitality 	= 130
		maxStrenght 	= 130
		maxIntelligence = 130
		maxFaith 		= 130
		maxDexterity 	= 130
		maxResistance 	= 130
		maxEndurance 	= 130
	end

	if (skill == SKILL_MAGLEVEL) then
		if self:getMagicLevel() < maxMagic then
			self:addSkillLevels(SKILL_MAGLEVEL)
			self:setStorageValue(pointsStorage, self:getStorageValue(pointsStorage) - skills[1][3])
			return true
	    else
	    	return false
	    end

	elseif (skill == SKILL_VITALITY) then
		if self:getSkillLevel(SKILL_VITALITY) < maxVitality then
			self:addSkillLevels(SKILL_VITALITY, 1)
			self:setStorageValue(pointsStorage, self:getStorageValue(pointsStorage) - skills[2][3])
			return true
	    else
	    	return false
	    end

	elseif (skill == SKILL_STRENGHT) then
		if self:getSkillLevel(SKILL_STRENGHT) < maxStrenght then
    		self:addSkillLevels(SKILL_STRENGHT, 1)
			self:setStorageValue(pointsStorage, self:getStorageValue(pointsStorage) - skills[3][3])
			self:messageOnAdvance(SKILL_STRENGHT)
			return true
	    else
	    	return false
	    end

	elseif (skill == SKILL_INTELLIGENCE) then
		if self:getSkillLevel(SKILL_INTELLIGENCE) < maxIntelligence then
        	self:addSkillLevels(SKILL_INTELLIGENCE, 1)
			self:setStorageValue(pointsStorage, self:getStorageValue(pointsStorage) - skills[4][3])
			self:messageOnAdvance(SKILL_INTELLIGENCE)
	    	return true
	    else
	    	return false
	    end

	elseif (skill == SKILL_FAITH) then
		if self:getSkillLevel(SKILL_FAITH) < maxFaith then
        	self:addSkillLevels(SKILL_FAITH, 1)
			self:setStorageValue(pointsStorage, self:getStorageValue(pointsStorage) - skills[5][3])
		    self:messageOnAdvance(SKILL_FAITH)
			return true
	    else
	    	return false
	    end

	elseif (skill == SKILL_DEXTERITY) then
		if self:getSkillLevel(SKILL_DEXTERITY) < maxDexterity then
        	self:addSkillLevels(SKILL_DEXTERITY, 1)
			self:setStorageValue(pointsStorage, self:getStorageValue(pointsStorage) - skills[6][3])
			return true
	    else
	    	return false
	    end

	elseif (skill == SKILL_RESISTANCE) then
		if self:getSkillLevel(SKILL_RESISTANCE) < maxResistance then
        	self:addSkillLevels(SKILL_RESISTANCE, 1)
			self:setStorageValue(pointsStorage, self:getStorageValue(pointsStorage) - skills[7][3])
			return true
	    else
	    	return false
	    end

	elseif (skill == SKILL_ENDURANCE) then
		if self:getSkillLevel(SKILL_ENDURANCE) < maxEndurance then
        	self:addSkillLevels(SKILL_ENDURANCE, 1)
			self:setStorageValue(pointsStorage, self:getStorageValue(pointsStorage) - skills[8][3])
			return true
	    else
	    	return false
	    end
	end
end

function Player:resetAllSkills()

	local playerGuid = getPlayerGUID(self)

	local magicPoints = 0
	local vitalityPoints = 0
	local strenghtPoints = 0
	local intelligencePoints = 0
	local faithPoints = 0
	local dexterityPoints = 0
	local resistancePoints = 0
	local endurancePoints = 0

	local healthRemove = 0
	local manaRemove = 0
	local pointsAdd = 0

	-- CHECK MAGIC POINTS
	if self:getMagicLevel() > configPoints.initialMagicPoints then
		local magicPoints = (self:getMagicLevel() - configPoints.initialMagicPoints) * magic.pointsCost	-- getting total magic points
		manaRemove = manaRemove + ((magicPoints / magic.pointsCost) * magic.manaGain)
		pointsAdd = pointsAdd + magicPoints
  	end

    -- CHECK VITALITY POINTS
	if self:getSkillLevel(SKILL_VITALITY) > configPoints.initialVitalityPoints then
		local vitalityPoints = self:getSkillLevel(SKILL_VITALITY) - configPoints.initialVitalityPoints	-- getting total vitality points
		healthRemove = healthRemove + (vitalityPoints * vitality.healthGain)							-- getting health to remove
		pointsAdd = pointsAdd + vitalityPoints									
	end

    -- CHECK STRENGHT POINTS
	if self:getSkillLevel(SKILL_STRENGHT) > configPoints.initialStrenghtPoints then 
	    local strenghtPoints = self:getSkillLevel(SKILL_STRENGHT) - configPoints.initialVitalityPoints
	    pointsAdd = pointsAdd + strenghtPoints
        if strenght.capGain > 0 then
            self:setCapacity(self:getCapacity() - (strenght.capGain * 100 * strenghtPoints)) -- changing cap max
        end
  	end

  	-- CHECK RESISTANCE POINTS
	if self:getSkillLevel(SKILL_RESISTANCE) > configPoints.initialResistancePoints then
		local resistancePoints = self:getSkillLevel(SKILL_RESISTANCE) - configPoints.initialResistancePoints -- getting total resistance points
        if resistance.capGain > 0 then
    		self:setCapacity(self:getCapacity() - (resistance.capGain * 100 * resistancePoints)) 		     -- changing cap max
	    end
	    if resistance.healthGain > 0 then
    		healthRemove = healthRemove + (resistancePoints * resistance.healthGain) 		     			 -- getting health to remove
	    end
    	pointsAdd = pointsAdd + resistancePoints
  	end

  	-- CHECK DEXTERITY POINTS
	if self:getSkillLevel(SKILL_DEXTERITY) > configPoints.initialDexterityPoints then
		local dexterityPoints = (self:getSkillLevel(SKILL_DEXTERITY) - configPoints.initialDexterityPoints) * dexterity.pointsCost	-- getting total dexterity points
		pointsAdd = pointsAdd + dexterityPoints
  	end

    -- CHECK INTELLIGENCE POINTS
	if self:getSkillLevel(SKILL_INTELLIGENCE) > configPoints.initialIntelligencePoints then
		local intelligencePoints = self:getSkillLevel(SKILL_INTELLIGENCE) - configPoints.initialIntelligencePoints -- getting total intelligence points
		manaRemove = manaRemove + (intelligencePoints * intelligence.manaGain)
		pointsAdd = pointsAdd + intelligencePoints
  	end

    -- CHECK FAITH POINTS
	if self:getSkillLevel(SKILL_FAITH) > configPoints.initialFaithPoints then
		local faithPoints = self:getSkillLevel(SKILL_FAITH) - configPoints.initialFaithPoints 	-- getting total faith points
		manaRemove = manaRemove + (faithPoints * faith.manaGain)
		pointsAdd = pointsAdd + faithPoints
	end

	-- CHECK ENDURANCE POINTS
	if self:getSkillLevel(SKILL_ENDURANCE) > configPoints.initialEndurancePoints then
		local endurancePoints = self:getSkillLevel(SKILL_ENDURANCE) - configPoints.initialEndurancePoints -- getting total endurance points
        if endurance.healthGain > 0 then
	       healthRemove = healthRemove + (endurancePoints * endurance.healthGain)						  -- getting health to remove
        end
        if endurance.capGain > 0 then
		  self:setCapacity(self:getCapacity() - (endurance.capGain * 100 * endurancePoints))		      -- changing cap max
        end
		pointsAdd = pointsAdd + endurancePoints
	end

	-- RESETING ALL
	if pointsAdd > 0 then

    	local health = self:getHealth()
    	local newHealthMax = self:getMaxHealth() - healthRemove
    	local mana = self:getMana()
    	local newManaMax = self:getMaxMana() - manaRemove

		if health > newHealthMax then
			health = newHealthMax
			if health < 0 then
				health = 40
			end
		else
			health = self:getHealth()
		end

		if mana > newManaMax then
			mana = newManaMax
			if mana < 0 then
				mana = 10
			end
		else
			mana = self:getMana()
		end

		self:addSkillPoints(pointsAdd)
		doRemoveCreature(self)
   		db.query("UPDATE `players` SET `health` = " .. health .. ", `healthmax` = " .. newHealthMax .. ", `mana` = " .. mana .. ", `manamax` = " .. newManaMax .. ", `maglevel` = " .. configPoints.initialMagicPoints .. ", `skill_fist` = " .. configPoints.initialVitalityPoints .. ",  `skill_club` = " .. configPoints.initialStrenghtPoints .. ",  `skill_sword` = " .. configPoints.initialFaithPoints .. ",  `skill_axe` = " .. configPoints.initialIntelligencePoints .. ",  `skill_dist` = " .. configPoints.initialDexterityPoints .. ",  `skill_shielding` = " .. configPoints.initialResistancePoints .. ",  `skill_fishing` = " .. configPoints.initialEndurancePoints .. " WHERE `id` = " .. playerGuid .. ";")
   		return true
   	else
        return false
   	end	
end

function Player:resetSkill(skill)

	local playerGuid = getPlayerGUID(self)

	if (skill == SKILL_MAGLEVEL) then
		if self:getMagicLevel() > configPoints.initialMagicPoints then
			self:setMaxMana(self:getMaxMana() - (magic.manaGain * (self:getMagicLevel() - configPoints.initialMagicPoints)) ) -- changing mana max
			local skillDatabase = "maglevel"
		    local newSkillValue = configPoints.initialMagicPoints
		    self:addSkillPoints((self:getMagicLevel() - configPoints.initialMagicPoints) * magic.pointsCost)	-- adding points
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
	    	return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_VITALITY) then
		if self:getSkillLevel(SKILL_VITALITY) > configPoints.initialVitalityPoints then
			self:setMaxHealth(self:getMaxHealth() - (vitality.healthGain * (self:getSkillLevel(SKILL_VITALITY) - configPoints.initialVitalityPoints)) )	-- changing max health
			local skillDatabase = "skill_fist"
		    local newSkillValue = configPoints.initialVitalityPoints
		    self:addSkillPoints(self:getSkillLevel(SKILL_VITALITY) - configPoints.initialVitalityPoints)											
		    doRemoveCreature(self)											
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";") 
	    	return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_STRENGHT) then
		if self:getSkillLevel(SKILL_STRENGHT) > configPoints.initialStrenghtPoints then 
			local skillDatabase = "skill_club"
		    local newSkillValue = configPoints.initialStrenghtPoints
		    self:addSkillPoints(self:getSkillLevel(SKILL_STRENGHT) - configPoints.initialVitalityPoints)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
	    	return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_INTELLIGENCE) then
		if self:getSkillLevel(SKILL_INTELLIGENCE) > configPoints.initialIntelligencePoints then
			self:setMaxMana(self:getMaxMana() - (intelligence.manaGain * (self:getSkillLevel(SKILL_INTELLIGENCE) - configPoints.initialIntelligencePoints)) )	-- changing mana max
			local skillDatabase = "skill_axe"
		    local newSkillValue = configPoints.initialIntelligencePoints
		    self:addSkillPoints(self:getSkillLevel(SKILL_INTELLIGENCE) - configPoints.initialIntelligencePoints)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
	    	return true
		else
			return false
		end
	elseif (skill == SKILL_FAITH) then
		if self:getSkillLevel(SKILL_FAITH) > configPoints.initialFaithPoints then
			self:setMaxMana(self:getMaxMana() - (faith.manaGain * (self:getSkillLevel(SKILL_FAITH) - configPoints.initialFaithPoints)) ) -- changing mana max
			local skillDatabase = "skill_sword"
		    local newSkillValue = configPoints.initialFaithPoints
		    self:addSkillPoints(self:getSkillLevel(SKILL_FAITH) - configPoints.initialFaithPoints)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
	    	return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_DEXTERITY) then
		if self:getSkillLevel(SKILL_DEXTERITY) > configPoints.initialDexterityPoints then
			local skillDatabase = "skill_dist"
		    local newSkillValue = configPoints.initialDexterityPoints
		    self:addSkillPoints(self:getSkillLevel(SKILL_DEXTERITY) - configPoints.initialDexterityPoints)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
	    	return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_RESISTANCE) then
		if self:getSkillLevel(SKILL_RESISTANCE) > configPoints.initialResistancePoints then
			self:setCapacity(self:getCapacity() - (resistance.capGain * 100) * (self:getSkillLevel(SKILL_RESISTANCE) - configPoints.initialResistancePoints)) -- changing cap max
			local skillDatabase = "skill_shielding"
		    local newSkillValue = configPoints.initialResistancePoints
		    self:addSkillPoints(self:getSkillLevel(SKILL_RESISTANCE) - configPoints.initialResistancePoints)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
	    	return true
	   	else
	   		return false
	   	end
	elseif (skill == SKILL_ENDURANCE) then
		if self:getSkillLevel(SKILL_ENDURANCE) > configPoints.initialEndurancePoints then
			self:setCapacity(self:getCapacity() - (endurance.capGain * 100 * (self:getSkillLevel(SKILL_ENDURANCE) - configPoints.initialEndurancePoints)) )	-- changing cap max
			self:setMaxHealth(self:getMaxHealth() - (endurance.healthGain * (self:getSkillLevel(SKILL_ENDURANCE) - configPoints.initialEndurancePoints)) )	-- changing health max
			local skillDatabase = "skill_fishing"
		    local newSkillValue = configPoints.initialEndurancePoints
		    self:addSkillPoints(self:getSkillLevel(SKILL_ENDURANCE) - configPoints.initialEndurancePoints)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
	    	return true
	    else
	    	return false
	    end
	else
		self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Error] Unknown skill")
	end
end

function Player:removeSkill(skill)

	local playerGuid = getPlayerGUID(self)

	if (skill == SKILL_MAGLEVEL) then
		if self:getMagicLevel() > configPoints.initialMagicPoints then
			self:setMaxMana(self:getMaxMana() - magic.manaGain) -- changing mana max
			local skillDatabase = "maglevel"
		    local newSkillValue = (self:getMagicLevel()) - 1	-- get player magic and set new value
		    self:addSkillPoints(3)								-- adds 3 points
		    doRemoveCreature(self)								-- force logout to update database with player off
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
			return true
		else
			return false
		end
	elseif (skill == SKILL_VITALITY) then
		if self:getSkillLevel(SKILL_VITALITY) > configPoints.initialVitalityPoints then
			self:setMaxHealth(self:getMaxHealth() - vitality.healthGain)	-- changing max health
			local skillDatabase = "skill_fist"
		    local newSkillValue = self:getSkillLevel(SKILL_VITALITY) - 1	-- get player skill and set new valye
		    self:addSkillPoints(1)											-- adds 1 point
		    doRemoveCreature(self)											-- force logout to update database with player off
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
	    	return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_STRENGHT) then
		if self:getSkillLevel(SKILL_STRENGHT) > configPoints.initialStrenghtPoints then 
			local skillDatabase = "skill_club"
		    local newSkillValue = self:getSkillLevel(SKILL_STRENGHT) - 1
		    self:addSkillPoints(1)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
			return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_INTELLIGENCE) then
		if self:getSkillLevel(SKILL_INTELLIGENCE) > configPoints.initialIntelligencePoints then
			self:setMaxMana(self:getMaxMana() - intelligence.manaGain)	-- changing mana max
			local skillDatabase = "skill_axe"
		    local newSkillValue = self:getSkillLevel(SKILL_INTELLIGENCE) - 1
		    self:addSkillPoints(1)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
			return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_FAITH) then
		if self:getSkillLevel(SKILL_FAITH) > configPoints.initialFaithPoints then
			self:setMaxMana(self:getMaxMana() - faith.manaGain)	-- changing mana max
			local skillDatabase = "skill_sword"
		    local newSkillValue = self:getSkillLevel(SKILL_FAITH) - 1
		    self:addSkillPoints(1)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
			return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_DEXTERITY) then
		if self:getSkillLevel(SKILL_DEXTERITY) > configPoints.initialDexterityPoints then
			self:changeSpeed(- dexterity.speedGain)	-- changing speed
			local skillDatabase = "skill_dist"
		    local newSkillValue = self:getSkillLevel(SKILL_DEXTERITY) - 1
		    self:addSkillPoints(1)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
			return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_RESISTANCE) then
		if self:getSkillLevel(SKILL_RESISTANCE) > configPoints.initialResistancePoints then
			self:setCapacity(self:getCapacity() - (resistance.capGain * 100)) 	-- changing cap max
			local skillDatabase = "skill_shielding"
		    local newSkillValue = self:getSkillLevel(SKILL_RESISTANCE) - 1
		    self:addSkillPoints(1)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
			return true
	    else
	    	return false
	    end
	elseif (skill == SKILL_ENDURANCE) then
		if self:getSkillLevel(SKILL_ENDURANCE) > configPoints.initialEndurancePoints then
			self:setCapacity(self:getCapacity() - (endurance.capGain * 100)) 	-- changing cap max
			self:setMaxHealth(self:getMaxHealth() - endurance.healthGain)		-- changing health max
			local skillDatabase = "skill_fishing"
		    local newSkillValue = self:getSkillLevel(SKILL_ENDURANCE) - 1
		    self:addSkillPoints(1)
		    doRemoveCreature(self)
	    	db.query("UPDATE `players` SET `" .. skillDatabase .. "` = " .. newSkillValue .. " WHERE `id` = " .. playerGuid .. ";")
			return true
	    else
	    	return false
	    end
	end
end

function Player:messageOnAdvance(skill)

    local faith = self:getSkillLevel(SKILL_FAITH)
    local intelligence = self:getSkillLevel(SKILL_INTELLIGENCE)

    if skill == SKILL_FAITH then
    	if faith == 9 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utevo lux (Light)")
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exiva (Find Person)")
	    elseif faith == 10 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exani tera (Magic Rope)")
	    elseif faith == 11 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exura (Light Healing)")
	    elseif faith == 12 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exana pox (Cure Poison)")
	    elseif faith == 13 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utevo gran lux (Great Light)")
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exani hur (Levitate)")
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Rod's maximum damage is on 110%")
	    elseif faith == 14 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo con (Conjure Arrow)")
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo pan (Create Food)")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utani hur (Haste)")
	    elseif faith == 15 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo grav pox (Create Cure Poison Rune)")
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exana flam (Cure Burning)")
	    elseif faith == 16 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exeta res (Challenge)")
            if intelligence >= 12 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo con pox (Conjure Poisoned Arrow)")
                if intelligence >= 16 then
                    self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adeta sio (Create Convince Creature Rune)")
                end
            end
	    elseif faith == 17 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utamo vita (Magic Shield)")
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo con mort (Conjure Bolt)")
	    elseif faith == 18 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exana vis (Cure Electrification)")
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Rod's maximum damage is on 120%")
	    elseif faith == 19 then
	    elseif faith == 20 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori blank (Create Blank Rune)")
	    elseif faith == 21 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exana kor (Cure Bleeding)")
	    elseif faith == 22 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exura gran (Intense Healing)")
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utevo res ina (Creature Illusion)")
            if intelligence >= 20 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo con flam (Conjure Explosive Arrow)")
            end
	    elseif faith == 23 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo con hur (Conjure Sniper Arrow)")
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Rod's maximum damage is on 130%")
	    elseif faith == 24 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utani gran hur (Strong Haste)")
	    elseif faith == 25 then
	    elseif faith == 25 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exana mort (Cure Curse)")
            if intelligence >= 25 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utevo res (Summon Creature)")
            end
	    elseif faith == 26 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utevo vis lux (Ultimate Light)")
	    elseif faith == 27 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo ina (Create Chameleon Rune)")
	    elseif faith == 28 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo con grav (Conjure Piercing Bolt)")
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Rod's maximum damage is on 140%")
	    elseif faith == 29 then
	    elseif faith == 30 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exura vita (Ultimate Healing)")
	    elseif faith == 31 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo con vis (Conjure Power Bolt))")
	    elseif faith == 32 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adura vita (Create Ultimate Healing Rune)")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori san (Holy Missile)")
	    elseif faith == 33 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Rod's maximum damage is on 150%")
	    elseif faith == 34 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori san (Create Holy Missile Rune)")
	    elseif faith == 35 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utana vid (Invisible)")
	    elseif faith == 36 then
	    elseif faith == 37 then
	    elseif faith == 38 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Rod's maximum damage is on 160%")
	    elseif faith == 39 then
	    elseif faith == 40 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exura sio (Heal Friend)")
	    elseif faith == 41 then
	    elseif faith == 42 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo mas san (Divine Caldera)")
	    elseif faith == 43 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo grav vita (Create Wild Growth Rune)")
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Rod's maximum damage is on 170%")
	    elseif faith == 44 then
	    elseif faith == 45 then
	        self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exura gran mas res (Mass Healing)")
	    elseif faith == 46 then
	   	elseif faith == 47 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utori san (Holy Flash)")
	    elseif faith == 48 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Rod's maximum damage is on 180%")
	    elseif faith == 49 then
	    elseif faith == 50 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utamo mas sio (Protect Party)")
	    elseif faith == 51 then
	    elseif faith == 52 then
	    elseif faith == 53 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utito mas sio (Train Party)")
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Rod's maximum damage is on 190%")
	    elseif faith == 54 then
	    elseif faith == 55 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utori mas sio (Enchant Party)")
	    elseif faith == 56 then
	    elseif faith == 57 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utura mas sio (Heal Party)")
	    elseif faith == 58 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Rod's maximum damage is on 200%")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Maximum faith skill reached.")
	    end

	elseif skill == SKILL_INTELLIGENCE then
		if intelligence == 9 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori infir vis (Buzz)")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori infir tera (Mud Attack)")
	    elseif intelligence == 10 then
            if self:getSkillLevel(SKILL_STRENGHT) >= 60 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori hur (Whirlwind Throw)")
            end
	    elseif intelligence == 11 then
            if self:getSkillLevel(SKILL_STRENGHT) >= 70 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori mas (Groundshaker)")
            end
	    elseif intelligence == 12 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori vis (Energy Strike)")

        elseif intelligence == 12 then
            if self:getSkillLevel(SKILL_FAITH) >= 16 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo con pox (Conjure Poisoned Arrow)")
            end
            if self:getSkillLevel(SKILL_STRENGHT) >= 80 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori (Berserk)")
            end

	    elseif intelligence == 13 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori tera (Terra Strike)")
            if self:getSkillLevel(SKILL_STRENGHT) >= 100 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran (Fierce Berserk)")
            end
	    elseif intelligence == 14 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori flam (Flame Strike)")
            if self:getSkillLevel(SKILL_STRENGHT) >= 110 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran ico (Annihilation)")
            end
	    elseif intelligence == 15 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori frigo (Ice Strike)")
	    elseif intelligence == 16 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo grav flam (Create Fire Field Rune)")
	    elseif intelligence == 16 then
            if self:getSkillLevel(SKILL_FAITH) >= 16 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adeta sio (Create Convince Creature Rune)")
            end
	    elseif intelligence == 17 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adito grav (Create Destroy Field Rune)")
	    elseif intelligence == 18 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori mort (Death Strike)")
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Wands's maximum damage is on 110%")
	    elseif intelligence == 19 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo grav vis (Create Energy Field Rune)")
        elseif intelligence == 20 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adito tera (Create Disintegrate Rune)")
            if self:getSkillLevel(SKILL_FAITH) >= 22 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo con flam (Conjure Explosive Arrow)")
            end
	    elseif intelligence == 21 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo flam hur (Fire Wave)")
	    elseif intelligence == 22 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo frigo hur (Ice Wave)")
	    elseif intelligence == 23 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo vis lux (Energy Beam)")
	    elseif intelligence == 24 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori vis (Create Heavy Magic Missile Rune)")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori tera (Create Stalagmite Rune)")
	    elseif intelligence == 25 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adana mort (Create Animate Dead Rune)")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo mas pox (Create Poison Bomb Rune)")
	    elseif intelligence == 25 then
            if self:getSkillLevel(SKILL_FAITH) >= 25 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utevo res (Summon Creature)")
            end
	    elseif intelligence == 26 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo mas flam (Create Fire Bomb Rune)")
	    elseif intelligence == 27 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori flam (Create Fireball Rune)")
	    elseif intelligence == 28 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori frigo (Create Icicle Rune)")
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Wands's maximum damage is on 120%")
	    elseif intelligence == 29 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori mas vis (Create Thunderstorm Rune)")
	    elseif intelligence == 30 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo gran vis lux (Great Energy Beam)")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori mas tera (Create Stone Shower Rune)")
	    elseif intelligence == 31 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo mas grav pox (Create Poison Wall Rune)")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utori flam (Ignite)")
	    elseif intelligence == 32 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo res flam (Create Soulfire Rune)")
	    elseif intelligence == 33 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori mas flam (Create Great Fireball Rune)")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori mas frigo (Create Avalanche Rune)")
	    elseif intelligence == 34 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo mas hur (Create Explosion Rune)")
	    elseif intelligence == 35 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utori vis (Electrify)")
	    elseif intelligence == 36 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo mas grav flam (Create Fire Wall Rune)")
	    elseif intelligence == 37 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo mas vis (Create Energy Bomb Rune)")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo grav tera (Create Magic Wall Rune)")
	    elseif intelligence == 38 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo vis hur (Energy Wave)")
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Wands's maximum damage is on 130%")
	    elseif intelligence == 39 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo tera hur (Terra Wave)")
	    elseif intelligence == 40 then
	    elseif intelligence == 41 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adevo mas grav vis (Create Energy Wall Rune)")
	    elseif intelligence == 42 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo gran frigo hur (Strong Ice Wave)")
	    elseif intelligence == 43 then
	    elseif intelligence == 44 then
	    elseif intelligence == 45 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adori gran mort (Create Sudden Death Rune)")
	    elseif intelligence == 46 then
	   	elseif intelligence == 47 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: adana ani (Create Paralyze Rune)")
	    elseif intelligence == 48 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Wands's maximum damage is on 140%")
	    elseif intelligence == 49 then
	    elseif intelligence == 50 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utori pox (Envenom)")
	    elseif intelligence == 51 then
	    elseif intelligence == 52 then
	    elseif intelligence == 53 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori amp vis (Lightning)")
	    elseif intelligence == 54 then
	    elseif intelligence == 55 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo gran mas tera (Wrath of Nature)")
	    elseif intelligence == 56 then
	    elseif intelligence == 57 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo gran mas vis (Rage of the Skies)")
	    elseif intelligence == 58 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Wands's maximum damage is on 150%")
	    elseif intelligence == 59 then
	    elseif intelligence == 60 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo gran mas frigo (Eternal Winter)")
	    elseif intelligence == 61 then
	    elseif intelligence == 62 then
	    elseif intelligence == 63 then
	    elseif intelligence == 64 then
	    elseif intelligence == 65 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exevo gran mas flam (Hell's Core)")
	    elseif intelligence == 66 then
	    elseif intelligence == 67 then
	    elseif intelligence == 68 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Wands's maximum damage is on 160%")
	    elseif intelligence == 69 then
	    elseif intelligence == 70 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran tera (Strong Terra Strike)")
	    elseif intelligence == 71 then
	    elseif intelligence == 72 then
	    elseif intelligence == 73 then
	    elseif intelligence == 74 then
	    elseif intelligence == 75 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran flam (Strong Flame Strike)")
	    elseif intelligence == 76 then
	    elseif intelligence == 77 then
	    elseif intelligence == 78 then         
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: utori mort (Curse)")
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Wands's maximum damage is on 170%")
	   	elseif intelligence == 79 then
	    elseif intelligence == 80 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran frigo (Strong Ice Strike)")
	    elseif intelligence == 81 then
	    elseif intelligence == 82 then
	    elseif intelligence == 83 then
	    elseif intelligence == 84 then
	    elseif intelligence == 85 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran vis (Strong Energy Strike)")
	    elseif intelligence == 86 then
	    elseif intelligence == 87 then
	    elseif intelligence == 88 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Wands's maximum damage is on 180%")
	    elseif intelligence == 89 then
	    elseif intelligence == 90 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori max flam (Ultimate Flame Strike)")
	   	elseif intelligence == 91 then
	    elseif intelligence == 92 then
	    elseif intelligence == 93 then
	    elseif intelligence == 94 then
	    elseif intelligence == 95 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori max tera (Ultimate Terra Strike)")
	    elseif intelligence == 96 then
	    elseif intelligence == 97 then
	    elseif intelligence == 98 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Wands's maximum damage is on 190%")
	    elseif intelligence == 99 then
	    elseif intelligence == 100 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori max vis (Ultimate Energy Strike)")
	    elseif intelligence == 101 then
	    elseif intelligence == 102 then
	    elseif intelligence == 103 then
	    elseif intelligence == 104 then
	    elseif intelligence == 105 then
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori max frigo (Ultimate Ice Strike)")
	    elseif intelligence == 106 then
	    elseif intelligence == 107 then
	    elseif intelligence == 108 then
	    	self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Wands's maximum damage is on 200%")
            self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Maximum intelligence skill reached.")
	    end

	elseif skill == SKILL_STRENGHT then
		if self:getSkillLevel(SKILL_STRENGHT) == 60 then
            if self:getSkillLevel(SKILL_INTELLIGENCE) < 10 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori hur (Whirlwind Throw) (needs intelligence 10)")
            else
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori hur (Whirlwind Throw)")
            end
        elseif self:getSkillLevel(SKILL_STRENGHT) == 70 then
            if self:getSkillLevel(SKILL_INTELLIGENCE) < 11 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori mas (Groundshaker) (needs intelligence 11)")
            else
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori mas (Groundshaker)")
            end
        elseif self:getSkillLevel(SKILL_STRENGHT) == 80 then
            if self:getSkillLevel(SKILL_INTELLIGENCE) < 12 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori (Berserk) (needs intelligence 12)")
            else
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori (Berserk)")
            end
        elseif self:getSkillLevel(SKILL_STRENGHT) == 100 then
            if self:getSkillLevel(SKILL_INTELLIGENCE) < 13 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran (Fierce Berserk) (needs intelligence 13)")
            else
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran (Fierce Berserk)")
            end
        elseif self:getSkillLevel(SKILL_STRENGHT) == 110 then
            if self:getSkillLevel(SKILL_INTELLIGENCE) < 14 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran ico (Annihilation) (needs intelligence 14)")
            else
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran ico (Annihilation)")
            end
		end

    elseif skill == SKILL_DEXTERITY then
        if self:getSkillLevel(SKILL_DEXTERITY) == 70 then
            if self:getSkillLevel(SKILL_INTELLIGENCE) < 12 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori con (Ethereal Spear) (needs intelligence 12)")
            else
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori con (Ethereal Spear)")
            end
        elseif self:getSkillLevel(SKILL_DEXTERITY) == 100 then
            if self:getSkillLevel(SKILL_INTELLIGENCE) < 14 then
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran con (Strong Ethereal Spear) (needs intelligence 14)")
            else
                self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New spell available: exori gran con (Strong Ethereal Spear)")
            end
        end
    end
    return true
end