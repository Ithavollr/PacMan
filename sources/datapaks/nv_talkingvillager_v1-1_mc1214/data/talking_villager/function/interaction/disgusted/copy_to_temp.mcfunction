execute store result score $villager_msg eden.technical run random value 1..3

$execute if score $villager_msg eden.technical matches 1 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.disgusted.creeper.$(id)
$execute if score $villager_msg eden.technical matches 2 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.disgusted.swamp.$(id)
$execute if score $villager_msg eden.technical matches 3 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.disgusted.undead.$(id)
