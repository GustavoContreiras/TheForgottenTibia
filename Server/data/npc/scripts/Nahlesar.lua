local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)			
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)			
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)		
end
function onThink()
	local npc = getNpcCid()
	if (getCreatureOutfit(npc).lookType == 80) then
     		doCreatureChangeOutfit(npc, {lookType = 51})
	else 
     		doCreatureChangeOutfit(npc, {lookType = 80})  
	end
	npcHandler:onThink()			
end

function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(not npcHandler:isFocused(cid)) then
			return false
	end	
		
	if isInArray({"enchanted chicken wing", "boots of haste"}, msg:lower()) then
        npcHandler:say('Do you want to trade Boots of haste for Enchanted Chicken Wind?', cid)
        talk_state = 1 
	elseif isInArray({"warrior Sweat", "warrior helmet"}, msg:lower()) then
        npcHandler:say('Do you want to trade 4 Warrior Helmet for Warrior Sweat?', cid)
        talk_state = 2 
	elseif isInArray({"fighting Spirit", "royal helmet"}, msg:lower()) then
        npcHandler:say('Do you want to trade 2 Royal Helmet for Fighting Spirit', cid)       
        talk_state = 3
	elseif isInArray({"magic sulphur", "fire sword"}, msg:lower()) then
        npcHandler:say('Do you want to trade 3 Fire Sword for Magic Sulphur', cid) 
        talk_state = 4
	elseif isInArray({"job", "items"}, msg:lower()) then
        npcHandler:say('I trade Enchanted Chicken Wing for Boots of Haste, Warrior Sweat for 4 Warrior Helmets, Fighting Spirit for 2 Royal Helmet Magic Sulphur for 3 Fire Swords', cid)
		talk_state = 0
		
	elseif msgcontains(msg,'yes') and talk_state <= 4 and talk_state >= 1 then
	
		local trade = {
				{NeedItem = 2195, Ncount = 1, GiveItem = 5891, Gcount = 1}, -- Enchanted Chicken Wing
				{NeedItem = 2475, Ncount = 4, GiveItem = 5885, Gcount = 1}, -- Flask of Warrior's Sweat
				{NeedItem = 2498, Ncount = 2, GiveItem = 5884, Gcount = 1}, -- Spirit Container
				{NeedItem = 2392, Ncount = 3, GiveItem = 5904, Gcount = 1}, -- Magic Sulphur
				}

        if player:getItemCount(trade[talk_state].NeedItem) >= trade[talk_state].Ncount then
			player:removeItem(trade[talk_state].NeedItem, trade[talk_state].Ncount)
			player:addItem(trade[talk_state].GiveItem, trade[talk_state].Gcount)
			return npcHandler:say(msg,'Here you are')						
        else
            npcHandler:say('Sorry but you don\'t have the item', player)
        end
 
	elseif msgcontains(msg,'no') and (talk_state >= 1 and talk_state <= 5) then
		 npcHandler:say(msg,'Ok then', player)
		 talk_state = 0
		 npcHandler:releaseFocus(cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
