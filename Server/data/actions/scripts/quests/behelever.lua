local objectId = 1304 -- Id of the item Blocking the pathlocal 

position = {   
	Position(33189, 31421, 15), -- Position of the item blocking the path
}
	        
function onUse(cid, item, fromPosition, itemEx, toPosition, isHotkey) 

	local stone = Tile(position[1])       

	    if item.itemid == 1945 then 
			cid:sendTextMessage(MESSAGE_EVENT_ORANGE, 'The object in your path has been removed.') 
			stone:getItemById(objectId):remove()        
			Item(item.uid):transform(1946)
		else       
			Game.createItem(objectId, 1, stone:getPosition())
			Item(item.uid):transform(1945)
			return false   
		end    
	return true
end