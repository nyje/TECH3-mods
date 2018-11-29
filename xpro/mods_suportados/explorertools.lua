--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mod Explorer tools
  ]]


if not minetest.get_modpath("explorertools") then return end

-- Traduções
local S = xpro.S

-- Crafts
for name,xp in pairs({
	-- Ferramentas
	["explorertools:pick_explorer"] = 4,
    ["explorertools:axe_explorer"] = 4,
    ["explorertools:shovel_explorer"] = 4,
}) do
	xpro.register_on_craft(name, xp)
end


