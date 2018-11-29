--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mod xtraores
  ]]


if not minetest.get_modpath("xtraores") then return end

local S = xpro.S

-- Crafts
for name,xp in pairs({
	-- tools
	["xtraores:pick_platinum"] = 4,
	["xtraores:shovel_platinum"] = 4,
	["xtraores:axe_platinum"] = 4,
	["xtraores:sword_platinum"] = 4,
	["xtraores:pick_cobalt"] = 4,
	["xtraores:shovel_cobalt"] = 4,
	["xtraores:axe_cobalt"] = 4,
	["xtraores:sword_cobalt"] = 4,
	["xtraores:pick_osminum"] = 4,
	["xtraores:shovel_osminum"] = 4,
    ["xtraores:axe_osminum"] = 4,
    ["xtraores:pick_adamantite"] = 4,
    ["xtraores:shovel_adamantite"] = 4,
    ["xtraores:axe_adamantite"] = 4,
    ["xtraores:sword_adamantite"] = 4,
    ["xtraores:drill_rarium"] = 4,
    ["xtraores:axe_rarium"] = 4,
    ["xtraores:sword_rarium"] = 4,
    ["xtraores:drill_unobtanium"] = 4,
    ["xtraores:axe_unobtanium"] = 4,
    ["xtraores:sword_unobtanium"] = 4,
    ["xtraores:axe_titanium"] = 6,
    ["xtraores:drill_titanium"] = 6,
    ["xtraores:sword_titanium"] = 6,
    ["xtraores:axe_geminitinum"] = 6,
    ["xtraores:drill_geminitinum"] = 6,
    ["xtraores:sword_geminitinum"] = 6,
    ["xtraores:sword_excalibur"] = 10,
    ["xtraores:spear_platinum"] = 4,
    ["xtraores:spear_cobalt"] = 4,
    ["xtraores:spear_osminum"] = 4,
    ["xtraores:spear_adamantite"] = 4,
    ["xtraores:spear_rarium"] = 4,
    ["xtraores:spear_unobtanium"] = 4,
    ["xtraores:spear_titanium"] = 6,
    ["xtraores:spear_geminitinum"] = 6,
    ["xtraores:titanium_bullet"] = 10,
    ["xtraores:titanium_barrel"] = 10,
    ["xtraores:titanium_top"] = 10,
    ["xtraores:titanium_bottom"] = 10,
    ["xtraores:titanium_handle"] = 10,
    ["xtraores:titanium_mechanism"] = 10,
    ["xtraores:titanium_gun"] = 100,
    ["xtraores:precious_gun"] = 200,
    ["xtraores:chunai"] = 5,
    ["xtraores:375"] = 6,
    ["xtraores:deagle"] = 6,
}) do
	xpro.register_on_craft(name, xp)
end

-- Crafts
for name,xp in pairs({
	-- armor
	["xtraores_armor:helmet_platinum"] = 4,
    ["xtraores_armor:chestplate_platinum"] = 4,
    ["xtraores_armor:leggings_platinum"] = 4,
    ["xtraores_armor:boots_platinum"] = 4,
    ["xtraores_armor:helmet_cobalt"] = 4,
    ["xtraores_armor:chestplate_cobalt"] = 4,
    ["xtraores_armor:leggings_cobalt"] = 4,
    ["xtraores_armor:boots_cobalt"] = 4,
    ["xtraores_armor:helmet_osminum"] = 4,
    ["xtraores_armor:chestplate_osminum"] = 4,
    ["xtraores_armor:leggings_osminum"] = 4,
    ["xtraores_armor:boots_osminum"] = 4,
    ["xtraores_armor:helmet_adamantite"] = 4,
    ["xtraores_armor:chestplate_adamantite"] = 4,
    ["xtraores_armor:leggings_adamantite"] = 4,
    ["xtraores_armor:boots_adamantite"] = 4,
    ["xtraores_armor:helmet_rarium"] = 4,
    ["xtraores_armor:chestplate_rarium"] = 4,
    ["xtraores_armor:leggings_rarium"] = 4,
    ["xtraores_armor:boots_rarium"] = 4,
    ["xtraores_armor:helmet_unobtanium"] = 4,
    ["xtraores_armor:chestplate_unobtanium"] = 4,
    ["xtraores_armor:leggings_unobtanium"] = 4,
    ["xtraores_armor:boots_unobtanium"] = 4,
    ["xtraores_armor:helmet_titanium"] = 4,
    ["xtraores_armor:chestplate_titanium"] = 4,
    ["xtraores_armor:leggings_titanium"] = 4,
    ["xtraores_armor:boots_titanium"] = 4,

}) do
	xpro.register_on_craft(name, xp)
end

-- Crafts
for name,xp in pairs({
	-- shields
	["xtraores_armor:shield_platinum"] = 4,
    ["xtraores_armor:shield_cobalt"] = 4,
    ["xtraores_armor:shield_osminum"] = 4,
    ["xtraores_armor:shield_adamantite"] = 4,
    ["xtraores_armor:shield_rarium"] = 4,
    ["xtraores_armor:shield_unobtanium"] = 4,
    ["xtraores_armor:shield_titanium"] = 4,

}) do
	xpro.register_on_craft(name, xp)
end

-- dig node
for name,xp in pairs({
	-- Minerals
	["xtraores:stone_with_antracite"] = 4,
	["xtraores:stone_with_platinum"] = 4,
    ["xtraores:stone_with_cobalt"] = 4,
    ["xtraores:stone_with_osminum"] = 4,
    ["xtraores:stone_with_adamantite"] = 4,
    ["xtraores:stone_with_rarium"] = 4,
    ["xtraores:stone_with_unobtanium"] = 4,
    ["xtraores:stone_with_titanium"] = 5,
    ["xtraores:stone_with_geminitinum"] = 5,
}) do
	xpro.register_on_dignode(name, xp)
end



