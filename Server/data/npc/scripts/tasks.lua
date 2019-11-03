dofile('data/global.lua')

-- Monster Tasks by Limos
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local xmsg = {}
 
function onCreatureAppear(cid)  npcHandler:onCreatureAppear(cid)  end
function onCreatureDisappear(cid)  npcHandler:onCreatureDisappear(cid)  end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()  npcHandler:onThink()  end
 
local storage = KILLTASKS_STARTSTORAGE
local monsters = KILLTASKS_MONSTERS
local tasksString = "I have {tasks} to kill {trolls}, {orcs}, {rotworms}, {elves}, {minotaurs}, {amazons}, {ghouls}, {cyclops}, {vampires}, {necromancers}, {dragons}, {bog raiders}, {giant spiders}, {quara predators}, {heroes}, {dragon lords}, {frost dragons}, {hydras}, {behemoths}, {serpent spawns}, {grim reapers}, {demons} and {hellhounds}."
 
 
local function getItemsFromTable(itemtable)
     local text = ""
     for v = 1, #itemtable do
         count, info = itemtable[v].count, ItemType(itemtable[v].id)
         local ret = ", "
         if v == 1 then
             ret = ""
         elseif v == #itemtable then
             ret = " and "
         end
         text = text .. ret
         text = text .. (count > 1 and count or info:getArticle()).." "..(count > 1 and info:getPluralName() or info:getName())
     end
     return text
end
 
local function Cptl(f, r)
     return f:upper()..r:lower()
end
 
