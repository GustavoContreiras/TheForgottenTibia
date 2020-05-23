-- <action itemid="23574" script="other/glooth_bag.lua"/>

local items = {
	candy_canes = 2688,
	santa_doll = 6512,
	santa_teddy = 11255,
	snowman_doll = 11256,
	stuffed_dragon = 5791,
	teddy_bear = 2112,
	ball_gown = 2659,
	bear_doll = 3954,
	bunnyslippers = 2644,
	moon_backpack = 10521,
	dragon_claw = 5919,
	panda_tedy = 5080,
	glow_baw = 2111,
	double_exp = 8981,
	crystal_coin = 2160,
	
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local rand = math.random(1, 100)
	
	if rand <= 5 then
		player:addItem(items.candy_canes, 40)
	elseif rand >= 6 and rand <= 14 then
		player:addItem(items.double_exp, 1)
		elseif rand >= 15 and rand <= 19 then
		player:addItem(items.crystal_coin, 100)
	elseif rand >= 20 and rand <= 25 then
		player:addItem(items.santa_doll, 1)
	elseif rand >= 26 and rand <= 35 then
		player:addItem(items.glow_baw, 10)	
	elseif rand >= 36 and rand <= 40 then
		player:addItem(items.santa_teddy, 1)
	elseif rand >= 41 and rand <= 55 then
		player:addItem(items.snowman_doll, 1)
	elseif rand >= 56 and rand <= 60 then
		player:addItem(items.stuffed_dragon, 1)
	elseif rand >= 61 and rand <= 70 then
		player:addItem(items.dragon_claw, 1)
	elseif rand >= 71 and rand <= 80 then
		player:addItem(items.panda_tedy, 1)		
	elseif rand >= 81 and rand <= 85 then
		player:addItem(items.teddy_bear, 1)
	elseif rand >= 86 and rand <= 90 then
		player:addItem(items.ball_gown, 1)
	elseif rand >= 91 and rand <= 95 then
		player:addItem(items.bear_doll, 1)
	elseif rand >= 96 and rand <= 99 then
		player:addItem(items.bunnyslippers, 1)
	elseif rand == 100 then
		player:addItem(items.moon_backpack, 1)
	end
	
	item:remove(1)

	return true
end