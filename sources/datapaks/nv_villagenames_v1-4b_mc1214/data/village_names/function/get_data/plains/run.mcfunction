data modify storage eden:temp village.plains.x set from entity @s Brain.memories.minecraft:meeting_point.value.pos[0]
data modify storage eden:temp village.plains.y set from entity @s Brain.memories.minecraft:meeting_point.value.pos[1]
data modify storage eden:temp village.plains.z set from entity @s Brain.memories.minecraft:meeting_point.value.pos[2]

execute store result storage eden:temp village.plains.id int 1 run random value 1..109
function village_names:get_data/plains/copy_to_temp with storage eden:temp village.plains

data modify storage eden:temp village.plains.color set from storage eden:name_db color.plains

function village_names:set_name with storage eden:temp village.plains

tag @s add eden.villagename.set
data remove storage eden:temp village