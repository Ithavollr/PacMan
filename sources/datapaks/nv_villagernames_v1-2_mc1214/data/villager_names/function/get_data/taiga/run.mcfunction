execute store result storage eden:temp villager_names.taiga.id.first_name int 1 run random value 1..398
execute store result storage eden:temp villager_names.taiga.id.last_name int 1 run random value 1..380
function villager_names:get_data/taiga/copy_to_temp with storage eden:temp villager_names.taiga.id

data modify storage eden:temp villager_names.taiga.color set from storage eden:name_db color.taiga

function villager_names:set_name with storage eden:temp villager_names.taiga

tag @s add eden.name.set

data remove storage eden:temp villager_names.taiga

