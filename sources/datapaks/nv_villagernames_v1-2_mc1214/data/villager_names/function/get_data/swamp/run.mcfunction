execute store result storage eden:temp villager_names.swamp.id.first_name int 1 run random value 1..398
execute store result storage eden:temp villager_names.swamp.id.last_name int 1 run random value 1..380
function villager_names:get_data/swamp/copy_to_temp with storage eden:temp villager_names.swamp.id

data modify storage eden:temp villager_names.swamp.color set from storage eden:name_db color.swamp

function villager_names:set_name with storage eden:temp villager_names.swamp

tag @s add eden.name.set

data remove storage eden:temp villager_names.swamp

