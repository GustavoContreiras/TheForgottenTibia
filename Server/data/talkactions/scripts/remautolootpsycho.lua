function onSay(player, words, param)
    local itemType = ItemType(param)
 
    if itemType:getId() == 0 then
        itemType = ItemType(tonumber(param))
        if itemType:getName() == '' then
            player:sendCancelMessage("There is no item with that id or name.")
            return false
        end
    end

    if player:getAutoLootItem(itemType:getId()) then
        player:removeAutoLootItem(itemType:getId())
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You are not looting " .. itemType:getName() .. " anymore.")
    else
        player:sendCancelMessage("You are not looting this item.")
    end

    return false
end