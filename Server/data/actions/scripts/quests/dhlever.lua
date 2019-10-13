

	        
function onUse(cid, item, fromPosition, itemEx, toPosition, isHotkey) 

	local timeToReset = 1 -- Time to reset the quest in minutes.

	local objectId = 1355 -- Id of the item Blocking the pathlocal 

	local p = {   
		Position(33117, 31315, 15), -- Position of the item blocking the path
		Position(33119, 31313, 15), -- Teleport Creation p
		Position(33125, 31315, 14), -- Position where it sends you
	}

	local stone = Tile(p[1])    
	local tp = Tile(p[2])   

	    if item.itemid == 1945 then 

	    	if timeToReset > 1 then     
				cid:sendTextMessage(MESSAGE_EVENT_ORANGE, 'The object in your path has been removed for ' .. timeToReset .. ' minutes.') 
			else
				cid:sendTextMessage(MESSAGE_EVENT_ORANGE, 'The object in your path has been removed for ' .. timeToReset .. ' minute.')
			end

			doCreateTeleport(1387, p[3], p[2])        
			stone:getItemById(objectId):remove()
			p[1]:sendMagicEffect(CONST_ME_POFF)        
			p[2]:sendMagicEffect(CONST_ME_TELEPORT)
			Item(item.uid):transform(1946)
			addEvent(function(stonePos)
			Game.createItem(objectId, 1, stonePos)            
			stonePos:sendMagicEffect(CONST_ME_TELEPORT)            
			p[2]:sendMagicEffect(CONST_ME_POFF)            
			tp:getItemById(1387):remove()           
			Tile(toPosition):getItemById(1946):transform(1945)
			end, timeToReset * 60000, stone:getPosition())  

		elseif item.itemid == 1946 then       
			return false    
		end    
	return true
end


--[[
local timetoreset = 5 -- Time to reset the quest in minutes.
local objectid = xxxx -- Id of the item Blocking the pathlocal 
p = {    Position(x, y, z), -- Position of the item blocking the path    
Position(x, y, z), -- Teleport Creation position    
Position(x, y, z) -- Position where it sends you
}

function onUse(cid, item, fromPosition, itemEx, toPosition, isHotkey)   

	local stone = Tile(p[1])    
	local tp = Tile(p[2])    

	if item.itemid == 1945 then        
		cid:sendTextMessage(MESSAGE_EVENT_ORANGE, 'The object in your path has been removed for ' .. timetoreset .. ' minutes.')        
		doCreateTeleport(1387, p[3], p[2])        
		stone:getItemById(objectid):remove()        
		p[1]:sendMagicEffect(CONST_ME_POFF)        
		p[2]:sendMagicEffect(CONST_ME_TELEPORT)        
		Item(item.uid):transform(1946)               
		addEvent(function(stonePos)            
			Game.createItem(objectid, 1, stonePos)            
			stonePos:sendMagicEffect(CONST_ME_TELEPORT)            
			p[2]:sendMagicEffect(CONST_ME_POFF)            
			tp:getItemById(1387):remove()            
			Tile(toPosition):getItemById(1946):transform(1945)                    
			end, timetoreset * 60000, stone:getPosition())           

	elseif item.itemid == 1946 then        
		return false    
	end    
	return true
end]]
