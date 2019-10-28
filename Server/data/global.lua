dofile('data/lib/lib.lua')

--STORAGEVALUE_WAR_GREENTEAM_COUNT 	= 51001 -- holds how many players are on the team
--STORAGEVALUE_WAR_REDTEAM_COUNT 		= 51002 -- holds how many players are on the team

--Game.setStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT, 0)
--Game.setStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT, 0)

--STORAGEVALUE_WAR_GREENPLAYER_BOOL 	= 51003 -- set 1 if player is green team
--STORAGEVALUE_WAR_REDPLAYER_BOOL		= 51004 -- set 1 if player is red team

--POSITION_WAR_GREENTEAM_TEMPLE		= Position(31538, 32092, 7)
--POSITION_WAR_REDTEAM_TEMPLE			= Position(31490, 32092, 7)

STORAGEVALUE_ASSISTS = 30000
STORAGEVALUE_DEATHS = 30001
STORAGEVALUE_KILLS = 30002

SKILL_FIST = SKILL_VITALITY
SKILL_CLUB = SKILL_STRENGHT
SKILL_SWORD = SKILL_FAITH
SKILL_AXE = SKILL_INTELLIGENCE
SKILL_DISTANCE = SKILL_DEXTERITY
SKILL_SHIELDING = SKILL_DEFENCE
SKILL_FISHING = SKILL_ENDURANCE

SKILL_RESISTANCE = SKILL_DEFENCE -- skill resistance has to be deprecated

STORAGEVALUE_PROMOTION = 30018

