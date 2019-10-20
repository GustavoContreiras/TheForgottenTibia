local modalId = 4869						-- id of the modal window
local TextModalId = 4870 					-- so player may return to skill window

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
 	local message = "One-handed melee weapons are based 100% on strenght skill.\n\nYou can use them with a shield, like the classic gameplay, or with another melee or one-handed distance weapon, then you will be in dual wield mode that fixes your attack speed in 200% but downgrades your weapon attack to 90%.\n\nDefence skill just works if you are wearing a shield and uses 100% of its value.\n\n"
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
 	local message = "One-handed distance weapons uses 100% of your dexterity skill.\n\nIf you want to play as an one-handed ranger that uses a shield, your main skills will be dexterity and defence.\n"
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
 	local message = "Two-handed distance weapons uses 75% of your dexterity and 75% of your strenght skill.\n\nIf you want to play as a two-handed ranger, your main skills will be dexterity and strenght.\n"
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
 	local message = "From level 1 to 7, you will receive 2 points per level.\nFrom level 8 to 39, you will receive 4 points per level.\nFrom level 40 to 59, you will receive 3 points per level.\nFrom level 60 to 79, you will receive 2 points per level.\nAfter level 80, you will receive 1 point per level.\n\nYou will start in the beginner island and, when you reach level 8, you will have to talk to The Oracle to reborn in Rhyves.\n\nThere is a Guide NPC in the temple of Rhyves that can reset your skills and give you some tips.\nThe first reset is for free, but after that it will cost a value based on your level.\n\nThere are new stats available in the skill panel: walk speed and attack speed.\n\nThe donkey mount gives +3 speed and can be get by talking to Palomino in the south gate of Rhyves.\n\n\n\n"
    local window = ModalWindow(4877, title, message)
    window:addButton(1, "Ok")   
    window:setDefaultEnterButton(1)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(self)
	return true
end
