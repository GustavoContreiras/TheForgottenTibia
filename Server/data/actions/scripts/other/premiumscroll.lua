local function doPlayerAddPremiumPoints(cid, count)
    db.query('UPDATE znote_accounts SET points = points+'.. count ..' WHERE account_id = ' .. getAccountNumberByPlayerName(getCreatureName(cid)) .. ' LIMIT 1')
end

function onUse(cid, item, fromPosition, itemEx, toPosition) 
    doPlayerAddPremiumPoints(cid, 100)
    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have recived 100 Shop Credits to your balance.")
    doSendMagicEffect(getCreaturePosition(cid), 28)
    doRemoveItem(item.uid,1)
    return true
end