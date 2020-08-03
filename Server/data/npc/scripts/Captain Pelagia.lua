local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)          npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end

local lastSound = 0

function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say('Passages to Venore, Edron, Darashia and Oramond', TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end


local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Edron?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x = 33175, y = 31764, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Venore?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x = 32954, y = 32022, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Svargrond?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x = 32341, y = 31108, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Darashia?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33289, y=32480, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})	
	
local travelNode = keywordHandler:addKeyword({'oramond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Oramond?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x = 33481, y = 31986, z = 7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Thais?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x = 32310, y = 32210, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My name is Captain Bluebear from the Royal Tibia Line.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this sailing-ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this sailing-ship.'})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'line'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'company'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'We can transport everything you want.'})
keywordHandler:addKeyword({'passenger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'We would like to welcome you on board.'})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Venore}, {Edron}, {Darashia} or {Oramond}?'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Venore}, {Edron}, {Darashia} or {Oramond}?'})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Venore}, {Edron}, {Darashia} or {Oramond}?'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Venore}, {Edron}, {Darashia} or {Oramond}?'})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Venore}, {Edron}, {Darashia} or {Oramond}?'})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Venore}, {Edron}, {Darashia} or {Oramond}?'})
keywordHandler:addKeyword({'ice'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'senja'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'folda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'vega'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m not sailing there. This route is afflicted by a ghostship! However I\'ve heard that Captain Fearless from Venore sails there.'})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m not sailing there. This route is afflicted by a ghostship! However I\'ve heard that Captain Fearless from Venore sails there.'})
keywordHandler:addKeyword({'ghost'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Many people who sailed to Darashia never returned because they were attacked by a ghostship! I\'ll never sail there!'})
keywordHandler:addKeyword({'krailos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'This is Krailos. Where do you want to go?'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome on board, |PLAYERNAME|. Where can I {sail} you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye. Recommend us if you were satisfied with our service.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')

npcHandler:addModule(FocusModule:new())