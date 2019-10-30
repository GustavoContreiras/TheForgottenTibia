KILLTASKS_STARTSTORAGE = 62003
KILLTASKS_STATUS_NOT_DOING = -1
KILLTASKS_STATUS_DOING = 1
KILLTASKS_STATUS_DONE = 2
KILLTASKS_MONSTERS = {
    ['troll'] = { -- 20 xp
		plural = "trolls", 		onlist = 1, amount = 25,	countstorage = 19000, statusstorage = 5010, exp = 5000, 	skillpoints = 0,	mount = 0, resets = 0, 
		items = {{id = 2152, count = 10}}
	}, 
    ['orc'] = { -- 25 xp
		plural = "orcs", 		onlist = 1, amount = 25,    countstorage = 19001, statusstorage = 5011, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	}, 
    ['rotworm'] = { -- 40 xp
		plural = "rotworms", 	onlist = 1, amount = 50,     countstorage = 19002, statusstorage = 5012, exp = 10000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 25}}
	}, 
    ['minotaur'] = { -- 50 xp
		plural = "minotaurs", 	onlist = 1, amount = 50,     countstorage = 19003, statusstorage = 5013, exp = 25000, 	skillpoints = 0,	mount = 'Undead Cavebear', resets = 0, 
		items = {{id = 2152, count = 25}}
	}, 
    ['amazon'] = { -- 60 xp
		plural = "amazons", 		onlist = 1, amount = 75,     countstorage = 19004, statusstorage = 5014, exp = 45000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 35}}
	}, 
    ['ghoul'] = { -- 85 xp
		plural = "ghouls", 		onlist = 1, amount = 75,	 countstorage = 19005, statusstorage = 5015, exp = 63750, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 40}}
	}, 
    ['cyclops'] = { -- 150 xp
		plural = "cyclops", 		onlist = 1, amount = 100,    countstorage = 19006, statusstorage = 5016, exp = 150000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 50}}
	}, 
    ['vampire'] = { -- 305 xp
		plural = "vampires", 	onlist = 1, amount = 100,    countstorage = 19007, statusstorage = 5017, exp = 152500, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 50}}
	}, 
    ['necromancer'] = { -- 580 xp
		plural = "necromancers", 	onlist = 1, amount = 100,    countstorage = 19008, statusstorage = 5018, exp = 290000, 	skillpoints = 0,	mount = 'Floating Kashmir', resets = 0,  
		items = {{id = 2152, count = 50}}
	}, 
    ['dragon'] = { -- 700 xp
		plural = "dragons", 		onlist = 1, amount = 100,    countstorage = 19009, statusstorage = 5019, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
    ['bog raider']  = { -- 800 xp
		plural = "bog raiders", 	onlist = 1, amount = 100,    countstorage = 19016, statusstorage = 5026, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
    ['giant spider'] = { -- 900 xp
		plural = "giant spiders", 	onlist = 1, amount = 150,    countstorage = 19010, statusstorage = 5020, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
    ['quara predator'] = { -- 1200 xp
		plural = "quara predators", 	onlist = 1, amount = 150,    countstorage = 19018, statusstorage = 5028, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
    ['hero'] = { -- 1200 xp
		plural = "heroes", 		onlist = 1, amount = 150,    countstorage = 19021, statusstorage = 5031, exp = 0, 	skillpoints = 1,	mount = 'Noble Lion', resets = 1,  
		items = {{id = 2152, count = 100}}
	}, 
    ['dragon lord'] = { -- 2100 xp
		plural = "dragon lords", 	onlist = 1, amount = 200,    countstorage = 19011, statusstorage = 5021, exp = 0, 	skillpoints = 2,	mount = 'Crystal Wolf', resets = 0,  
		items = {{id = 2160, count = 4}}
	}, 
    ['frost dragon'] = { -- 2100 xp
		plural = "frost dragons", 	onlist = 1, amount = 200,    countstorage = 19012, statusstorage = 5022, exp = 0, 	skillpoints = 2,	mount = 'Dragonling', resets = 0,  
		items = {{id = 2160, count = 4}}
	}, 
    ['hydra'] = { -- 2100 xp
		plural = "hydras", 		onlist = 1, amount = 250,    countstorage = 19013, statusstorage = 5023, exp = 0, 	skillpoints = 2,	mount = 'Plateusaurian', resets = 1,  
		items = {{id = 2160, count = 5}}
	}, 
    ['behemoth'] = { -- 2500 xp
		plural = "behemoths", 	onlist = 1, amount = 250,    countstorage = 19022, statusstorage = 5032, exp = 0, 	skillpoints = 2,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 5}}
	}, 
    ['serpent spawn'] = { -- 3050 xp
		plural = "serpent spawns", 	onlist = 1, amount = 200,    countstorage = 19017, statusstorage = 5027, exp = 0, 	skillpoints = 3,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 5}}
	}, 
    ['grim reaper'] = { -- 5500 xp
		plural = "grim reapers", 	onlist = 1, amount = 200,    countstorage = 19015, statusstorage = 5025, exp = 0, 	skillpoints = 4,	mount = 'Nethersteed', resets = 0,  
		items = {{id = 2160, count = 5}}
	}, 
    ['demon'] = { -- 6000 xp
		plural = "demons", 		onlist = 1, amount = 250,    countstorage = 19014, statusstorage = 5024, exp = 0, 	skillpoints = 4,	mount = 0, resets = 1,  
		items = {{id = 2160, count = 10}}
	}, 
    ['hellhound'] = { -- 6800 xp
		plural = "hellhounds", 	onlist = 1, amount = 250,    countstorage = 19020, statusstorage = 5030, exp = 0, 	skillpoints = 4,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 10}}
	} 
}