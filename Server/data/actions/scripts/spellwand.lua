local outfits = {"rat", "green frog", "chicken"} --possible outfits
local duration = 45 --duration of the outfit in seconds
local breakchance = 1 --chance of losing the wand
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if math.random(100) <= breakchance then
        doSummonCreature("Mad Sheep",toPosition)
        doRemoveItem(item.uid,1)
        return TRUE
    end
    if isPlayer(itemEx.uid) == TRUE then
        doSetMonsterOutfit(itemEx.uid,outfits[math.random(#outfits)],duration*1000)
        doSendMagicEffect(toPosition,CONST_ME_MAGIC_BLUE)
        return TRUE
    end
end