KILLTASKS_STARTSTORAGE = 62003
KILLTASKS_STATUS_NOT_DOING = -1
KILLTASKS_STATUS_DOING = 1
KILLTASKS_STATUS_DONE = 2
KILLTASKS_MONSTERS = {
    ['troll'] = { -- 20 xp
		plural = "trolls", 		onlist = 1, amount = 25,	countstorage = 19000, statusstorage = 5010, startvalue = 1, exp = 5000, 	skillpoints = 0,	mount = 0, resets = 0, 
		items = {{id = 2152, count = 10}}
	}, 
    ['orc'] = { -- 25 xp
		plural = "orcs", 		onlist = 1, amount = 25,    countstorage = 19001, statusstorage = 5011, startvalue = 1, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	}, 
    ['orc spearman'] = {
		plural = "orcs", 		onlist = 0, amount = 25,     countstorage = 19001, statusstorage = 5011, startvalue = 1, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	},
    ['orc warrior'] = {
		plural = "orcs", 		onlist = 0, amount = 25,     countstorage = 19001, statusstorage = 5011, startvalue = 1, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	},
    ['orc berserker'] = {
		plural = "orcs", 		onlist = 0, amount = 25,     countstorage = 19001, statusstorage = 5011, startvalue = 1, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	},
    ['orc leader'] = {
		plural = "orcs", 		onlist = 0, amount = 25,     countstorage = 19001, statusstorage = 5011, startvalue = 1, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	},
    ['orc rider'] = {
		plural = "orcs", 		onlist = 0, amount = 25,     countstorage = 19001, statusstorage = 5011, startvalue = 1, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	},
    ['orc marauder'] = {
		plural = "orcs", 		onlist = 0, amount = 25,     countstorage = 19001, statusstorage = 5011, startvalue = 1, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	},
    ['orc shaman'] = {
		plural = "orcs", 		onlist = 0, amount = 25,     countstorage = 19001, statusstorage = 5011, startvalue = 1, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	},
    ['orc warlord'] = {
		plural = "orcs", 		onlist = 0, amount = 25,     countstorage = 19001, statusstorage = 5011, startvalue = 1, exp = 6250, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 15}}
	},
    ['rotworm'] = { -- 40 xp
		plural = "rotworms", 	onlist = 1, amount = 50,     countstorage = 19002, statusstorage = 5012, startvalue = 1, exp = 10000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 25}}
	}, 
    ['minotaur'] = { -- 50 xp
		plural = "minotaurs", 	onlist = 1, amount = 50,     countstorage = 19003, statusstorage = 5013, startvalue = 1, exp = 25000, 	skillpoints = 0,	mount = 'Undead Cavebear', resets = 0, 
		items = {{id = 2152, count = 25}}
	}, 
    ['minotaur archer'] = {
		plural = "minotaurs", 	onlist = 0, amount = 50,     countstorage = 19003, statusstorage = 5013, startvalue = 1, exp = 25000, 	skillpoints = 0,	mount = 'Undead Cavebear', resets = 0, 
		items = {{id = 2152, count = 25}}
	},
    ['minotaur guard'] = {
		plural = "minotaurs", 	onlist = 0, amount = 50,     countstorage = 19003, statusstorage = 5013, startvalue = 1, exp = 25000, 	skillpoints = 0,	mount = 'Undead Cavebear', resets = 0, 
		items = {{id = 2152, count = 25}}
	},
    ['minotaur mage'] = {
		plural = "minotaurs", 	onlist = 0, amount = 50,     countstorage = 19003, statusstorage = 5013, startvalue = 1, exp = 25000, 	skillpoints = 0,	mount = 'Undead Cavebear', resets = 0, 
		items = {{id = 2152, count = 25}}
	},
    ['amazon'] = { -- 60 xp
		plural = "amazons", 		onlist = 1, amount = 75,     countstorage = 19004, statusstorage = 5014, startvalue = 1, exp = 45000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 35}}
	}, 
    ['ghoul'] = { -- 85 xp
		plural = "ghouls", 		onlist = 1, amount = 75,	 countstorage = 19005, statusstorage = 5015, startvalue = 1, exp = 63750, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 40}}
	}, 
    ['cyclops'] = { -- 150 xp
		plural = "cyclops", 		onlist = 1, amount = 100,    countstorage = 19006, statusstorage = 5016, startvalue = 1, exp = 150000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 50}}
	}, 
    ['cyclops drone'] = {
		plural = "cyclops", 		onlist = 0, amount = 100,    countstorage = 19006, statusstorage = 5016, startvalue = 1, exp = 150000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 50}}
	}, 
    ['cyclops smith'] = {
		plural = "cyclops", 		onlist = 0, amount = 100,    countstorage = 19006, statusstorage = 5016, startvalue = 1, exp = 150000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 50}}
	},
    ['vampire'] = { -- 305 xp
		plural = "vampires", 	onlist = 1, amount = 100,    countstorage = 19007, statusstorage = 5017, startvalue = 1, exp = 152500, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 50}}
	}, 
    ['necromancer'] = { -- 580 xp
		plural = "necromancers", 	onlist = 1, amount = 100,    countstorage = 19008, statusstorage = 5018, startvalue = 1, exp = 290000, 	skillpoints = 0,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 50}}
	}, 
    ['dragon'] = { -- 700 xp
		plural = "dragons", 		onlist = 0, amount = 100,    countstorage = 19009, statusstorage = 5019, startvalue = 1, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
    ['bog raider']  = { -- 800 xp
		plural = "bog raiders", 	onlist = 1, amount = 100,    countstorage = 19016, statusstorage = 5026, startvalue = 1, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
    ['giant spider'] = { -- 900 xp
		plural = "giant spiders", 	onlist = 1, amount = 150,    countstorage = 19010, statusstorage = 5020, startvalue = 1, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
    ['quara predator'] = { -- 1200 xp
		plural = "quara predators", 	onlist = 1, amount = 150,    countstorage = 19018, statusstorage = 5028, startvalue = 1, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
    ['hero'] = { -- 1200 xp
		plural = "heroes", 		onlist = 1, amount = 150,    countstorage = 19021, statusstorage = 5031, startvalue = 1, exp = 0, 	skillpoints = 1,	mount = 0, resets = 0,  
		items = {{id = 2152, count = 100}}
	}, 
    ['dragon lord'] = { -- 2100 xp
		plural = "dragon lords", 	onlist = 1, amount = 200,    countstorage = 19011, statusstorage = 5021, startvalue = 1, exp = 0, 	skillpoints = 2,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 4}}
	}, 
    ['frost dragon'] = { -- 2100 xp
		plural = "frost dragons", 	onlist = 1, amount = 200,    countstorage = 19012, statusstorage = 5022, startvalue = 1, exp = 0, 	skillpoints = 2,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 4}}
	}, 
    ['hydra'] = { -- 2100 xp
		plural = "hydras", 		onlist = 1, amount = 250,    countstorage = 19013, statusstorage = 5023, startvalue = 1, exp = 0, 	skillpoints = 2,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 5}}
	}, 
    ['behemoth'] = { -- 2500 xp
		plural = "behemoths", 	onlist = 1, amount = 250,    countstorage = 19022, statusstorage = 5032, startvalue = 1, exp = 0, 	skillpoints = 2,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 5}}
	}, 
    ['serpent spawn'] = { -- 3050 xp
		plural = "serpent spawns", 	onlist = 1, amount = 200,    countstorage = 19017, statusstorage = 5027, startvalue = 1, exp = 0, 	skillpoints = 3,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 5}}
	}, 
    ['grim reaper'] = { -- 5500 xp
		plural = "grim reapers", 	onlist = 1, amount = 200,    countstorage = 19015, statusstorage = 5025, startvalue = 1, exp = 0, 	skillpoints = 4,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 5}}
	}, 
    ['demon'] = { -- 6000 xp
		plural = "demons", 		onlist = 1, amount = 250,    countstorage = 19014, statusstorage = 5024, startvalue = 1, exp = 0, 	skillpoints = 4,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 10}}
	}, 
    ['hellhound'] = { -- 6800 xp
		plural = "hellhounds", 	onlist = 1, amount = 250,    countstorage = 19020, statusstorage = 5030, startvalue = 1, exp = 0, 	skillpoints = 4,	mount = 0, resets = 0,  
		items = {{id = 2160, count = 10}}
	} 
}

