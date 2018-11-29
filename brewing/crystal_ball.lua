local modpath, S = ...

--Magic Crystal Ball

minetest.register_node("brewing:magic_crystal_ball", {
	description = S("Magic Crystal Ball"),
	drawtype = "plantlike",
	tiles = {"magic_crystal_ball.png"},
	walkable = false,
	groups = {cracky = 2, attached_node = 1},
	drop = "default:gold_ingot",
	paramtype = "light",
	sunlight_propagates = true,
	light_source = LIGHT_MAX - 1,
	sounds = default.node_sound_glass_defaults(),
	inventory_image = "magic_crystal_ball.png",
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.25, 0.25, 0.4, 0.25 },
	},
	after_place_node = function(pos, placer, itemstack)		
		minetest.set_node(pos, {name = "brewing:magic_crystal_ball", param2 = 1})		
		local meta = minetest.get_meta(pos)
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)		
		if minetest.get_modpath("mobs") == nil or not player or not player:is_player() then -- make sure player is clicking and fairy was not invoket yet
			return
		end					
		local meta = minetest.get_meta(pos)			
		local player_name = player:get_player_name()
		if (brewing.lily_entity == nil) then
			local spawn_pos = {x = pos.x, y = pos.y + 1, z = pos.z}					
			if minetest.get_node(spawn_pos).name == "air" then				
				minetest.add_entity(spawn_pos, "brewing:fairy_lily")			
				brewing.lily_entity.owner = player_name				
				brewing.lily_entity.crystalball_pos = pos --save the crystal ball pos, useful when lily dies (to reset the ownship)				
				meta:set_string("owner", player_name)									
				brewing.magic_sound(player)				
			end
		else			
			if (meta:get_string("owner") == player_name) and (brewing.lily_entity.owner == player_name) then				
				brewing.lily_entity.object:remove()
				brewing.lily_entity = nil
				meta:set_string("owner", "") 			
				minetest.chat_send_player(player_name, S("Lily has returned to her Magic Crystal Ball."))
				brewing.magic_sound(player)
			end
		end
	end,
	on_destruct = function(pos)
		if minetest.get_modpath("mobs") == nil  then
			return
		end	
		local meta = minetest.get_meta(pos)
		if (meta:get_string("owner") ~= "") then
			if (brewing.lily_entity ~= nil) then
				brewing.lily_entity.object:remove()
				brewing.lily_entity = nil	
			end
		end
	end
})

minetest.register_craft({
    type = "shaped",
    output = "brewing:magic_crystal_ball",
    recipe = {
        {"", "brewing:magic_crystal", ""},
        {"brewing:magic_crystal", "brewing:magic_crystal", "brewing:magic_crystal"},
       	{"default:gold_ingot", "brewing:magic_crystal", "default:gold_ingot"},
    }
})