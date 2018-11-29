local modpath, S = ...

brewing = {
	ignitor = {["name"] = "brewing:magic_dust", ["image"] = "brewing_ignitor_dust_gray.png"},
	water_name = {"bucket:bucket_water", "bucket:bucket_river_water"},
	heart_amulet_hp_inc_by = 5,
	health_amulet_power_level = 15,
	health_amulet_heal_points = 3,
	generate_magic_rose = true,
	generate_lemmontree = true,
	lily_entity = nil,
	isvalidwater = function(water_name_to_check)
		local water_name
		local isvalid = false
		for water_name in brewing.arrayvalues(brewing.water_name) do
			if  water_name == water_name_to_check then
				isvalid = true
				break
			end
		end
		return isvalid
	end,
	posfrontplayer = function(user)
		local d = user:get_look_dir()
		local pos = user:get_pos()
		local player_eye_pos = 1.5
		local posinfront ={
   			x = pos.x + (d.x*2),
   			y = pos.y + player_eye_pos+(d.y*2),
   			z = pos.z + (d.z*2)
		}
		return posinfront
	end,
	flask_name = "vessels:glass_bottle",
	filled_flasks = 5,
	star_blue_amulet_speedup= 1.05,
	potions= {}, --it defined in potion.lua
	craftlist = {},
	register_potioncraft = function(potioncraft)
		brewing.craftlist[#brewing.craftlist+1] = {potioncraft.output	, potioncraft.recipe}
	end,
	--custom function to get only array values of tables, not keys
	arrayvalues = function(arr)
    	local i = 0
    	return function() i = i + 1; return arr[i] end
	end,
	set_filledflasks = function(num)
		brewing.filled_flasks= num
	end,
	set_ignitor = function(name, image)
		brewing.ignitor["name"]= name
		brewing.ignitor["image"]= image
	end,
	get_craft_result = function(itemlist)
		--recipes are 2x3
		local i = 1
		local j = 1		
		local potioncraft
		local match = false
		local output
		--To get the output of the first potion: minetest.chat_send_player("singleplayer", brewing.craftlist[1][1])
		--To get the first ingredient of the first potion: minetest.chat_send_player("singleplayer", brewing.craftlist[1][2][1][1])
		--for key, potioncraft in pairs(brewing.craftlist) do
		for potioncraft in brewing.arrayvalues(brewing.craftlist) do
			--To get the output of the potion: minetest.chat_send_player("singleplayer", potioncraft[1])
			--To get the first ingredient of the 1st row of the potion: minetest.chat_send_player("singleplayer", potioncraft[2][1][1])
			--To get the first ingredient of the 2nd row of the potion: minetest.chat_send_player("singleplayer", potioncraft[2][2][1])
			--To get the second ingredient of the 2nd row of the potion: minetest.chat_send_player("singleplayer", potioncraft[2][2][2])
  			--check recipe concordance
  			--firstly in the 2 rows
			for i= 1, 2, 1 do
				--then in the 3 items of the row
				for j= 1, 3, 1 do
					if potioncraft[2][i][j] ~= itemlist.items[i][j] then
						match = false
						break
					else
						match = true
					end
				end
				--if no coincidence, do not search in the second row
				if match == false then
					break
				end
			end
			--if coincidence with a potioncraft
			if match == true then				
				output = potioncraft[1]
				break
			end
		end
		local item
		if match == true then
			item = ItemStack(output)
			--minetest.chat_send_player("singleplayer", "match")
		else
			item = nil
			--minetest.chat_send_player("singleplayer", "unmatched")
		end
		return item		
	end,
	magic_aura = function(user)
		local minpos = user:get_pos()
		local maxpos = brewing.posfrontplayer(user)
		minetest.add_particlespawner({
			amount = 20,
			time = 1.5,
			minpos = minpos,
			maxpos = maxpos,
			minvel = {x=1, y=1, z=0},
			maxvel = {x=1, y=1, z=0},
			minacc = {x=1, y=1, z=1},
			maxacc = {x=1, y=1, z=1},
			minexptime = 1,
			maxexptime = 1,
			minsize = 0.2,
			maxsize = 0.4,
			collisiondetection = false,
			vertical = false,
			texture = "brewing_magic_particle.png",
			playername = "singleplayer"
		})
	end,
	magic_sound = function(user)
		local player_name = user:get_player_name()
		minetest.sound_play("magic_sound", {to_player = player_name, gain = 0.4})
	end,
}
