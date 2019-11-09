KILLTASKS_STARTSTORAGE = 62003
KILLTASKS_STATUS_NOT_DOING = -1
KILLTASKS_STATUS_DOING = 1
KILLTASKS_STATUS_DONE = 2
KILLTASKS_MONSTERS = {
    ['troll'] = { -- 20 xp
		plural = "trolls", 		order = 1, amount = 25,	countstorage = 19000, statusstorage = 5010, exp = 5000, 	skillpoints = 0,	mount = 0, resets = 0, 
		items = {{id = 2152, count = 10}, {id = 2490, count = 1}}
	}, 
    ['orc'] = { -- 25 xp
		plural = "orcs", 		order = 2, amount = 25,    countstorage = 19001, statusstorage = 5011, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	}, 
    ['rotworm'] = { -- 40 xp
		plural = "rotworms", 	order = 3, amount = 50,     countstorage = 19002, statusstorage = 5012, exp = 10000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 25}}
	},
    ['elf'] = { -- 42 xp
		plural = "elves", 	order = 4, amount = 50,     countstorage = 19023, statusstorage = 5033, exp = 15000, 	skillpoints = 0,	mount = 'Ladybug', resets = 0,  
		items = {{id = 2152, count = 25}}
	}, 
    ['minotaur'] = { -- 50 xp
		plural = "minotaurs", 	order = 5, amount = 50,     countstorage = 19003, statusstorage = 5013, exp = 25000, 	skillpoints = 0,	mount = 'Undead Cavebear', resets = 0, 
		items = {{id = 2152, count = 25}}
	}, 
    ['amazon'] = { -- 60 xp
		plural = "amazons", 		order = 6, amount = 75,     countstorage = 19004, statusstorage = 5014, exp = 45000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 35}}
	}, 
    ['ghoul'] = { -- 85 xp
		plural = "ghouls", 		order = 7, amount = 75,	 countstorage = 19005, statusstorage = 5015, exp = 63750, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 40}}
	}, 
    ['cyclops'] = { -- 150 xp
		plural = "cyclops", 		order = 8, amount = 100,    countstorage = 19006, statusstorage = 5016, exp = 150000, 	skillpoints = 0,	mount = 'Blacksheep', resets = 0,  
		items = {{id = 2152, count = 50}}
	}, 
	['demon skeleton'] = { -- 240 xp
		plural = "demon skeletons", 	order = 9, amount = 100,    countstorage = 19024, statusstorage = 5034, exp = 150000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 50}}
	}, 
    ['vampire'] = { -- 305 xp
		plural = "vampires", 	order = 10, amount = 100,    countstorage = 19007, statusstorage = 5017, exp = 152500, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 50}, {id = 8903, count = 1}}
	}, 
    ['necromancer'] = { -- 580 xp
		plural = "necromancers", 	order = 11, amount = 100,    countstorage = 19008, statusstorage = 5018, exp = 290000, 	skillpoints = 0,	mount = 'Floating Kashmir', resets = 0,  
		items = {{id = 2152, count = 50}}
	}, 
    ['dragon'] = { -- 700 xp
		plural = "dragons", 		order = 12, amount = 100,    countstorage = 19009, statusstorage = 5019, exp = 0, 	skillpoints = 1,	mount = 0, resets = 1,  
		items = {{id = 2152, count = 100}, {id = 2183, count = 1}}
	}, 
    ['bog raider']  = { -- 800 xp
		plural = "bog raiders", 	order = 13, amount = 100,    countstorage = 19016, statusstorage = 5026, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}, {id = 8891, count = 1}}
	}, 
    ['giant spider'] = { -- 900 xp
		plural = "giant spiders", 	order = 14, amount = 150,    countstorage = 19010, statusstorage = 5020, exp = 0, 	skillpoints = 1,	mount = 'Widow Queen', resets = 0,  
		items = {{id = 2152, count = 100}, {id = 15644, count = 1}}
	}, 
    ['quara predator'] = { -- 1200 xp
		plural = "quara predators", 	order = 15, amount = 150,    countstorage = 19018, statusstorage = 5028, exp = 0, 	skillpoints = 1,	mount = 'Manta Ray', resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
    ['hero'] = { -- 1200 xp
		plural = "heroes", 		order = 16, amount = 150,    countstorage = 19021, statusstorage = 5031, exp = 0, 	skillpoints = 1,	mount = 'Noble Lion', resets = 1,  
		items = {{id = 2152, count = 100}}
	},
	['lizard high guard'] = { -- 1450 xp
		plural = "lizards high guard", 		order = 17, amount = 200,    countstorage = 19030, statusstorage = 5040, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}}
	},	
	['wyrm'] = { -- 1550 xp
		plural = "wyrms", 		order = 18, amount = 150,    countstorage = 19029, statusstorage = 5039, exp = 0, 	skillpoints = 1,	mount = 'Magma Crawler', resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
	['black knight'] = { -- 1600 xp
		plural = "black knights", 		order = 19, amount = 200,    countstorage = 19025, statusstorage = 5035, exp = 0, 	skillpoints = 1,	mount = 'Winter King', resets = 1,  
		items = {{id = 2152, count = 100}}
	}, 
    ['dragon lord'] = { -- 2100 xp
		plural = "dragon lords", 	order = 20, amount = 200,    countstorage = 19011, statusstorage = 5021, exp = 0, 	skillpoints = 2,	mount = 'Crystal Wolf', resets = 0,  
		items = {{id = 2160, count = 4}, {id = 2539, count = 1}}
	}, 
    ['frost dragon'] = { -- 2100 xp
		plural = "frost dragons", 	order = 21, amount = 200,    countstorage = 19012, statusstorage = 5022, exp = 0, 	skillpoints = 2,	mount = 'Dragonling', resets = 0,  
		items = {{id = 2160, count = 4}}
	}, 
    ['hydra'] = { -- 2100 xp
		plural = "hydras", 		order = 22, amount = 250,    countstorage = 19013, statusstorage = 5023, exp = 0, 	skillpoints = 2,	mount = 'Platesaurian', resets = 1,  
		items = {{id = 2160, count = 5}, {id = 2195, count = 1}}
	}, 
	['destroyer'] = { -- 2500 xp
		plural = "destroyers", 	order = 23, amount = 250,    countstorage = 19026, statusstorage = 5036, exp = 0, 	skillpoints = 2,	mount = 0, resets = 1,  
		items = {{id = 2160, count = 5}, {id = 18390, count = 1}}
	},
    ['behemoth'] = { -- 2500 xp
		plural = "behemoths", 	order = 24, amount = 250,    countstorage = 19022, statusstorage = 5032, exp = 0, 	skillpoints = 2,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 5}, {id = 18390, count = 1}}
	}, 
    ['serpent spawn'] = { -- 3050 xp
		plural = "serpent spawns", 	order = 25, amount = 200,    countstorage = 19017, statusstorage = 5027, exp = 0, 	skillpoints = 3,	mount = 'Tamed Panda', resets = 0,  
		items = {{id = 2160, count = 5}}
	}, 
	['warlock'] = { -- 3500 xp
		plural = "warlocks", 	order = 26, amount = 500,    countstorage = 19031, statusstorage = 5041, exp = 0, 	skillpoints = 3,	mount = 0, resets = 0,  
		items = {{id = 5903, count = 1}}
	}, 
	['plaguesmith'] = { -- 4500 xp
		plural = "plaguesmiths", 	order = 26, amount = 200,    countstorage = 19027, statusstorage = 5037, exp = 0, 	skillpoints = 3,	mount = 'Tundra Rambler', resets = 1,  
		items = {{id = 2160, count = 5}}
	},
	['fury'] = { -- 4500 xp
		plural = "furies", 	order = 27, amount = 200,    countstorage = 19028, statusstorage = 5038, exp = 0, 	skillpoints = 3,	mount = 'Flitterkatzen', resets = 1,  
		items = {{id = 2160, count = 5}}
	},	
    ['grim reaper'] = { -- 5500 xp
		plural = "grim reapers", 	order = 28, amount = 200,    countstorage = 19015, statusstorage = 5025, exp = 0, 	skillpoints = 4,	mount = 'Nethersteed', resets = 0,  
		items = {{id = 2160, count = 5}}
	},
	['hellhound'] = { -- 6800 xp
		plural = "hellhounds", 	order = 29, amount = 200,    countstorage = 19020, statusstorage = 5030, exp = 0, 	skillpoints = 4,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 10}}
	},
    ['demon'] = { -- 6000 xp
		plural = "demons", 		order = 30, amount = 250,    countstorage = 19014, statusstorage = 5024, exp = 0, 	skillpoints = 4,	mount = 'Hellgrip', resets = 1,  
		items = {{id = 2160, count = 10}}
	}
}
