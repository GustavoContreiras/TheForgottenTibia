local pointsStorage = 62490 				-- where the points are stored
local modalId = 4869						-- id of the modal window
local TextModalId = 4870 					-- so player may return to skill window
local skillPointsAdvanceStorage = 62491 	-- storage to avoid giving points twice for same level

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
    window:addButton(1, "Ok")   
    window:setDefaultEnterButton(1)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(self)
	return true
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
