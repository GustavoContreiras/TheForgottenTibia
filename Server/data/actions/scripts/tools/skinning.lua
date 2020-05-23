local config = {
	[5908] = {
	
	-- rabbits vikingtibia
		[2992] = {value = 25000, newItem = 13159, after = 2993},
		
		
		-- Minotaurs
		[2830] = {value = 25000, newItem = 5878}, -- minotaur
		[2871] = {value = 25000, newItem = 5878}, -- mino archer
		[2866] = {value = 25000, newItem = 5878}, -- mino mage
		[2876] = {value = 25000, newItem = 5878}, -- mino guard
		[3090] = {value = 25000, newItem = 5878}, -- minotaur 
		[23463] = {value = 25000, newItem = 5878}, -- mooh'tah warrior 
		[23467] = {value = 25000, newItem = 5878}, -- minotaur hunter 
		[23471] = {value = 25000, newItem = 5878}, -- worm priestess

		-- Low Class Lizards
		[4259] = {value = 25000, newItem = 5876}, -- lizard sentinel 
		[4262] = {value = 25000, newItem = 5876}, -- lizard snakecharmer 
		[4256] = {value = 25000, newItem = 5876}, -- lizard templar

		-- High Class Lizards
		[11285] = {value = 25000, newItem = 5876}, -- lizard chosen
		[11277] = {value = 25000, newItem = 5876}, -- lizard dragon priest 
		[11269] = {value = 25000, newItem = 5876}, -- lizard high guard 
		[11281] = {value = 25000, newItem = 5876}, -- lizard zaogun 

		-- Dragons
		[3104] = {value = 25000, newItem = 5877}, -- dragon
		[2844] = {value = 25000, newItem = 5877}, -- dragon 

		-- Dragon Lords
		[2881] = {value = 25000, newItem = 5948}, -- dragon lord 

		-- Behemoths
		[2931] = {value = 35000, newItem = 5893}, -- behemoth

		-- Bone Beasts
		[3031] = {value = 25000, newItem = 5925}, -- bonebeast

		-- The Mutated Pumpkin
		[8961] = { { value = 5000, newItem = 7487 }, { value = 10000, newItem = 7737 }, { value = 20000, 6492 }, { value = 30000, newItem = 8860 }, { value = 45000, newItem = 2683 }, { value = 60000, newItem = 2096 }, { value = 90000, newItem = 9005, amount = 50 } },

		-- Marble
		[11343] = { {value = 10000, newItem = 11345, desc = "This shoddy work was made by |PLAYERNAME|." }, {value = 35000, newItem = 11345, desc = "This little figurine made by |PLAYERNAME| has some room for improvement." }, { value = 60000, newItem = 11346, desc = "This little figurine of Tibiasula was masterfully sculpted by |PLAYERNAME|." } },

		-- Ice Cube
		[7441] = {value = 25000, newItem = 7444},
		[7442] = {value = 25000, newItem = 7444},
		[7444] = {value = 25000, newItem = 7445},
		[7445] = {value = 25000, newItem = 7446},
	},
	[5942] = {
		-- Demon
		[2916] = {value = 25000, newItem = 5906}, -- demon

		-- Vampires
		[2956] = {value = 25000, newItem = 5905}, -- vampire
		[9654] = {value = 25000, newItem = 5905, after = 9658}, -- vampire bride
		[8938] = {value = 25000, newItem = 5905}, -- vampire lord 
		[21275] = {value = 25000, newItem= 5905} -- vampire viscount 
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local skin = config[item.itemid][target.itemid]

	-- Wrath of the emperor quest
	if item.itemid == 5908 and target.itemid == 12295 then
		target:transform(12287)
		player:say("You carve a solid bowl of the chunk of wood.", TALKTYPE_MONSTER_SAY)
	-- An Interest In Botany Quest
	elseif item.itemid == 5908 and target.itemid == 11691 and player:getItemCount(12655) > 0 and player:getStorageValue(Storage.TibiaTales.AnInterestInBotany) == 1 then
		player:say("The plant feels cold but dry and very soft. You streak the plant gently with your knife and put a fragment in the almanach.", TALKTYPE_MONSTER_SAY)
		player:setStorageValue(Storage.TibiaTales.AnInterestInBotany, 2)
	elseif item.itemid == 5908 and target.itemid == 11653 and player:getItemCount(12655) > 0 and player:getStorageValue(Storage.TibiaTales.AnInterestInBotany) == 2 then
		player:say("You cut a leaf from a branch and put it in the almanach. It smells strangely sweet and awfully bitter at the same time.", TALKTYPE_MONSTER_SAY)
		player:setStorageValue(Storage.TibiaTales.AnInterestInBotany, 3)
		
		elseif item.itemid == 5908 and target.itemid == 9009 and player:getStorageValue(789100) <= 1 then
		player:say("You got Neutral matter.", TALKTYPE_MONSTER_SAY)
		player:addItem(8310, 1)
		player:setStorageValue(789100, 1)
		
		elseif item.itemid == 5908 and target.itemid == 9010 and player:getStorageValue(789100) <= 1 then
		player:say("You got Neutral matter.", TALKTYPE_MONSTER_SAY)
		player:addItem(8310, 1)
		player:setStorageValue(789100, 2)
	end

	if not skin then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return true
	end

	local random, effect, transform = math.random(1, 100000), CONST_ME_MAGIC_GREEN, true
	if type(skin[1]) == 'table' then
		local added = false
		local _skin
		for i = 1, #skin do
			_skin = skin[i]
			if random <= _skin.value then
				if target.itemid == 11343 then
					effect = CONST_ME_ICEAREA
					local gobletItem = player:addItem(_skin.newItem, _skin.amount or 1)
					if gobletItem then
						gobletItem:setDescription(_skin.desc:gsub('|PLAYERNAME|', player:getName()))
					end
					added = true
				elseif isInArray({7441, 7442, 7444, 7445}, target.itemid) then
					player:addItem(_skin.newItem, _skin.amount or 1)
					effect = CONST_ME_HITAREA
					added = true
				else
					player:addItem(_skin.newItem, _skin.amount or 1)
					added = true
				end
				break
			end
		end

		if not added and target.itemid == 8961 then
			effect = CONST_ME_POFF
			transform = false
		end
	elseif random <= skin.value then
		if target.itemid == 11343 then
			effect = CONST_ME_ICEAREA
			local gobletItem = player:addItem(skin.newItem, skin.amount or 1)
			if gobletItem then
				gobletItem:setDescription(skin.desc:gsub('|PLAYERNAME|', player:getName()))
			end
		elseif isInArray({7441, 7442, 7444, 7445}, target.itemid) then
			if skin.newItem == 7446 then
				player:addAchievement('Ice Sculptor')
			end
			player:addItem(skin.newItem, skin.amount or 1)
			effect = CONST_ME_HITAREA
		else
			player:addItem(skin.newItem, skin.amount or 1)
		end
	else
		if isInArray({7441, 7442, 7444, 7445}, target.itemid) then
			player:say('The attempt of sculpting failed miserably.', TALKTYPE_MONSTER_SAY)
			effect = CONST_ME_HITAREA
			
		else
			effect = CONST_ME_POFF
		end
	end
	-- SE BUGAR, PEGAR SCRIPT ANTIGO
	toPosition:sendMagicEffect(effect)
	if transform and not isInArray({7442}, target.itemid) then
		target:transform(skin.after or target.itemid + 1)
		else 
		target:remove()		
	end

	return true
end