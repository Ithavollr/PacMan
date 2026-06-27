data modify storage eden:temp village.snow.x set from entity @s Brain.memories.minecraft:meeting_point.value.pos[0]
data modify storage eden:temp village.snow.y set from entity @s Brain.memories.minecraft:meeting_point.value.pos[1]
data modify storage eden:temp village.snow.z set from entity @s Brain.memories.minecraft:meeting_point.value.pos[2]

execute store result storage eden:temp village.snow.id int 1 run random value 1..100
function village_names:get_data/snow/copy_to_temp with storage eden:temp village.snow

data modify storage eden:temp village.snow.color set from storage eden:name_db color.snow

function village_names:set_name with storage eden:temp village.snow

tag @s add eden.villagename.set
data remove storage eden:temp village