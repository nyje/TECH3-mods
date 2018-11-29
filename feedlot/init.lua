-- feedlot mod Copyright (C) 2017 Gabriel Pérez-Cerezo
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.

-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.



local modpath = minetest.get_modpath( "feedlot" )
dofile(modpath.."/fakeplayer.lua")

local function get_formspec(pos)
   local spos = pos.x .. "," ..pos.y .. "," .. pos.z
   local xbg = default.gui_bg .. default.gui_bg_img .. default.gui_slots
--   local detached_inv = minetest.create_detached_inventory("mailbox_"..owner)
   return "size[8,5.5]" .. xbg .. default.get_hotbar_bg(0, 1.5) ..
      "label[0,0;Feedlot]" ..
      "list[current_name;main;3.5,0;1,1;]" ..
      "list[current_player;main;0,1.5;8,1;]" ..
      "list[current_player;main;0,2.75;8,3;8]" ..
--			"listring[detached:mailbox_" .. owner .. ";drop]" ..
      "listring[current_player;main]"
end
local function get_milker_formspec(pos)
   return    	"size[8,8.5]"..
      default.gui_bg..
      default.gui_bg_img..
      default.gui_slots..
      "label[0,0;Milker]"..
      "label[0,1;Buckets:]"..
      "label[3.5,1;Milk:]"..
      "list[current_name;bucket;1.5,1;1,1;]"..
      "list[current_name;main;4.75,0.96;3,2;]"..
      "list[current_player;main;0,4.25;8,1;]"..
      "list[current_player;main;0,5.5;8,3;8]"..
      "listring[current_name;dst]"..
      "listring[current_player;main]"..
      "listring[current_name;src]"..
      "listring[current_player;main]"..
      default.get_hotbar_bg(0, 4.25)
end


local function on_construct(pos)
   local node = minetest.get_node(pos)
   local meta = minetest.get_meta(pos)
   local inv = meta:get_inventory()
   if node.name == "feedlot:milker" then
      meta:set_string("formspec", get_milker_formspec(pos))
      inv:set_size("bucket", 1)
      inv:set_size("main", 6)
   else
      meta:set_string("formspec", get_formspec(pos))
      inv:set_size("main", 1)
   end
end

local function can_dig(pos)
   local meta = minetest.get_meta(pos)
   local inv = meta:get_inventory()
   return inv:is_empty("main")
end
local tube = {
   insert_object = function(pos, node, stack, direction)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      if node.name == "feedlot:milker" then
	 if stack:get_name() == "bucket:bucket_empty" and inv:room_for_item("bucket", stack) then
	    inv:add_item("bucket", stack)
	    return ItemStack(nil)
	 else
	    return stack
	 end
      end
	 
      if inv:room_for_item("main", stack) and stack:get_name() ~= "bucket:bucket_empty" then
	 inv:add_item("main", stack)
	 return ItemStack(nil)
      else
	 return stack
      end
   end,
   can_insert = function(pos, node, stack, direction)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      if node.name == "feedlot:milker" then
	 if stack:get_name() == "bucket:bucket_empty" then
	    return inv:room_for_item("bucket", stack)
	 else
	    return false
	 end
      else
	 return inv:room_for_item("main", stack) and stack:get_name() ~= "bucket:bucket_empty"
      end
   end,
   input_inventory = "main",
   connect_sides = {left = 0, right = 0, front = 0, back = 0, top = 0, bottom = 1}}

minetest.register_node("feedlot:feedlot", {
			  description = "Feedlot",
			  tiles = {
			     "default_wood.png^feedlot_feed.png",
			     "default_wood.png",
			     "default_wood.png",
			     "default_wood.png",
			     "default_wood.png",
			     "default_wood.png"
			  },
			  drawtype = "nodebox",
			  paramtype = "light",
			  node_box = {
			     type = "fixed",
			     fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.1875, -0.4375}, -- NodeBox6
				{0.4375, -0.5, -0.5, 0.5, -0.1875, 0.5}, -- NodeBox7
				{-0.5, -0.5, 0.4375, 0.5, -0.1875, 0.5}, -- NodeBox8
				{-0.5, -0.5, -0.5, -0.4375, -0.1875, 0.5}, -- NodeBox9
				{-0.4375, -0.5, -0.4375, 0.4375, -0.375, 0.4375}, -- NodeBox10
			     }
			  },
			  allow_metadata_inventory_put = function (_, _, _, stack, _)
			     if stack:get_name() == "bucket:bucket_empty" then
				return 0
			     else
				return stack:get_count()
			     end
			  end,
			  on_construct = on_construct,
			  can_dig = can_dig,
			  groups = {snappy = 3, tubedevice = 1, tubedevice_receiver = 1}, 
			  tube = tube
})
minetest.register_node("feedlot:milker", {
			  description = "Milker",
			  tiles = {
			     "feedlot_milker_top.png",
			     "feedlot_milker_top.png",
			     "feedlot_milker_side.png",
			     "feedlot_milker_side.png",
			     "feedlot_milker_side.png",
			     "feedlot_milker_side.png",
			  },
			  paramtype = "light",
			  allow_metadata_inventory_put = function (_, listname, _, stack, _)			     
			     if listname == "bucket" and stack:get_name() == "bucket:bucket_empty" then
				return stack:get_count()
			     else
				return 0
			     end
			  end,
			  allow_metadata_inventory_move = function (_, _, _, dst, _, count)
				return 0
			  end,
			  on_construct = on_construct,
			  can_dig = can_dig,
			  groups = {snappy = 3, tubedevice = 1, tubedevice_receiver = 1}, 
			  tube = tube
})



local function is_mob(obj)
   return obj.get_luaentity and obj:get_luaentity().name and string.sub(obj:get_luaentity().name,1,string.len("mob"))=="mob"
end


minetest.register_abm({
      label = "Feeding and milking",
      nodenames = {"feedlot:feedlot", "feedlot:milker"},
      interval = 5,
      chance = 1,

      action = function (pos, node)
	 local fake_player = feedlotFakePlayer.create(pos, "fake_player")
	 local radius = 3
	 if node.name == "feedlot:milker" then
	    radius = 5
	 end
	 local objs = minetest.get_objects_inside_radius(pos, radius)
	 for _,obj in ipairs(objs) do
	     ent = obj:get_luaentity()
	     if not obj:is_player() and obj:get_armor_groups().fleshy and obj:get_armor_groups().fleshy > 0 and is_mob(obj) then
		if ent.on_rightclick then
		    if ent.horny and node.name == "feedlot:feedlot" then
			return
		    end
		    obj:get_luaentity():on_rightclick(fake_player)
		end
--	       minetest.chat_send_all("animal fed")
	    end
	 end
      end,
})
	   
minetest.register_craft({
      	output = "feedlot:feedlot",
	recipe = {
	   {"","",""},
	   {"default:wood", "farming:seed_wheat", "default:wood"},
	   {"default:wood", "default:wood", "default:wood"}
}})
minetest.register_craft({
      	output = "feedlot:milker",
	recipe = {
	   {"default:steel_ingot","","default:steel_ingot"},
	   {"default:steel_ingot", "bucket:bucket_empty", "default:steel_ingot"},
	   {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
}})
