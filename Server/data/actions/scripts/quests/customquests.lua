function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	-- unique ids (same values as on mapeditor)
	local config = {
		woodenSwordUniqueId = 1060,
		spearsRookUniqueId 	= 1061,
		theChillerUniqueId 	= 1062,
		theScorcherUniqueId = 1063,
		bowUniqueId 		= 1064,

		battleAxe = 1046,
		orcishAxe = 1047,
		morningStar = 1048,
		taurusMace = 1049,
		broadsword = 1050,
		spikeSword = 1051,
		spellbook = 1052,
		wandVortex = 1053,
		rodSnakebite = 1054,
		darkShield = 1055,
		crossbow = 1056,
		spears = 1057,

		gemmedLamp = 1065,
		necroQuest = 1031,
		obisidianKnife = 1007,
		stealthRing = 1008,

		towerShieldDeeperFibula = 1067,
		warriorHelmetDeeperFibula = 1068,
		dwarvenRingDeeperFibula = 1069,
		elvenAmuletDeeperFibula = 1070,
		knightAxeDeeperFibula = 1071,

		fireAxeQuest = 1072,
		dwarvenArmorQuest = 1073,
		crusaderHelmetQuest = 1074,

		arcaneStaffPoi = 1075,
		avengerPoi = 1076,
		arbalestPoi = 1077,

		demonArmorAnnihi = 1078,
		sovAnnihi = 1079,
		scaAnnihi = 1080,
		presentBoxAnnihi = 1081,
		annihiDoor = 1083,

		parchmentRoomQuest = 1082,
		
		dragonLanceRahemos = 1084,
		warHammerRahemos = 1085,
		giantSwordRahemos = 1086
		

	}

	-- Annihi Door (remove demons)
	if item.actionid == 1099 and item.uid == config.annihiDoor then
		local demonPosition = {
			{x = 33024, y = 31392, z = 14},
			{x = 33026, y = 31392, z = 14},
			--{x = 33028, y = 31394, z = 14},
			--{x = 33029, y = 31394, z = 14},
			{x = 33025, y = 31396, z = 14},
			{x = 33027, y = 31396, z = 14}
		}

		local tile1 = Tile(demonPosition[1])
		local tile2 = Tile(demonPosition[2])
		local tile3 = Tile(demonPosition[3])
		local tile4 = Tile(demonPosition[4])
		local tile5 = Tile(demonPosition[5])
		local tile6 = Tile(demonPosition[6])

		local demon1 = tile1:getTopVisibleThing(creature)
		local demon2 = tile2:getTopVisibleThing(creature)
		local demon3 = tile3:getTopVisibleThing(creature)
		local demon4 = tile4:getTopVisibleThing(creature)
		local demon5 = tile5:getTopVisibleThing(creature)
		local demon6 = tile6:getTopVisibleThing(creature)

		if demon1:isCreature() then
			demon1:remove()
		end
		if demon2:isCreature() then
			demon2:remove()
		end
		if demon3:isCreature() then
			demon3:remove()
		end
		if demon4:isCreature() then
			demon4:remove()
		end
		if demon5:isCreature() then
			demon5:remove()
		end
		if demon6:isCreature() then
			demon6:remove()
		end

	elseif item.actionid == 2001 then
	
		-- Wooden Sword Rook
		if item.uid == config.woodenSwordUniqueId then
			if player:getStorageValue(config.woodenSwordUniqueId) ~= 1 then
				player:addItem(13829, 1) -- wooden sword
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found an wooden sword.')
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Swords, axes and clubs have attack skill based on 100% of strenght skill and can be wielded with a shield or another weapon.")
				player:setStorageValue(config.woodenSwordUniqueId, 1)

				if player:getStorageValue(config.spearsRookUniqueId) ~= 1 and
				player:getStorageValue(config.theChillerUniqueId) ~= 1 and
			   	player:getStorageValue(config.theScorcherUniqueId) ~= 1 and
			   	player:getStorageValue(config.bowUniqueId) ~= 1 then
					player:addItem(2120, 1) -- rope
				end
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Spears Rook
		elseif item.uid == config.spearsRookUniqueId then
			if player:getStorageValue(config.spearsRookUniqueId) ~= 1 then
				player:addItem(2389,3)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found 3 spears.')
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "One-handed distance weapons have attack skill based on 100% of dexterity skill and can be wielded with a shield or another weapon.")
				player:setStorageValue(config.spearsRookUniqueId, 1)

				if player:getStorageValue(config.woodenSwordUniqueId) ~= 1 and
				player:getStorageValue(config.theChillerUniqueId) ~= 1 and
			   	player:getStorageValue(config.theScorcherUniqueId) ~= 1 and
			   	player:getStorageValue(config.bowUniqueId) ~= 1 then
					player:addItem(2120, 1) -- rope
				end
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- The Chiller Rod Rook
		elseif item.uid == config.theChillerUniqueId then
			if player:getStorageValue(config.theChillerUniqueId) ~= 1 then
				player:addItem(23721, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found the chiller rod.')
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Rod's maximum damage is increased by 2% each faith skill you advance.")
				player:setStorageValue(config.theChillerUniqueId, 1)

				if player:getStorageValue(config.woodenSwordUniqueId) ~= 1 and
				player:getStorageValue(config.spearsRookUniqueId) ~= 1 and
			   	player:getStorageValue(config.theScorcherUniqueId) ~= 1 and
			   	player:getStorageValue(config.bowUniqueId) ~= 1 then
					player:addItem(2120, 1) -- rope
				end
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- The Scorcher Wand Rook
		elseif item.uid == config.theScorcherUniqueId then
			if player:getStorageValue(config.theScorcherUniqueId) ~= 1 then
				player:addItem(23719, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found the scorcher wand.')
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Wands's maximum damage are increased by 1% each intelligence skill you advance.")
				player:setStorageValue(config.theScorcherUniqueId, 1)

				if player:getStorageValue(config.woodenSwordUniqueId) ~= 1 and
				player:getStorageValue(config.spearsRookUniqueId) ~= 1 and
			   	player:getStorageValue(config.theChillerUniqueId) ~= 1 and
			   	player:getStorageValue(config.bowUniqueId) ~= 1 then
					player:addItem(2120, 1) -- rope
				end
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Bow Rook
		elseif item.uid == config.bowUniqueId then
			if player:getStorageValue(config.bowUniqueId) ~= 1 then
				player:addItem(2456, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a bow and a quiver with some arrows.')
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Two-handed distance weapons have attack skill based on 75% of dexterity and 50% of strenght skill.")
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Put the quiver in the ammunition slot with arrows inside to shoot.")
				player:setStorageValue(config.bowUniqueId, 1)

				if player:getStorageValue(config.woodenSwordUniqueId) ~= 1 and
				player:getStorageValue(config.spearsRookUniqueId) ~= 1 and
			   	player:getStorageValue(config.theChillerUniqueId) ~= 1 and
			   	player:getStorageValue(config.theScorcherUniqueId) ~= 1 then
					player:addItem(2120, 1) -- rope
				end	
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Battle Axe
		elseif item.uid == config.battleAxe then
			if player:getStorageValue(config.battleAxe) ~= 1 then
				player:addItem(2378, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a battle axe.')
				player:setStorageValue(config.battleAxe, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Orcish Axe
		elseif item.uid == config.orcishAxe then
			if player:getStorageValue(config.orcishAxe) ~= 1 then
				player:addItem(2428, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found an orcish axe.')
				player:setStorageValue(config.orcishAxe, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Morning Star
		elseif item.uid == config.morningStar then
			if player:getStorageValue(config.morningStar) ~= 1 then
				player:addItem(2394,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a morning star.')
				player:setStorageValue(config.morningStar, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Taurus Mace
		elseif item.uid == config.taurusMace then
			if player:getStorageValue(config.taurusMace) ~= 1 then
				player:addItem(7425,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a taurus mace.')
				player:setStorageValue(config.taurusMace, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Broadsword
		elseif item.uid == config.broadsword then
			if player:getStorageValue(config.broadsword) ~= 1 then
				player:addItem(2413,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a broadsword.')
				player:setStorageValue(config.broadsword, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Spike Sword
		elseif item.uid == config.spikeSword then
			if player:getStorageValue(config.spikeSword) ~= 1 then
				player:addItem(2383,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a spike sword.')
				player:setStorageValue(config.spikeSword, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Spellbook of Enlightenment
		elseif item.uid == config.spellbook then
			if player:getStorageValue(config.spellbook) ~= 1 then
				player:addItem(8900,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a spellbook of enlightenment.')
				player:setStorageValue(config.spellbook, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Wand of Vortex
		elseif item.uid == config.wandVortex then
			if player:getStorageValue(config.wandVortex) ~= 1 then
				player:addItem(2190,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a wand of vortex.')
				player:setStorageValue(config.wandVortex, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Snakebite Rod
		elseif item.uid == config.rodSnakebite then
			if player:getStorageValue(config.rodSnakebite) ~= 1 then
				player:addItem(2182,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a snakebite rod.')
				player:setStorageValue(config.rodSnakebite, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Dark Shield
		elseif item.uid == config.darkShield then
			if player:getStorageValue(config.darkShield) ~= 1 then
				player:addItem(2521,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a dark shield.')
				player:setStorageValue(config.darkShield, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Crossbow Main
		elseif item.uid == config.crossbow then
			if player:getStorageValue(config.crossbow) ~= 1 then
				player:addItem(26382,1):addItem(2543, 50)
				player:addItem(2455,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a crossbow and a quiver with some arrows.')
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Two-handed distance weapons have attack skill based on 75% of dexterity and 50% of strenght skill.")
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Put the quiver in the ammunition slot with bolts inside to shoot.")
				player:setStorageValue(config.crossbow, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Spears Main
		elseif item.uid == config.spears then
			if player:getStorageValue(config.spears) ~= 1 then
				player:addItem(2389,3)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found 3 spears.')
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "One-handed distance weapons have attack skill based on 100% of dexterity skill and can be wielded with a shield or another weapon.")
				player:setStorageValue(config.spears, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Gemmed Lamp
		elseif item.uid == config.gemmedLamp then
			if player:getStorageValue(config.gemmedLamp) ~= 1 then
				player:addItem(2344,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a gemmed lamp.')
				player:setStorageValue(config.gemmedLamp, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'There is nothing here.')
			end

		-- Necro Quest
		elseif item.uid == config.necroQuest then
			if player:getStorageValue(config.necroQuest) ~= 1 then
				local bag = player:addItem(1987,1)
				bag:addItem(2656, 1)
				bag:addItem(2436, 1)
				bag:addItem(2536, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a bag.')
				player:setStorageValue(config.necroQuest, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Obsidian Knife
		elseif item.uid == config.obisidianKnife then
			if player:getStorageValue(config.obisidianKnife) ~= 1 then
				player:addItem(5908,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found an obsidian knife.')
				player:setStorageValue(config.obisidianKnife, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Stealth Ring
		elseif item.uid == config.stealthRing then
			if player:getStorageValue(config.stealthRing) ~= 1 then
				player:addItem(2165,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a stealth ring.')
				player:setStorageValue(config.stealthRing, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Tower Shield Deeper Fibula
		elseif item.uid == config.towerShieldDeeperFibula then
			if player:getStorageValue(config.towerShieldDeeperFibula) ~= 1 then
				player:addItem(2528,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a tower shield.')
				player:setStorageValue(config.towerShieldDeeperFibula, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'There is nothing here.')
			end

		-- Warrior Helmet Deeper Fibula
		elseif item.uid == config.warriorHelmetDeeperFibula then
			if player:getStorageValue(config.warriorHelmetDeeperFibula) ~= 1 then
				player:addItem(2475,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found an warrior helmet.')
				player:setStorageValue(config.warriorHelmetDeeperFibula, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Dwarven Ring Deeper Fibula
		elseif item.uid == config.dwarvenRingDeeperFibula then
			if player:getStorageValue(config.dwarvenRingDeeperFibula) ~= 1 then
				player:addItem(2213,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a dwarven ring.')
				player:setStorageValue(config.dwarvenRingDeeperFibula, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Elven Amulet Deeper Fibula
		elseif item.uid == config.elvenAmuletDeeperFibula then
			if player:getStorageValue(config.elvenAmuletDeeperFibula) ~= 1 then
				player:addItem(2198,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found an elven amulet.')
				player:setStorageValue(config.elvenAmuletDeeperFibula, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Knight Axe Deeper Fibula
		elseif item.uid == config.knightAxeDeeperFibula then
			if player:getStorageValue(config.knightAxeDeeperFibula) ~= 1 then
				player:addItem(2430,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a knight axe.')
				player:setStorageValue(config.knightAxeDeeperFibula, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Fire Axe Quest
		elseif item.uid == config.fireAxeQuest then
			if player:getStorageValue(config.fireAxeQuest) ~= 1 then
				player:addItem(2432,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a fire axe.')
				player:setStorageValue(config.fireAxeQuest, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Dwarven Armor Quest
		elseif item.uid == config.dwarvenArmorQuest then
			if player:getStorageValue(config.dwarvenArmorQuest) ~= 1 then
				local position = player:getPosition()
				local monster1 = Game.createMonster("Giant Spider", Position(33153,31333,12))
				local monster2 = Game.createMonster("Giant Spider", Position(33155,31333,12))
				if monster1 then
					monster1:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				end
				if monster2 then
					monster2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				end
				player:addItem(2503,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a dwarven armor.')
				player:setStorageValue(config.dwarvenArmorQuest, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Crusader Helmet Quest
		elseif item.uid == config.crusaderHelmetQuest then
			if player:getStorageValue(config.crusaderHelmetQuest) ~= 1 then
				player:addItem(2497,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a crusader helmet.')
				player:setStorageValue(config.crusaderHelmetQuest, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Arcane Staff Poi
		elseif item.uid == config.arcaneStaffPoi then
			if player:getStorageValue(config.arcaneStaffPoi) ~= 1 then
				player:addItem(2453,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found an arcane staff.')
				player:setStorageValue(config.arcaneStaffPoi, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- The Avenger Poi
		elseif item.uid == config.avengerPoi then
			if player:getStorageValue(config.arcaneStaffPoi) ~= 1 then
				player:addItem(6528,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found the avenger.')
				player:setStorageValue(config.arcaneStaffPoi, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Arbalest Poi
		elseif item.uid == config.arbalestPoi then
			if player:getStorageValue(config.arcaneStaffPoi) ~= 1 then
				player:addItem(5803,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found an arbalest.')
				player:setStorageValue(config.arcaneStaffPoi, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Demon Armor Annihi
		elseif item.uid == config.demonArmorAnnihi then
			if player:getStorageValue(config.demonArmorAnnihi) ~= 1 then
				player:addItem(2494,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a demon armor.')
				player:setStorageValue(config.demonArmorAnnihi, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Sov Annihi
		elseif item.uid == config.sovAnnihi then
			if player:getStorageValue(config.demonArmorAnnihi) ~= 1 then
				player:addItem(2494,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a magic sword.')
				player:setStorageValue(config.demonArmorAnnihi, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Sca Annihi
		elseif item.uid == config.scaAnnihi then
			if player:getStorageValue(config.demonArmorAnnihi) ~= 1 then
				player:addItem(2494,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a stonecutter axe.')
				player:setStorageValue(config.demonArmorAnnihi, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Present Box Annihi
		elseif item.uid == config.presentBoxAnnihi then
			if player:getStorageValue(config.demonArmorAnnihi) ~= 1 then
				player:addItem(2494,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a present box.')
				player:setStorageValue(config.demonArmorAnnihi, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		-- Parchment Room Quest
		elseif item.uid == config.parchmentRoomQuest then
			if player:getStorageValue(config.parchmentRoomQuest) ~= 1 then
				local position = player:getPosition()
				local monster1 = Game.createMonster("Demon", Position(32863,31346,15))
				local monster2 = Game.createMonster("Demon", Position(32867,31346,15))
				local monster3 = Game.createMonster("Demon", Position(32863,31350,15))
				local monster4 = Game.createMonster("Demon", Position(32867,31350,15))
				if monster1 then monster1:getPosition():sendMagicEffect(CONST_ME_TELEPORT) end
				if monster2 then monster2:getPosition():sendMagicEffect(CONST_ME_TELEPORT) end
				if monster3 then monster3:getPosition():sendMagicEffect(CONST_ME_TELEPORT) end
				if monster4 then monster4:getPosition():sendMagicEffect(CONST_ME_TELEPORT) end
				local bag = player:addItem(1987,1)
				bag:addItem(2165, 1)
				bag:addItem(2151, 2)
				bag:addItem(2230, 1)
				bag:addItem(2229, 1)
				bag:addItem(2091, 1)
				bag:addItem(1953, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a bag.')
				player:setStorageValue(config.parchmentRoomQuest, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end
			
		-- Dragon Lance Rahemos
		elseif item.uid == config.dragonLanceRahemos then
			if player:getStorageValue(config.dragonLanceRahemos) ~= 1 then
				player:addItem(2414,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a dragon lance.')
				player:setStorageValue(config.dragonLanceRahemos, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end
			
		-- War Hammer Rahemos
		elseif item.uid == config.warHammerRahemos then
			if player:getStorageValue(config.dragonLanceRahemos) ~= 1 then
				player:addItem(2391,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a war hammer.')
				player:setStorageValue(config.dragonLanceRahemos, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end
			
		-- Giant Sword Rahemos
		elseif item.uid == config.giantSwordRahemos then
			if player:getStorageValue(config.dragonLanceRahemos) ~= 1 then
				player:addItem(2393,1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a giant sword.')
				player:setStorageValue(config.dragonLanceRahemos, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
			end

		else
			return false
		end
	end
	return true
end
