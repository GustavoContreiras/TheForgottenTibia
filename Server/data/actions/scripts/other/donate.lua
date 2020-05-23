function onUse(cid, item, fromPosition, itemEx, toPosition)
if Player(cid) then
Item(item.uid):remove(1)
		 doPlayerSendTextMessage(cid,19,"Relogue para ativar seu outfit ou montaria.")
		 end
		return true
end