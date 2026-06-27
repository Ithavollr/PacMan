data modify storage eden:temp village.desert.x set from entity @s Brain.memories.minecraft:meeting_point.value.pos[0]
data modify storage eden:temp village.desert.y set from entity @s Brain.memories.minecraft:meeting_point.value.pos[1]
data modify storage eden:temp village.desert.z set from entity @s Brain.memories.minecraft:meeting_point.value.pos[2]

execute store result storage eden:temp village.desert.id int 1 run random value 1..100
function village_names:get_data/desert/copy_to_temp with storage eden:temp village.desert

data modify storage eden:temp village.desert.color set from storage eden:name_db color.desert

function village_names:set_name with storage eden:temp village.desert

tag @s add eden.villagename.set