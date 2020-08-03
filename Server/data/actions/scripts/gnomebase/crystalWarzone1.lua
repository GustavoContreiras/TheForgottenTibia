

local posdotp = {x= 33104, y=31908, z=10} -- Posicao que o tp vai ser criado (Eh o tp que leva pra sala do Deathstriker)
local salaDeathstriker = {x=33101, y=31956, z=10} -- Posicao da sala do Deathstriker (Pos pra onde o player vai qd entrar no tp)
local posDeathstriker = {x=33108, y=31968, z=10} -- Posicao onde o Deathstriker vai nascer.

function removerTp(tp)
    local t = getTileItemById(posdotp, 1387)
    if t then
        doRemoveItem(t.uid, 1)
        doSendMagicEffect(posdotp, CONST_ME_POFF)
    end
end

function TirarCristal()
    local cristal = getTileItemById(posdotp, 17999) -- Id do cristal azul que some para dar lugar ao tp
    if cristal then
        doRemoveItem(cristal.uid, 1)
    end
    return true
end
     
function onTimer5() --creates wall back
doCreateItem(17999,1,posdotp)-- Stone pos
end

function onTimer6()
local tp = Game.createItem(1387, 1, posdotp)
tp:setActionId(45702)
 end

function onUse(cid, item, fromPosition, itemEx, toPosition)
  if(getGlobalStorageValue(96974) < 1) then
		setGlobalStorageValue(96974, 1)
			for i = 1, 6 do
				for k = 1, 10 do
					creatures = {
						"humongous fungus",
						"hideous fungus"
					}
				pos = {x = math.random(33091, 33101), y = math.random(31899, 31916), z = 10}
				addEvent(doSummonCreature, i * 20 * 1000, creatures[math.random(1, 2)], pos)
				addEvent(doSendMagicEffect, i * 20 * 1000, pos, CONST_ME_TELEPORT)
			end
	 end
        
   	 doCreatureSay(cid, "The crystals are damaging!", TALKTYPE_ORANGE_1, false, cid, toPosition)
  	 addEvent(doSendMagicEffect, 6*20*1000, posDeathstriker, CONST_ME_TELEPORT)   			
   	 addEvent(TirarCristal, 6*20*1000)
  	 addEvent(onTimer6, 100+6*20*1000) -- Warzone TP 
   	 addEvent(removerTp, 60000+6*20*1000)
	 addEvent(onTimer5, 61000+6*20*1800) --2minutes
	 addEvent(setGlobalStorageValue, 6*20*1000 + 30*60*1000, 96974, 0)
    else
        doPlayerSendCancel(cid, "Wait 30 minutes to start again.")
    end
    return true
end