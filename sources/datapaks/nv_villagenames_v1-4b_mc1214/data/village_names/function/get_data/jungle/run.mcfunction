data modify storage eden:temp village.jungle.x set from entity @s Brain.memories.minecraft:meeting_point.value.pos[0]
data modify storage eden:temp village.jungle.y set from entity @s Brain.memories.minecraft:meeting_point.value.pos[1]
data modify storage eden:temp village.jungle.z set from entity @s Brain.memories.minecraft:meeting_point.value.pos[2]

execute store result storage eden:temp village.jungle.id int 1 run random value 1..101
function village_names:get_data/jungle/copy_to_temp with storage eden:temp village.jungle

data modify storage eden:temp village.jungle.color set from storage eden:name_db color.jungle

function village_names:set_name with storage eden:temp village.jungle

tag @s add eden.villagename.set
data remove storage eden:temp village