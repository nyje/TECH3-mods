local modpath, S = ...

local settings = Settings(modpath .. "/brewing.conf")
brewing.filled_flasks = tonumber(settings:get("filled_flasks"))
brewing.ignitor["name"]= settings:get("ignitor_name")
brewing.ignitor["image"]= settings:get("ignitor_image")
brewing.star_blue_amulet_speedup= tonumber(settings:get("star_blue_amulet_speedup"))
brewing.generate_magic_rose = settings:get_bool("generate_magic_rose", true)
brewing.generate_lemmontree = settings:get_bool("generate_lemmontree", true)