function onUse(cid, item, fromPosition, itemEx, toPosition)
    doRemoveItem(item.uid,1)
    doCreatureSay(cid,"KABOOOOOOOOOOM!",TALKTYPE_ORANGE_1)
    doSendMagicEffect(fromPosition,CONST_ME_FIREAREA)
end
