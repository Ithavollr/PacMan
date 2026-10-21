# from: entity/baby_ghast/pre_init
# @s: ghastling body 

attribute @s minecraft:generic.scale base set 0.1
effect give @s fire_resistance infinite 0 true

data modify entity @s PersistenceRequired set value 1b
data modify entity @s Silent set value 1b
data modify entity @s NoAI set value 1b
data modify entity @s[type=ghast] Invulnerable set value 1b
data modify entity @s ArmorDropChances[3] set value 0.0F

scoreboard players set @s in.lifetime 20
scoreboard players set @s in.timer 20

tag @s add in.ticking_entity