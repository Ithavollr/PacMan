data modify storage eden:temp village.swamp.x set from entity @s Brain.memories.minecraft:meeting_point.value.pos[0]
data modify storage eden:temp village.swamp.y set from entity @s Brain.memories.minecraft:meeting_point.value.pos[1]
data modify storage eden:temp village.swamp.z set from entity @s Brain.memories.minecraft:meeting_point.value.pos[2]

execute store result storage eden:temp village.swamp.id int 1 run random value 1..101
function village_names:get_data/swamp/copy_to_temp with storage eden:temp village.swamp

data modify storage eden:temp village.swamp.color set from storage eden:name_db color.swamp

function village_names:set_name with storage eden:temp village.swamp

tag @s add eden.villagename.set
data remove storage eden:temp village