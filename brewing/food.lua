local modpath, S = ...

--Magic Donut

minetest.register_craftitem("brewing:magic_donut", {
	description = S("Magic Donut"),
	inventory_image = "brewing_magic_donut.png",
	on_use = minetest.item_eat(10),
	groups = {flammable = 2},
})

minetest.register_craftitem("brewing:magic_donut_dough", {
	description = S("Magic Donut Dough"),
	inventory_image = "brewing_magic_donut_dough.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "brewing:magic_donut",
	recipe = "brewing:magic_donut_dough",
	cooktime = 3,
})

minetest.register_craft({
   	type = "shaped",
   	output = "brewing:magic_donut_dough",
   	recipe = {
       	{"", "brewing:magic_dust", ""},        	
   		{"", "farming:flour", ""},
   		{"", "bucket:bucket_river_water", ""},
    }
}) 

--Lemmon Pie

minetest.register_craftitem("brewing:lemmon_pie", {
	description = S("Lemmon Pie"),
	inventory_image = "brewing_lemmon_pie.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craftitem("brewing:lemmon_pie_dough", {
	description = S("Lemmon Pie Dough"),
	inventory_image = "brewing_lemmon_pie_dough.png",
	on_use = minetest.item_eat(5),
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "brewing:lemmon_pie",
	recipe = "brewing:lemmon_pie_dough",
	cooktime = 3,
})

minetest.register_craft({
   	type = "shaped",
   	output = "brewing:lemmon_pie_dough",
   	recipe = {
       	{"", "", ""},        	
   		{"", "farming:flour", ""},
   		{"", "brewing:lemonade", ""},
    }
}) 