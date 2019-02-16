
	        
function onUse(cid, item, fromPosition, itemEx, toPosition, isHotkey) 

	local timeToReset = 3 -- Time to reset the quest in minutes.
	local objectId = 1498 -- Id of the item Blocking the pathlocal 

	p = {   
		Position(33071, 31350, 11), -- Position of the item blocking the path
		Position(33070, 31350, 11) 	-- Position of the item blocking the path
	}

	local blockingItem1 = Tile(p[1])    
	local blockingItem2 = Tile(p[2])   

	    if item.itemid == 1945 and item.actionid == 1110 then 

	    	if timeToReset > 1 then     
				cid:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The magic wall has been removed for ' .. timeToReset .. ' minutes.') 
			else
				cid:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The magic wall has been removed for ' .. timeToReset .. ' minute.')
			end

			Item(item.uid):transform(1946)

			if not blockingItem1:getItemById(objectId) then
				return false
			else
				blockingItem1:getItemById(objectId):remove()
			end

			addEvent(
				function(blockingItem1)
					Game.createItem(objectId, 1, blockingItem1) 
					blockingItem1:sendMagicEffect(CONST_ME_TELEPORT)            
					p[2]:sendMagicEffect(CONST_ME_POFF)                      
					Tile(toPosition):getItemById(1946):transform(1945)
				end, 
				timeToReset * 60000,
				blockingItem1:getPosition()
			)

		elseif item.itemid == 1945 and item.actionid == 1111 then 

	    	if timeToReset > 1 then     
				cid:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The magic wall has been removed for ' .. timeToReset .. ' minutes.') 
			else
				cid:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The magic wall has been removed for ' .. timeToReset .. ' minute.')
			end

			Item(item.uid):transform(1946)

			if not blockingItem2:getItemById(objectId) then
				return false
			else
				blockingItem2:getItemById(objectId):remove()
			end

			addEvent(
				function(blockingItem2)
					Game.createItem(objectId, 1, blockingItem2) 
					blockingItem2:sendMagicEffect(CONST_ME_TELEPORT)            
					p[2]:sendMagicEffect(CONST_ME_POFF)                    
					Tile(toPosition):getItemById(1946):transform(1945)
				end, 
				timeToReset * 60000,
				blockingItem2:getPosition()
			)

		elseif item.itemid == 1946 then 
			Item(item.uid):transform(1945)      
			return false    
		end    
	return true
end