execute store result score $villager_msg eden.technical run random value 1..8

$execute if score $villager_msg eden.technical matches 1 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.curious.ancient_city.$(id)
$execute if score $villager_msg eden.technical matches 2 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.curious.ender_dragon.$(id)
$execute if score $villager_msg eden.technical matches 3 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.curious.harvest.$(id)
$execute if score $villager_msg eden.technical matches 4 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.curious.nether.$(id)
$execute if score $villager_msg eden.technical matches 5 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.curious.piglin.$(id)
$execute if score $villager_msg eden.technical matches 6 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.curious.player.$(id)
$execute if score $villager_msg eden.technical matches 7 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.curious.trial_chamber.$(id)
$execute if score $villager_msg eden.technical matches 8 run return run data modify storage eden:temp villager.talking.msg set from storage eden:dialogue_db villager.curious.world.$(id)