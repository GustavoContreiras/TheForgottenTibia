function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = {x = 32584, y = 31398, z = 8} -- where to tp to 33672, 31884, 5
if(getPlayerStorageValue(cid, 12607) == 6) then
	doTeleportThing(cid,p)
	doSendMagicEffect(p,10)
	
	else 
	
	doCreatureSay(cid, "You need to do missions before.", TALKTYPE_ORANGE_1)
return true
end

end