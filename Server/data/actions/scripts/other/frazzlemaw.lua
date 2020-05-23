local function doPlayerAddPremiumPoints(cid, count)
		db.query('UPDATE accounts SET premium_points = premium_points+'.. count ..' WHERE id = ' .. getAccountNumberByPlayerName(getCreatureName(cid)))
end

function onUse(cid, item, fromPosition, itemEx, toPosition) 
	doPlayerAddPremiumPoints(cid, 100)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have recived 100 shop points to your account.")
	doSendMagicEffect(getCreaturePosition(cid), 28)
	doRemoveItem(item.uid,1)
	return true
end