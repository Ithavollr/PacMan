data modify storage eden:temp village.savanna.x set from entity @s Brain.memories.minecraft:meeting_point.value.pos[0]
data modify storage eden:temp village.savanna.y set from entity @s Brain.memories.minecraft:meeting_point.value.pos[1]
data modify storage eden:temp village.savanna.z set from entity @s Brain.memories.minecraft:meeting_point.value.pos[2]

execute store result storage eden:temp village.savanna.id int 1 run random value 1..100
function village_names:get_data/savanna/copy_to_temp with storage eden:temp village.savanna

data modify storage eden:temp village.savanna.color set from storage eden:name_db color.savanna

function village_names:set_name with storage eden:temp village.savanna

tag @s add eden.villagename.set
data remove storage eden:temp village