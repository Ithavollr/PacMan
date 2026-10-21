# check whether the player has a fresh trim or a template to convert
execute if items entity @s player.cursor #tooltrims:trimmable_tools[minecraft:custom_model_data] run item modify entity @s player.cursor tooltrims:convert_fresh_trim
execute if items entity @s container.* #tooltrims:trimmable_tools[minecraft:custom_model_data] run function tooltrims:convert_item/fresh_trim_in_inventory

execute if items entity @s container.* *[minecraft:stored_enchantments={"tooltrims:_a_linear_template":1}] run function tooltrims:convert_item/linear
execute if items entity @s container.* *[minecraft:stored_enchantments={"tooltrims:_b_tracks_template":1}] run function tooltrims:convert_item/tracks
execute if items entity @s container.* *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run function tooltrims:convert_item/charge
execute if items entity @s container.* *[minecraft:stored_enchantments={"tooltrims:_d_frost_template":1}] run function tooltrims:convert_item/frost