MOUNTS = {
	['Widow Queen'] 		= {id = 1, clientId = 368, speed = 20, premium = "yes"},
	['Racing Bird'] 		= {id = 2, clientId = 369, speed = 20, premium = "yes"},
	['War Bear'] 			= {id = 3, clientId = 370, speed = 20, premium = "yes"},
	['Blacksheep'] 			= {id = 4, clientId = 371, speed = 20, premium = "yes"},
	['Midnight Panther'] 	= {id = 5, clientId = 372, speed = 20, premium = "yes"},
	['Draptor'] 			= {id = 6, clientId = 373, speed = 20, premium = "yes"},
	['Titanica'] 			= {id = 7, clientId = 374, speed = 20, premium = "yes"},
	['Tin Lizzard'] 		= {id = 8, clientId = 375, speed = 20, premium = "yes"},
	['Blazebringer'] 		= {id = 9, clientId = 376, speed = 20, premium = "yes"},
	['Rapid Boar'] 			= {id = 10, clientId = 377, speed = 20, premium = "yes"},
	['Stampor'] 			= {id = 11, clientId = 378, speed = 20, premium = "yes"},
	['Undead Cavebear'] 	= {id = 12, clientId = 379, speed = 20, premium = "yes"},
	['Donkey'] 				= {id = 13, clientId = 387, speed = 6, premium = "yes"},
	['Tiger Slug'] 			= {id = 14, clientId = 388, speed = 20, premium = "yes"},
	['Uniwheel'] 			= {id = 15, clientId = 389, speed = 20, premium = "yes"},
	['Crystal Wolf'] 		= {id = 16, clientId = 390, speed = 20, premium = "yes"},
	['War Horse'] 			= {id = 17, clientId = 392, speed = 20, premium = "yes"},
	['Kingly Deer'] 		= {id = 18, clientId = 401, speed = 20, premium = "yes"},
	['Tamed Panda'] 		= {id = 19, clientId = 402, speed = 20, premium = "yes"},
	['Dromedary'] 			= {id = 20, clientId = 405, speed = 20, premium = "yes"},
	['Scorpion King'] 		= {id = 21, clientId = 406, speed = 20, premium = "yes"},
	['Rented Horse'] 		= {id = 22, clientId = 421, speed = 10, premium = "yes"},
	['Armoured War Horse'] 	= {id = 23, clientId = 426, speed = 20, premium = "yes"},
	['Shadow Draptor'] 		= {id = 24, clientId = 427, speed = 20, premium = "yes"},
	['Rented Horse'] 		= {id = 25, clientId = 437, speed = 10, premium = "yes"},
	['Rented Horse'] 		= {id = 26, clientId = 438, speed = 10, premium = "yes"},
	['Lady Bug'] 			= {id = 27, clientId = 0, speed = 20, premium = "yes"},
	['Manta Ray'] 			= {id = 28, clientId = 0, speed = 20, premium = "yes"},
	['Ironblight'] 			= {id = 29, clientId = 0, speed = 20, premium = "yes"},
	['Magma Crawler'] 		= {id = 30, clientId = 0, speed = 20, premium = "yes"},
	['Dragonling'] 			= {id = 31, clientId = 0, speed = 20, premium = "yes"},
	['Gnarlhound'] 			= {id = 32, clientId = 0, speed = 20, premium = "yes"},
	['Crimsom Ray'] 		= {id = 33, clientId = 0, speed = 20, premium = "yes"},
	['Steelbeak'] 			= {id = 34, clientId = 0, speed = 20, premium = "yes"},
	['Water Buffalo'] 		= {id = 35, clientId = 0, speed = 20, premium = "yes"},
	['Tombstinger'] 		= {id = 36, clientId = 0, speed = 20, premium = "yes"},
	['Platesaurian'] 		= {id = 37, clientId = 0, speed = 20, premium = "yes"},
	['Ursagrodon'] 			= {id = 38, clientId = 0, speed = 20, premium = "yes"},
	['The Hellgrip'] 		= {id = 39, clientId = 0, speed = 20, premium = "yes"},
	['Noble Lion'] 			= {id = 40, clientId = 0, speed = 20, premium = "yes"},
	['Desert King'] 		= {id = 41, clientId = 0, speed = 20, premium = "yes"},
	['Shock Head'] 			= {id = 42, clientId = 0, speed = 20, premium = "yes"},
	['Walker'] 				= {id = 43, clientId = 0, speed = 20, premium = "yes"},
	['Azudocus'] 			= {id = 44, clientId = 0, speed = 20, premium = "yes"},
	['Carpacosaurus'] 		= {id = 45, clientId = 0, speed = 20, premium = "yes"},
	['Death Crawler'] 		= {id = 46, clientId = 0, speed = 20, premium = "yes"},
	['Flamesteed'] 			= {id = 47, clientId = 0, speed = 20, premium = "yes"},
	['Jade Lion'] 			= {id = 48, clientId = 0, speed = 20, premium = "yes"},
	['Jade Pincer'] 		= {id = 49, clientId = 0, speed = 20, premium = "yes"},
	['Nethersteed'] 		= {id = 50, clientId = 0, speed = 20, premium = "yes"},
	['Tempest'] 			= {id = 51, clientId = 0, speed = 20, premium = "yes"},
	['Winter King'] 		= {id = 52, clientId = 0, speed = 20, premium = "yes"},
	['Doombringer'] 		= {id = 53, clientId = 0, speed = 20, premium = "yes"},
	['Woodland Prince'] 	= {id = 54, clientId = 0, speed = 20, premium = "yes"},
	['Hailtorm Fury'] 		= {id = 55, clientId = 0, speed = 20, premium = "yes"},
	['Siegebreaker'] 		= {id = 56, clientId = 0, speed = 20, premium = "yes"},
	['Poisonbane'] 			= {id = 57, clientId = 0, speed = 20, premium = "yes"},
	['Blackpelt'] 			= {id = 58, clientId = 0, speed = 20, premium = "yes"},
	['Golden Dragonfly'] 	= {id = 59, clientId = 0, speed = 20, premium = "yes"},
	['Steel Bee'] 			= {id = 60, clientId = 0, speed = 20, premium = "yes"},
	['Copper Fly'] 			= {id = 61, clientId = 0, speed = 20, premium = "yes"},
	['Tundra Rambler'] 		= {id = 62, clientId = 0, speed = 20, premium = "yes"},
	['Highland Yak'] 		= {id = 63, clientId = 0, speed = 20, premium = "yes"},
	['Glacier Vagabond'] 	= {id = 64, clientId = 0, speed = 20, premium = "yes"},
	['Flying Divan'] 		= {id = 65, clientId = 0, speed = 20, premium = "yes"},
	['Magic Carpet'] 		= {id = 66, clientId = 0, speed = 20, premium = "yes"},
	['Floating Kashmir'] 	= {id = 67, clientId = 0, speed = 20, premium = "yes"},
	['Ringtail Waccoon'] 	= {id = 68, clientId = 0, speed = 20, premium = "yes"},
	['Night Waccoon'] 		= {id = 69, clientId = 0, speed = 20, premium = "yes"},
	['Emerald Waccoon'] 	= {id = 70, clientId = 0, speed = 20, premium = "yes"},
	['Glooth Glider'] 		= {id = 71, clientId = 0, speed = 20, premium = "yes"},
	['Shadow Hart'] 		= {id = 72, clientId = 0, speed = 20, premium = "yes"},
	['Black Stag'] 			= {id = 73, clientId = 0, speed = 20, premium = "yes"},
	['Emperor Deer'] 		= {id = 74, clientId = 0, speed = 20, premium = "yes"},
	['Flitterkatzen'] 		= {id = 75, clientId = 0, speed = 20, premium = "yes"},
	['Venompaw'] 			= {id = 76, clientId = 0, speed = 20, premium = "yes"},
	['Batcat'] 				= {id = 77, clientId = 0, speed = 20, premium = "yes"},
	['Sea Devil'] 			= {id = 78, clientId = 0, speed = 20, premium = "yes"},
	['Coralripper'] 		= {id = 79, clientId = 0, speed = 20, premium = "yes"},
	['Plumfish'] 			= {id = 80, clientId = 0, speed = 20, premium = "yes"},
	['Gorongra'] 			= {id = 81, clientId = 0, speed = 20, premium = "yes"},
	['Noctungra'] 			= {id = 82, clientId = 0, speed = 20, premium = "yes"},
	['Silverneck'] 			= {id = 83, clientId = 0, speed = 20, premium = "yes"},
	['Slagsnare'] 			= {id = 84, clientId = 0, speed = 20, premium = "yes"},
	['Nightstinger'] 		= {id = 85, clientId = 0, speed = 20, premium = "yes"},
	['Razorcreep'] 			= {id = 86, clientId = 0, speed = 20, premium = "yes"},
	['Rift Runner'] 		= {id = 87, clientId = 0, speed = 20, premium = "yes"},
	['Nightdweller'] 		= {id = 88, clientId = 0, speed = 20, premium = "yes"},
	['Frostflare'] 			= {id = 89, clientId = 0, speed = 20, premium = "yes"},
	['Cinderhoof'] 			= {id = 90, clientId = 0, speed = 20, premium = "yes"},
	['Mouldpincer'] 		= {id = 91, clientId = 0, speed = 20, premium = "yes"},
	['Bloodcurl'] 			= {id = 92, clientId = 0, speed = 20, premium = "yes"},
	['Leafscuttler'] 		= {id = 93, clientId = 0, speed = 20, premium = "yes"},
	['Sparkion'] 			= {id = 94, clientId = 0, speed = 20, premium = "yes"},
	['Swamp Snapper'] 		= {id = 95, clientId = 0, speed = 20, premium = "yes"},
	['Mould Shell'] 		= {id = 96, clientId = 0, speed = 20, premium = "yes"},
	['Reed Lurker'] 		= {id = 97, clientId = 0, speed = 20, premium = "yes"},
	['Neon Sparkid'] 		= {id = 98, clientId = 0, speed = 20, premium = "yes"},
	['Vortexion'] 			= {id = 99, clientId = 0, speed = 20, premium = "yes"},
	['Ivory Fang'] 			= {id = 100, clientId = 0, speed = 20, premium = "yes"},
	['Shadow Claw'] 		= {id = 101, clientId = 0, speed = 20, premium = "yes"},
	['Snow Pelt'] 			= {id = 102, clientId = 0, speed = 20, premium = "yes"}
}

