function onSay(player, words, param)
    local list = "You are looting: "
    local alist = player:getAutoLootList()
 
    if alist then
        for _, item in ipairs(alist) do
            list = list .. (ItemType(item)):getName() .. ", "
        end
    else
        player:sendCancelMessage("The list is empty.")
        return false
    end
    player:sendTextMessage(MESSAGE_INFO_DESCR, list:sub(1, -3))
    return false
end