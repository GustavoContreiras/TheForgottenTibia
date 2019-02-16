--[[SevuEntertainment(c)]]--
local recAnimateText = false
local startSeconds = 45
 
local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_WILDGROWTH)
 
mwCountDownStart = function(position, seconds)
    local spectators = Game.getSpectators(position, false, true, 7, 7, 7, 7)
    if #spectators > 0 then
        if not recAnimateText then
            Creature.say(spectators[1], seconds, TALKTYPE_MONSTER_SAY, false, nil, position)
        else
            Player.sendTextMessage(spectators[1], MESSAGE_EXPERIENCE_OTHERS, nil, position, seconds, TEXTCOLOR_MAYABLUE)
        end
    end
    if seconds > 0 then
        addEvent(mwCountDownStart, 1000, position, seconds -1)
    end
end
 
function onCastSpell(creature, variant, isHotkey)
    if combat:execute(creature, variant) then
        mwCountDownStart(Variant.getPosition(variant), startSeconds)
        return true
    end
    return false
end