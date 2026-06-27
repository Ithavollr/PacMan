execute store result storage eden:temp villager_names.wandering_trader.id.first_name int 1 run random value 1..350
execute store result storage eden:temp villager_names.wandering_trader.id.last_name int 1 run random value 1..350
function villager_names:get_data/wandering_trader/copy_to_temp with storage eden:temp villager_names.wandering_trader.id

data modify storage eden:temp villager_names.wandering_trader.color set from storage eden:name_db color.wandering_trader

function villager_names:set_name with storage eden:temp villager_names.wandering_trader

tag @s add eden.name.set

data remove storage eden:temp villager_names.wandering_trader

