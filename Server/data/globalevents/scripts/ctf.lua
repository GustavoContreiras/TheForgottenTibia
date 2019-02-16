function onThink(interval)
if Game.getStorageValue(configCTF.event) == 1 then
    checkCTF()
end
return true
end