function creatureSayCallback(cid, type, msg)
 
    local player, cmsg = Player(cid), msg--:gsub("(%a)([%w_']*)", Cptl)
	
    if not npcHandler:isFocused(cid) then
        if msg == "hi" or msg == "hello" then
            npcHandler:addFocus(cid)
            if player:getStorageValue(storage) == -1 then
                local text, n = "",  0
                for k, x in pairs(monsters) do
                    if player:getStorageValue(x.countstorage) < x.amount then
                        n = n + 1
                        text = text .. ", "
                        text = text .. ""..x.amount.." {"..k.."}"
                    end
                end
                if n > 1 then
                    npcHandler:say("I have several {tasks} for you! Just tell me which {monsters} you want to kill!", cid)
                    npcHandler.topic[cid] = 1
                    xmsg[cid] = msg
                elseif n == 1 then
                    npcHandler:say("I have one last task for you"..text..".", cid)
                    npcHandler.topic[cid] = 1
                else
                    npcHandler:say("You already did all tasks, I have nothing for you to do anymore, good job though.", cid)
                end
            elseif player:getStorageValue(storage) == 1 then
                for k, x in pairs(monsters) do
                    if player:getStorageValue(x.statusstorage) == 1 then
                        npcHandler:say("Did you kill "..x.amount.." "..k.."? If you didn't and you dont't want to, you can ask me to {stop}. Also, I can {list} other {tasks} for you.", cid)
                        npcHandler.topic[cid] = 2
                        xmsg[cid] = k
                    end
                end
            end
        else
            return false
        end

    elseif monsters[cmsg] and npcHandler.topic[cid] == 1 then
        if player:getStorageValue(monsters[cmsg].statusstorage) == KILLTASKS_STATUS_NOT_DOING then
            npcHandler:say("Good luck, come back when you kill "..monsters[cmsg].amount.." "..monsters[cmsg].plural..".", cid)
            player:setStorageValue(storage, 1)
            player:setStorageValue(monsters[cmsg].statusstorage, KILLTASKS_STATUS_DOING)
        else
            npcHandler:say("You already did the "..monsters[cmsg].plural.." task.", cid)
        end
        npcHandler.topic[cid] = 0
    elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 2 then
        local x = monsters[xmsg[cid]]
        if player:getStorageValue(x.countstorage) >= x.amount then

	    local text = "Good job, here is your reward, "
	    for g = 1, #x.items do
                player:addItem(x.items[g].id, x.items[g].count)
            end
	    text = text .. getItemsFromTable(x.items)
	    if x.exp ~= 0 then
		player:addExperience(x.exp)
		text = text .. ", " .. x.exp .. " experience"
	    end
	    if x.skillpoints ~= 0 then
		player:addSkillPoints(x.skillpoints)
		player:addSkillPointsTotal(x.skillpoints)
		text = text .. ", " .. x.skillpoints .. " skillpoints"
	    end
	    if x.resets ~= 0 then
		player:addResetsCount(x.resets) 
		text = text .. ", " .. x.resets .. " reset"
	    end
	    if x.mount ~= 0 and x.mount ~= "" then
		player:addMount(MOUNTS[x.mount].id) 
		text = text .. ", " .. x.mount:lower() .. " mount"
	    end
	    text = text .. "."
            npcHandler:say(text, cid)

            player:setStorageValue(x.statusstorage, KILLTASKS_STATUS_DONE)
            player:setStorageValue(storage, -1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	    npcHandler:releaseFocus(cid)
        else
            npcHandler:say("You didn't kill them all, you still need to kill "..x.amount -(player:getStorageValue(x.countstorage) + 1).." "..xmsg[cid]..".", cid)
        end
		
    elseif msgcontains(msg, "no") and npcHandler.topic[cid] == 1 then
        npcHandler:say("Ok then.", cid)
        npcHandler.topic[cid] = 0        
		
    elseif msgcontains(msg, "stop") then
        local text, n = "",  0
        for k, x in pairs(monsters) do
            if player:getStorageValue(x.countstorage) < x.amount then
                n = n + 1
                text = text .. (n == 1 and "" or ", ")
                text = text .. "{"..k.."}"
                if player:getStorageValue(x.statusstorage) == KILLTASKS_STATUS_DOING then
                     player:setStorageValue(x.statusstorage, KILLTASKS_STATUS_NOT_DOING)
                end
            end
        end
        if player:getStorageValue(storage) == KILLTASKS_STATUS_DOING then
            npcHandler:say("Alright, let me know if you want to continue an other task, you can still choose "..text..".", cid)
        else
            npcHandler:say("You didn't start any new task yet, if you want to start one, you can choose "..text..".", cid)
        end
        player:setStorageValue(storage, KILLTASKS_STATUS_NOT_DOING)
        npcHandler.topic[cid] = 1
		
    elseif msgcontains(msg, "tasks") or msgcontains(msg, "task") or msgcontains(msg, "list") or msgcontains(msg, "monsters") then
        local text = ""
	local read = ""
        for k, x in pairs(monsters) do
	    if x.onlist == 1 then
		if player:getStorageValue(x.countstorage) < x.amount then
		        text = text .. string.gsub(" " .. k, "%W%l", string.upper):sub(2) .. " [" .. (player:getStorageValue(x.countstorage) + 1) .. "/" .. x.amount .. "]:\n  "
				text = text .. getItemsFromTable(x.items) .. "\n  "
				if (x.exp ~= 0) then
					text = text .. x.exp .. " experience\n  "
				end
				if (x.skillpoints ~= 0) then
					text = text .. x.skillpoints .. " skillpoints\n  "
				end
				if (x.resets ~= 0) then
					text = text .. x.resets .. " reset\n  "
				end
				if (x.mount ~= 0) then
					text = text .. x.mount:lower():gsub("^%l", string.upper) .. " mount\n"
				end
				text = text .. "\n"
		else
			text = text .. string.gsub(" "..k, "%W%l", string.upper):sub(2) .." ["..x.amount.."/"..x.amount.."]: DONE\n\n"
		end
	    end
	    read = read .. x.plural .. " "
        end
        player:showTextDialog(1949, "" .. text)
	npcHandler:say(tasksString, cid)

    elseif msgcontains(msg, "bye") then
        npcHandler:say("Bye.", cid)
        npcHandler:releaseFocus(cid)
    end
    return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
 

