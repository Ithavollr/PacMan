data modify storage eden:temp village.taiga.x set from entity @s Brain.memories.minecraft:meeting_point.value.pos[0]
data modify storage eden:temp village.taiga.y set from entity @s Brain.memories.minecraft:meeting_point.value.pos[1]
data modify storage eden:temp village.taiga.z set from entity @s Brain.memories.minecraft:meeting_point.value.pos[2]

execute store result storage eden:temp village.taiga.id int 1 run random value 1..100
function village_names:get_data/taiga/copy_to_temp with storage eden:temp village.taiga

data modify storage eden:temp village.taiga.color set from storage eden:name_db color.taiga

function village_names:set_name with storage eden:temp village.taiga

tag @s add eden.villagename.set
data remove storage eden:temp village