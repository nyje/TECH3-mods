--Define  the Fairy NPC

local modpath, S = ...

local name= "brewing:fairy_lily"

local definition = {
	nametag = "Lily",
	type = "npc",
	hp_min = 20,
	hp_max = 20,
	walk_velocity = 1,
	run_velocity = 3,
	armor = 100,
	visual = "mesh",
	fly = true,
	collisionbox = {-0.125, -0.25, -0.125, 0.125, 0.25, 0.125},
	--selectionbox = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
	mesh = "brewing_fairy.b3d",
	textures = {"brewing_fairy.png"},
	visual_size = {x = 0.25, y = 0.25},
	owner = "",
	crystalball_pos = {},
	animation = {
		stand_start = 0, stand_end = 80, stand_speed = 25,
		--walk_start = 168, walk_end = 188, walk_speed = 25,
		run_start = 168, run_end = 188,
		fly_start = 221, fly_end = 240,
	},
	on_die = function(self, pos)
		local meta = minetest.get_meta(self.crystalball_pos)				
		meta:set_string("owner", "")		
		brewing.lily_entity = nil
	end,
	after_activate = function(self, staticdata, dtime_s)
		if brewing.lily_entity == nil then
			brewing.lily_entity = self
		end
	end,	
}

mobs:register_mob(name, definition)

mobs:register_egg("brewing:fairy_lily", "Fairy Lily", "brewing_fairy_egg.png", 0, false)
