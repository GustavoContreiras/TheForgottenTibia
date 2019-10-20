function onKill(player, target)
     local monster = KILLTASKS_MONSTERS[target:getName():lower()]
     if target:isPlayer() or not monster or target:getMaster() then
         return true
     end
     local stor = player:getStorageValue(monster.countstorage)+1
     if stor < monster.amount and player:getStorageValue(monster.statusstorage) >= monster.startvalue then
         player:setStorageValue(monster.countstorage, stor)
         player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Task message: '..(stor +1)..' of '..monster.amount..' '..monster.plural..' killed.')
     end
     if (stor +1) == monster.amount then
         player:sendTextMessage(MESSAGE_INFO_DESCR, 'Congratulations, you have killed '..(stor +1)..' '..monster.plural..' and completed the '..monster.plural..' task.')
         player:setStorageValue(monster.countstorage, stor +1)
     end
     return true
end
