# from: entity/piglin_villager/init
# @s: village guard

tag @s add in.checked

data modify entity @s CustomName set value '{"translate":"incendium.mob.village.guard.name","fallback":"Village Guard"}'
data modify entity @s DeathLootTable set value "incendium:cvill/mob/guard"
data modify entity @s CannotHunt set value 1b
data modify entity @s ArmorItems set value [{count:1b, id:"minecraft:leather_boots", components:{damage:0}}, {count:1b, id:"minecraft:leather_leggings", components:{damage:0}}, {count:1b, id:"minecraft:golden_chestplate", components:{damage:0}}, {count:1b, id:"minecraft:leather_helmet", components:{damage:0}}]
data modify entity @s HandItems set value [{count:1b, id:"minecraft:wooden_axe", components:{damage:0}}, {}]
data modify entity @s ArmorDropChances set value [0.0,0.0,0.0,0.0]
data modify entity @s HandDropChances set value [0.0,0.0]

attribute @s armor base set 0
attribute @s armor_toughness base set 0
attribute @s attack_damage base set 0
attribute @s follow_range base set 16
attribute @s movement_speed base set 0.3499999940395355