local config = {
    ['troll']           		= {plural = "trolls", 			amount = 25,     storage = 19000, startstorage = 5010, startvalue = 1},
    ['orc']             		= {plural = "orcs", 			amount = 25,     storage = 19001, startstorage = 5011, startvalue = 1},
    ['orc spearman']           		= {plural = "orcs", 			amount = 25,     storage = 19001, startstorage = 5011, startvalue = 1},
    ['orc warrior']           		= {plural = "orcs", 			amount = 25,     storage = 19001, startstorage = 5011, startvalue = 1},
    ['orc berserker']          		= {plural = "orcs", 			amount = 25,     storage = 19001, startstorage = 5011, startvalue = 1},
    ['orc leader']          		= {plural = "orcs", 			amount = 25,     storage = 19001, startstorage = 5011, startvalue = 1},
    ['orc rider']          		= {plural = "orcs", 			amount = 25,     storage = 19001, startstorage = 5011, startvalue = 1},
    ['orc marauder']          		= {plural = "orcs", 			amount = 25,     storage = 19001, startstorage = 5011, startvalue = 1},
    ['orc shaman']          		= {plural = "orcs", 			amount = 25,     storage = 19001, startstorage = 5011, startvalue = 1},
    ['orc warlord']          		= {plural = "orcs", 			amount = 25,     storage = 19001, startstorage = 5011, startvalue = 1},
    ['rotworm']         		= {plural = "rotworms", 		amount = 50,     storage = 19002, startstorage = 5012, startvalue = 1},
    ['minotaur']        		= {plural = "minotaurs", 		amount = 50,     storage = 19003, startstorage = 5013, startvalue = 1},
    ['minotaur archer']        		= {plural = "minotaurs", 		amount = 50,     storage = 19003, startstorage = 5013, startvalue = 1},
    ['minotaur guard']        		= {plural = "minotaurs", 		amount = 50,     storage = 19003, startstorage = 5013, startvalue = 1},
    ['minotaur mage']        		= {plural = "minotaurs", 		amount = 50,     storage = 19003, startstorage = 5013, startvalue = 1},
    ['amazon']          		= {plural = "amazons", 			amount = 75,     storage = 19004, startstorage = 5014, startvalue = 1},
    ['ghoul']           		= {plural = "ghouls", 			amount = 75,	 storage = 19005, startstorage = 5015, startvalue = 1},
    ['cyclops']         		= {plural = "cyclops", 			amount = 100,    storage = 19006, startstorage = 5016, startvalue = 1},
    ['cyclops drone']         		= {plural = "cyclops", 			amount = 100,    storage = 19006, startstorage = 5016, startvalue = 1},
    ['cyclops smith']         		= {plural = "cyclops", 			amount = 100,    storage = 19006, startstorage = 5016, startvalue = 1},
    ['vampire']         		= {plural = "vampires", 		amount = 100,    storage = 19007, startstorage = 5017, startvalue = 1},
    ['necromancer']     		= {plural = "necromancers", 		amount = 100,    storage = 19008, startstorage = 5018, startvalue = 1},
    ['dragon']          		= {plural = "dragons", 			amount = 100,    storage = 19009, startstorage = 5019, startvalue = 1},
    ['bog raider']      		= {plural = "bog raiders", 		amount = 100,    storage = 19016, startstorage = 5026, startvalue = 1},
    ['giant spider']    		= {plural = "giant spiders", 		amount = 150,    storage = 19010, startstorage = 5020, startvalue = 1},
    ['quara predator']  		= {plural = "quara predators", 		amount = 150,    storage = 19018, startstorage = 5028, startvalue = 1},
    ['hero']  				= {plural = "heroes", 			amount = 150,    storage = 19021, startstorage = 5031, startvalue = 1},
    ['massive fire elemental'] 		= {plural = "massive fire elementals", 	amount = 150,    storage = 19019, startstorage = 5029, startvalue = 1},
    ['dragon lord']     		= {plural = "dragon lords", 		amount = 200,    storage = 19011, startstorage = 5021, startvalue = 1},
    ['frost dragon']    		= {plural = "frost dragons", 		amount = 200,    storage = 19012, startstorage = 5022, startvalue = 1},
    ['hydra']           		= {plural = "hydras", 			amount = 250,    storage = 19013, startstorage = 5023, startvalue = 1},
    ['behemoth']           		= {plural = "behemoths", 		amount = 250,    storage = 19022, startstorage = 5032, startvalue = 1},
    ['serpent spawn']   		= {plural = "serpent spawns", 		amount = 200,    storage = 19017, startstorage = 5027, startvalue = 1},
    ['grim reaper']     		= {plural = "grim reapers", 		amount = 200,    storage = 19015, startstorage = 5025, startvalue = 1},
    ['demon']           		= {plural = "demons", 			amount = 250,    storage = 19014, startstorage = 5024, startvalue = 1},
    ['hellhound']       		= {plural = "hellhounds", 		amount = 250,    storage = 19020, startstorage = 5030, startvalue = 1}
}
function onKill(player, target)
     local monster = config[target:getName():lower()]
     if target:isPlayer() or not monster or target:getMaster() then
         return true
     end
     local stor = player:getStorageValue(monster.storage)+1
     if stor < monster.amount and player:getStorageValue(monster.startstorage) >= monster.startvalue then
         player:setStorageValue(monster.storage, stor)
         player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Task message: '..(stor +1)..' of '..monster.amount..' '..monster.plural..' killed.')
     end
     if (stor +1) == monster.amount then
         player:sendTextMessage(MESSAGE_INFO_DESCR, 'Congratulations, you have killed '..(stor +1)..' '..monster.plural..' and completed the '..monster.plural..' task.')
         player:setStorageValue(monster.storage, stor +1)
     end
     return true
end
