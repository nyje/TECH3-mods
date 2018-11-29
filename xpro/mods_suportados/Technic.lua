--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mod Technic
  ]]


if not minetest.get_modpath("technic") then return end

-- Traduções
local S = xpro.S

-- Crafts
for name,xp in pairs({
	-- tools
	["technic:water_can"] = 5,
	["technic:lava_can"] = 5,
	["technic:chainsaw"] = 5,
	["technic:flashlight"] = 5,
	["technic:mining_drill"] = 5,
	["technic:mining_drill_mk2"] = 5,
	["technic:mining_drill_mk3"] = 5,
	["technic:laser_mk1"] = 5,
	["technic:laser_mk2"] = 5,
	["technic:laser_mk3"] = 5,
    ["technic:prospector"] = 5,
    ["technic:sonic_screwdriver"] = 5,
    ["technic:treetap"] = 5,
    ["technic:vacuum"] = 5,
    ["technic:lv_alloy_furnace"] = 5,
    ["technic:lv_battery_box0"] = 5,
    ["technic:lv_cable"] = 5,
    ["technic:cnc"] = 5,
    ["technic:lv_compressor"] = 5,
    ["technic:electric_furnace"] = 5,
    ["technic:lv_extractor"] = 5,
    ["technic:lv_generator"] = 5,
    ["technic:geothermal"] = 5,
    ["technic:lv_grinder"] = 5,
    ["technic:music_player"] = 5,
    ["technic:solar_array_lv"] = 5,
    ["technic:solar_panel"] = 5,
    ["technic:water_mill"] = 5,
    ["technic:mv_alloy_furnace"] = 5,
    ["technic:mv_battery_box0"] = 5,
    ["technic:mv_cable"] = 5,
    ["technic:mv_centrifuge"] = 5,
    ["technic:mv_compressor"] = 5,
    ["technic:mv_electric_furnace"] = 5,
    ["technic:mv_extractor"] = 5,
    ["technic:mv_generator"] = 5,
    ["technic:mv_grinder"] = 5,
    ["technic:solar_array_mv"] = 5,
    ["technic:tool_workshop"] = 5,
    ["technic:wind_mill_frame"] = 5,
    ["technic:wind_mill"] = 5,
    ["technic:hv_battery_box0"] = 5,
    ["technic:hv_cable"] = 5,
    ["technic:forcefield_emitter_off"] = 5,
    ["technic:hv_generator"] = 5,
    ["technic:hv_nuclear_reactor_core"] = 5,
    ["technic:quarry"] = 5,
    ["technic:solar_array_hv"] = 5,
    ["technic:coal_alloy_furnace"] = 5,
    ["default:furnace"] = 5,
    ["technic:power_monitor"] = 5,
    ["technic:supply_converter"] = 5,
    ["technic:switching_station"] = 5,
    ["technic:copper_chest"] = 5,
    ["technic:gold_chest"] = 5,
    ["technic:iron_chest"] = 5,
    ["technic:mithril_chest"] = 5,
    ["technic:silver_chest"] = 5,
    ["technic:fine_copper_wire"] = 3,
    ["technic:fine_gold_wire"] = 3,
    ["technic:fine_silver_wire"] = 3,
    ["technic:copper_coil"] = 3,
    ["technic:motor"] = 3,
    ["technic:lv_transformer"] = 3,
    ["technic:mv_transformer"] = 3,
    ["technic:hv_transformer"] = 3,
    ["technic:control_logic_unit"] = 3,
    ["technic:machine_casing"] = 3,
    ["technic:diamond_drill_head"] = 3,
    ["pipeworks:accelerator_tube_1"] = 3,
    ["pipeworks:teleport_tube_1"] = 3,
    ["technic:green_energy_crystal"] = 3,
    ["technic:blue_energy_crystal"] = 3,
    ["technic:red_energy_crystal"] = 3,
}) do
	xpro.register_on_craft(name, xp)
end

-- Ao cavar node
for name,xp in pairs({
	-- minerals
	["technic:mineral_uranium"] = 4,
	["technic:mineral_chromium"] = 4,
    ["technic:mineral_zinc"] = 4,
    ["technic:mineral_lead"] = 4,
    ["technic:mineral_sulfur"] = 4,
}) do
	xpro.register_on_dignode(name, xp)
end