ropeSpots = {384, 418, 8278, 8592, 13189, 14435, 14436, 15635, 19518}

doors = {[1209] = 1211, [1210] = 1211, [1212] = 1214, [1213] = 1214, [1219] = 1220, [1221] = 1222, [1231] = 1233, [1232] = 1233, [1234] = 1236, [1235] = 1236, [1237] = 1238, [1239] = 1240, [1249] = 1251, [1250] = 1251, [1252] = 1254, [1253] = 1254, [1539] = 1540, [1541] = 1542, [3535] = 3537, [3536] = 3537, [3538] = 3539, [3544] = 3546, [3545] = 3546, [3547] = 3548, [4913] = 4915, [4914] = 4915, [4916] = 4918, [4917] = 4918, [5082] = 5083, [5084] = 5085, [5098] = 5100, [5099] = 5100, [5101] = 5102, [5107] = 5109, [5108] = 5109, [5110] = 5111, [5116] = 5118, [5117] = 5118, [5119] = 5120, [5125] = 5127, [5126] = 5127, [5128] = 5129, [5134] = 5136, [5135] = 5136, [5137] = 5139, [5138] = 5139, [5140] = 5142, [5141] = 5142, [5143] = 5145, [5144] = 5145, [5278] = 5280, [5279] = 5280, [5281] = 5283, [5282] = 5283, [5284] = 5285, [5286] = 5287, [5515] = 5516, [5517] = 5518, [5732] = 5734, [5733] = 5734, [5735] = 5737, [5736] = 5737, [6192] = 6194, [6193] = 6194, [6195] = 6197, [6196] = 6197, [6198] = 6199, [6200] = 6201, [6249] = 6251, [6250] = 6251, [6252] = 6254, [6253] = 6254, [6255] = 6256, [6257] = 6258, [6795] = 6796, [6797] = 6798, [6799] = 6800, [6801] = 6802, [6891] = 6893, [6892] = 6893, [6894] = 6895, [6900] = 6902, [6901] = 6902, [6903] = 6904, [7033] = 7035, [7034] = 7035, [7036] = 7037, [7042] = 7044, [7043] = 7044, [7045] = 7046, [7054] = 7055, [7056] = 7057, [8541] = 8543, [8542] = 8543, [8544] = 8546, [8545] = 8546, [8547] = 8548, [8549] = 8550, [9165] = 9167, [9166] = 9167, [9168] = 9170, [9169] = 9170, [9171] = 9172, [9173] = 9174, [9267] = 9269, [9268] = 9269, [9270] = 9272, [9271] = 9272, [9273] = 9274, [9275] = 9276, [10276] = 10277, [10274] = 10275, [10268] = 10270, [10269] = 10270, [10271] = 10273, [10272] = 10273, [10471] = 10472, [10480] = 10481, [10477] = 10479, [10478] = 10479, [10468] = 10470, [10469] = 10470, [10775] = 10777, [10776] = 10777, [12092] = 12094, [12093] = 12094, [12188] = 12190, [12189] = 12190, [19840] = 19842, [19841] = 19842, [19843] = 19844, [19980] = 19982, [19981] = 19982, [19983] = 19984, [20273] = 20275, [20274] = 20275, [20276] = 20277, [17235] = 17236, [18208] = 18209, [13022] = 13023, [10784] = 10786, [10785] = 10786, [12099] = 12101, [12100] = 12101, [12197] = 12199, [12198] = 12199, [19849] = 19851, [19850] = 19851, [19852] = 19853, [19989] = 19991, [19990] = 19991, [19992] = 19993, [20282] = 20284, [20283] = 20284, [20285] = 20286, [17237] = 17238, [13020] = 13021, [10780] = 10781, [12095] = 12096, [12195] = 12196, [19845] = 19846, [19985] = 19986, [20278] = 20279, [10789] = 10790, [12102] = 12103, [12204] = 12205, [19854] = 19855, [19994] = 19995, [20287] = 20288, [10782] = 10783, [12097] = 12098, [12193] = 12194, [19847] = 19848, [19987] = 19988, [20280] = 20281, [10791] = 10792, [12104] = 12105, [12202] = 12203, [19856] = 19857, [19996] = 19997, [20289] = 20290}
verticalOpenDoors = {1211, 1220, 1224, 1228, 1233, 1238, 1242, 1246, 1251, 1256, 1260, 1540, 3546, 3548, 3550, 3552, 4915, 5083, 5109, 5111, 5113, 5115, 5127, 5129, 5131, 5133, 5142, 5145, 5283, 5285, 5289, 5293, 5516, 5737, 5749, 6194, 6199, 6203, 6207, 6251, 6256, 6260, 6264, 6798, 6802, 6902, 6904, 6906, 6908, 7044, 7046, 7048, 7050, 7055, 8543, 8548, 8552, 8556, 9167, 9172, 9269, 9274, 9274, 9269, 9278, 9282, 10270, 10275, 10279, 10283, 10479, 10481, 10485, 10483, 10786, 12101, 12199, 19851, 19853, 19991, 19993, 20284, 20286, 17238, 13021, 10790, 12103, 12205, 19855, 19995, 20288, 10792, 12105, 12203, 19857, 19997, 20290}
horizontalOpenDoors = {1214, 1222, 1226, 1230, 1236, 1240, 1244, 1248, 1254, 1258, 1262, 1542, 3537, 3539, 3541, 3543, 4918, 5085, 5100, 5102, 5104, 5106, 5118, 5120, 5122, 5124, 5136, 5139, 5280, 5287, 5291, 5295, 5518, 5734, 5746, 6197, 6201, 6205, 6209, 6254, 6258, 6262, 6266, 6796, 6800, 6893, 6895, 6897, 6899, 7035, 7037, 7039, 7041, 7057, 8546, 8550, 8554, 8558, 9170, 9174, 9272, 9276, 9280, 9284, 10273, 10277, 10281, 10285, 10470, 10472, 10476, 10474, 10777, 12094, 12190, 19842, 19844, 19982, 19984, 20275, 20277, 17236, 18209, 13023, 10781, 12096, 12196, 19846, 19986, 20279, 10783, 12098, 12194, 19848, 19988, 20281}
openSpecialDoors = {1224, 1226, 1228, 1230, 1242, 1244, 1246, 1248, 1256, 1258, 1260, 1262, 3541, 3543, 3550, 3552, 5104, 5106, 5113, 5115, 5122, 5124, 5131, 5133, 5289, 5291, 5293, 5295, 6203, 6205, 6207, 6209, 6260, 6262, 6264, 6266, 6897, 6899, 6906, 6908, 7039, 7041, 7048, 7050, 8552, 8554, 8556, 8558, 9176, 9178, 9180, 9182, 9278, 9280, 9282, 9284, 10279, 10281, 10283, 10285, 10474, 10476, 10483, 10485, 10781, 12096, 12196, 19846, 19986, 20279, 10783, 12098, 12194, 19848, 19988, 20281, 10790, 12103, 12205, 19855, 19995, 20288, 10792, 12105, 12203, 19857, 19997, 20290}
questDoors = {1223, 1225, 1241, 1243, 1255, 1257, 3542, 3551, 5105, 5114, 5123, 5132, 5288, 5290, 5745, 5748, 6202, 6204, 6259, 6261, 6898, 6907, 7040, 7049, 8551, 8553, 9175, 9177, 9277, 9279, 10278, 10280, 10475, 10484, 10782, 10791, 12097, 12104, 12193, 12202, 19847, 19856, 19987, 19996, 20280, 20289}
levelDoors = {1227, 1229, 1245, 1247, 1259, 1261, 3540, 3549, 5103, 5112, 5121, 5130, 5292, 5294, 6206, 6208, 6263, 6265, 6896, 6905, 7038, 7047, 8555, 8557, 9179, 9181, 9281, 9283, 10282, 10284, 10473, 10482, 10780, 10789, 10780, 12095, 12102, 12204, 12195, 19845, 19854, 19985, 19994, 20278, 20287}
keys = {2086, 2087, 2088, 2089, 2090, 2091, 2092, 10032}

function getDistanceBetween(firstPosition, secondPosition)
	local xDif = math.abs(firstPosition.x - secondPosition.x)
	local yDif = math.abs(firstPosition.y - secondPosition.y)
	local posDif = math.max(xDif, yDif)
	if firstPosition.z ~= secondPosition.z then
		posDif = posDif + 15
	end
	return posDif
end

function getFormattedWorldTime()
	local worldTime = getWorldTime()
	local hours = math.floor(worldTime / 60)

	local minutes = worldTime % 60
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

table.contains = function(array, value)
	for _, targetColumn in pairs(array) do
		if targetColumn == value then
			return true
		end
	end
	return false
end

string.split = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v
	end
	return res
end

string.trim = function(str)
	return str:match'^()%s*$' and '' or str:match'^%s*(.*%S)'
end

if not nextUseStaminaTime then
	nextUseStaminaTime = {}
end
