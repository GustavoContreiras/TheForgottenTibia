local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local talkState = {}
local rtnt = {}
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()                             npcHandler:onThink()                         end

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. I need your help and I'll reward you with nice addons if you help me! Just say {addons} or {help} if you don't know what to do.")

addoninfo = {
['first citizen addon'] 		= {cost = 0, items = {{5878,20}}, 									outfit_female = 136, outfit_male = 128, addon = 1, storageID = 10042},
['second citizen addon'] 		= {cost = 0, items = {{5890,50}, {5902,25}, {2480,1}}, 				outfit_female = 136, outfit_male = 128, addon = 2, storageID = 10043},
['first hunter addon'] 			= {cost = 0, items = {{5876,50}, {5948,50}, {5891,5}, {5887,1}, {5889,1}, {5888,1}}, outfit_female = 137, outfit_male = 129, addon = 1, storageID = 10044},
['second hunter addon'] 		= {cost = 0, items = {{5875,1}}, 									outfit_female = 137, outfit_male = 129, addon = 2, storageID = 10045},
['first knight addon'] 			= {cost = 0, items = {{5880,50}, {5892,1}}, 						outfit_female = 139, outfit_male = 131, addon = 1, storageID = 10046},
['second knight addon'] 		= {cost = 0, items = {{5893,50}, {11422,1}, {5885,1}, {5887,1}}, 	outfit_female = 139, outfit_male = 131, addon = 2, storageID = 10047},
['first mage addon'] 			= {cost = 0, items = {{2182,1}, {2186,1}, {2185,1}, {8911,1}, {2181,1}, {2183,1}, {2190,1}, {2191,1}, {2188,1}, {8921,1}, {2189,1}, {2187,1}, {2392,30}, {5809,1}, {2193,20}}, outfit_female = 138, outfit_male = 130, addon = 1, storageID = 10048},
['second mage addon'] 			= {cost = 0, items = {{5903,1}}, 									outfit_female = 138, outfit_male = 130, addon = 2, storageID = 10049},
['first summoner addon'] 		= {cost = 0, items = {{5878,20}}, 									outfit_female = 141, outfit_male = 133, addon = 1, storageID = 10050},
['second summoner addon'] 		= {cost = 0, items = {{5894,35}, {5911,20}, {5883,40}, {5922,35}, {5879,10}, {5881,30}, {5882,40}, {2392,3}, {5905,30}}, outfit_female = 141, outfit_male = 133, addon = 2, storageID = 10051},
['first barbarian addon'] 		= {cost = 0, items = {{5884,1}, {5885,1}, {5910,25}, {5911,25}, {5886,10}}, outfit_female = 147, outfit_male = 143, addon = 1, storageID = 10011},
['second barbarian addon'] 		= {cost = 0, items = {{5880,25}, {5892,1}, {5893,25}, {5876,25}}, 	outfit_female = 147, outfit_male = 143, addon = 2, storageID = 10012},
['first druid addon'] 			= {cost = 0, items = {{5896,20}, {5897,20}}, 						outfit_female = 148, outfit_male = 144, addon = 1, storageID = 10013},
['second druid addon'] 			= {cost = 0, items = {{5906,100}}, 									outfit_female = 148, outfit_male = 144, addon = 2, storageID = 10014},
['first nobleman addon'] 		= {cost = 50000, items = {}, 										outfit_female = 140, outfit_male = 132, addon = 1, storageID = 10015},
['second nobleman addon'] 		= {cost = 50000, items = {}, 										outfit_female = 140, outfit_male = 132, addon = 2, storageID = 10016},
['first oriental addon'] 		= {cost = 0, items = {{5945,1}}, 									outfit_female = 150, outfit_male = 146, addon = 1, storageID = 10017},
['second oriental addon'] 		= {cost = 0, items = {{5883,30}, {5895,30}, {5891,2}, {5912,30}}, 	outfit_female = 150, outfit_male = 146, addon = 2, storageID = 10018},
['first warrior addon'] 		= {cost = 0, items = {{5925,40}, {5899,40}, {5884,1}, {5919,1}}, 	outfit_female = 142, outfit_male = 134, addon = 1, storageID = 10019},
['second warrior addon'] 		= {cost = 0, items = {{5880,40}, {5887,1}}, 						outfit_female = 142, outfit_male = 134, addon = 2, storageID = 10020},
['first wizard addon'] 			= {cost = 0, items = {{2536,1}, {2492,1}, {2488,1}, {2123,1}}, 		outfit_female = 149, outfit_male = 145, addon = 1, storageID = 10021},
['second wizard addon'] 		= {cost = 0, items = {{5922,40}}, 									outfit_female = 149, outfit_male = 145, addon = 2, storageID = 10022},
['first assassin addon'] 		= {cost = 0, items = {{5912,20}, {5910,20}, {5911,20}, {5913,20}, {5914,20}, {5909,20}, {5886,10}}, outfit_female = 156, outfit_male = 152, addon = 1, storageID = 10023},
['second assassin addon'] 		= {cost = 0, items = {{5804,1}, {5930,10}}, 						outfit_female = 156, outfit_male = 152, addon = 2, storageID = 10024},
['first beggar addon'] 			= {cost = 0, items = {{5878,30}, {5921,20}, {5913,10}, {5894,10}}, 	outfit_female = 157, outfit_male = 153, addon = 1, storageID = 10025},
['second beggar addon'] 		= {cost = 0, items = {{5883,30}, {2160,2}}, 						outfit_female = 157, outfit_male = 153, addon = 2, storageID = 10026},
['first pirate addon'] 			= {cost = 0, items = {{6098,30}, {6126,30}, {6097,30}}, 			outfit_female = 155, outfit_male = 151, addon = 1, storageID = 10027},
['second pirate addon'] 		= {cost = 0, items = {{6101,1}, {6102,1}, {6100,1}, {6099,1}}, 		outfit_female = 155, outfit_male = 151, addon = 2, storageID = 10028},
['first shaman addon'] 			= {cost = 0, items = {{5810,5}, {3955,5}, {5015,1}}, 				outfit_female = 158, outfit_male = 154, addon = 1, storageID = 10029},
['second shaman addon'] 		= {cost = 0, items = {{3966,5}, {3967,5}}, 							outfit_female = 158, outfit_male = 154, addon = 2, storageID = 10030},
['first norseman addon'] 		= {cost = 0, items = {{7290,5}}, 									outfit_female = 252, outfit_male = 251, addon = 1, storageID = 10031},
['second norseman addon'] 		= {cost = 0, items = {{7290,10}}, 									outfit_female = 252, outfit_male = 251, addon = 2, storageID = 10032},
['first jester addon'] 			= {cost = 0, items = {{5912,20}, {5913,20}, {5914,20}, {5909,20}}, 	outfit_female = 270, outfit_male = 273, addon = 1, storageID = 10033},
['second jester addon'] 		= {cost = 0, items = {{5912,20}, {5910,20}, {5911,20}, {5912,20}}, 	outfit_female = 270, outfit_male = 273, addon = 2, storageID = 10034},
['first demonhunter addon'] 	= {cost = 0, items = {{5905,30}, {5906,40}, {5954,20}, {6500,50}}, 	outfit_female = 288, outfit_male = 289, addon = 1, storageID = 10035},
['second demonhunter addon'] 	= {cost = 0, items = {{5906,50}, {6500,200}}, 						outfit_female = 288, outfit_male = 289, addon = 2, storageID = 10036},
['first nightmare addon'] 		= {cost = 0, items = {{6500,750}}, 									outfit_female = 269, outfit_male = 268, addon = 1, storageID = 10037},
['second nightmare addon'] 		= {cost = 0, items = {{6500,750}}, 									outfit_female = 269, outfit_male = 268, addon = 2, storageID = 10038},
['first brotherhood addon'] 	= {cost = 0, items = {{6500,750}}, 									outfit_female = 279, outfit_male = 278, addon = 1, storageID = 10039},
['second brotherhood addon'] 	= {cost = 0, items = {{6500,750}}, 									outfit_female = 279, outfit_male = 278, addon = 2, storageID = 10040},
['first yalaharian addon'] 		= {cost = 0, items = {{9955,1}}, 									outfit_female = 324, outfit_male = 325, addon = 1, storageID = 10041},
['second yalaharian addon'] 	= {cost = 0, items = {{9955,1}}, 									outfit_female = 324, outfit_male = 325, addon = 2, storageID = 10041}
-- next storage 10052	-- next storage 10052	-- next storage 10052	-- next storage 10052	-- next storage 10052	-- next storage 10052	-- next storage 10052 --
}
local o = {'citizen', 'hunter', 'knight', 'mage', 'nobleman', 'summoner', 'warrior', 'barbarian', 'druid', 'wizard', 'oriental', 'pirate', 'assassin', 'beggar', 'shaman', 'norseman', 'nighmare', 'jester', 'yalaharian', 'brotherhood'}
function creatureSayCallback(cid, type, msg)
local talkUser = cid

	if(not npcHandler:isFocused(cid)) then
		return false
	end

	if addoninfo[msg] ~= nil then
		if (getPlayerStorageValue(cid, addoninfo[msg].storageID) ~= -1) then
				npcHandler:say('You already have this addon!', cid)
				npcHandler:resetNpc()
		else
		local itemsTable = addoninfo[msg].items
		local items_list = ''
			if table.maxn(itemsTable) > 0 then
				for i = 1, table.maxn(itemsTable) do
					local item = itemsTable[i]
					items_list = items_list .. item[2] .. ' ' .. ItemType(item[1]):getName()
					if i ~= table.maxn(itemsTable) then
						items_list = items_list .. ', '
					end
				end
			end
		local text = ''
			if (addoninfo[msg].cost > 0) then
				text = addoninfo[msg].cost .. ' gold coins'
			elseif table.maxn(addoninfo[msg].items) then
				text = items_list
			elseif (addoninfo[msg].cost > 0) and table.maxn(addoninfo[msg].items) then
				text = items_list .. ' and ' .. addoninfo[msg].cost .. ' gold coins'
			end
			npcHandler:say('For ' .. msg .. ' you will need ' .. text .. '. Do you have it all with you?', cid)
			rtnt[talkUser] = msg
			talkState[talkUser] = addoninfo[msg].storageID
			return true
		end
	elseif msgcontains(msg, "yes") then
		if (talkState[talkUser] > 10010 and talkState[talkUser] < 10100) then
			local items_number = 0
			if table.maxn(addoninfo[rtnt[talkUser]].items) > 0 then
				for i = 1, table.maxn(addoninfo[rtnt[talkUser]].items) do
					local item = addoninfo[rtnt[talkUser]].items[i]
					if (getPlayerItemCount(cid,item[1]) >= item[2]) then
						items_number = items_number + 1
					end
				end
			end
			if(getPlayerMoney(cid) >= addoninfo[rtnt[talkUser]].cost) and (items_number == table.maxn(addoninfo[rtnt[talkUser]].items)) then
				doPlayerRemoveMoney(cid, addoninfo[rtnt[talkUser]].cost)
				if table.maxn(addoninfo[rtnt[talkUser]].items) > 0 then
					for i = 1, table.maxn(addoninfo[rtnt[talkUser]].items) do
						local item = addoninfo[rtnt[talkUser]].items[i]
						doPlayerRemoveItem(cid,item[1],item[2])
					end
				end
				doPlayerAddOutfit(cid, addoninfo[rtnt[talkUser]].outfit_male, addoninfo[rtnt[talkUser]].addon)
				doPlayerAddOutfit(cid, addoninfo[rtnt[talkUser]].outfit_female, addoninfo[rtnt[talkUser]].addon)
				setPlayerStorageValue(cid,addoninfo[rtnt[talkUser]].storageID,1)
				npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('You do not have needed items!', cid)
			end
			rtnt[talkUser] = nil
			talkState[talkUser] = 0
			npcHandler:resetNpc()
			return true
		end
	elseif msgcontains(msg, "addon") then
		npcHandler:say('I can give you addons for {' .. table.concat(o, "}, {") .. '} outfits. Just say \'first OUTFIT addon\'.', cid)
		rtnt[talkUser] = nil
		talkState[talkUser] = 0
		npcHandler:resetNpc()
		return true
	elseif msgcontains(msg, "help") then
		npcHandler:say('To buy the first addon say \'first NAME addon\', for the second addon say \'second NAME addon\'.', cid)
		rtnt[talkUser] = nil
		talkState[talkUser] = 0
		npcHandler:resetNpc()
		return true
	else
		if talkState[talkUser] ~= nil then
			if talkState[talkUser] > 0 then
			npcHandler:say('Come back when you get these items.', cid)
			rtnt[talkUser] = nil
			talkState[talkUser] = 0
			npcHandler:resetNpc()
			return true
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())