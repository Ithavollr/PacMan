execute if items entity @s hotbar.0 *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run loot replace entity @s hotbar.0 loot tooltrims:charge_template
execute if items entity @s hotbar.1 *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run loot replace entity @s hotbar.1 loot tooltrims:charge_template
execute if items entity @s hotbar.2 *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run loot replace entity @s hotbar.2 loot tooltrims:charge_template
execute if items entity @s hotbar.3 *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run loot replace entity @s hotbar.3 loot tooltrims:charge_template
execute if items entity @s hotbar.4 *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run loot replace entity @s hotbar.4 loot tooltrims:charge_template
execute if items entity @s hotbar.5 *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run loot replace entity @s hotbar.5 loot tooltrims:charge_template
execute if items entity @s hotbar.6 *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run loot replace entity @s hotbar.6 loot tooltrims:charge_template
execute if items entity @s hotbar.7 *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run loot replace entity @s hotbar.7 loot tooltrims:charge_template
execute if items entity @s hotbar.8 *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run loot replace entity @s hotbar.8 loot tooltrims:charge_template

execute if items entity @s inventory.* *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}] run loot give @s loot tooltrims:charge_template
clear @s *[minecraft:stored_enchantments={"tooltrims:_c_charge_template":1}]