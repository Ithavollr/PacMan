# Remove schedule tag
tag @s remove dnt_quest_schedule

# Store villager exp into scoreboard
execute store result score @s dnt_tavern_xp run data get entity @s Xp

# Check if exp is enough to level up, give saddle if true
execute as @s[scores={dnt_tavern_xp=250..},nbt={VillagerData:{level:4}}] run item replace entity @s saddle with saddle[enchantments={"nova_structures:tavern_level_checker":4},equippable={slot:"saddle",equip_sound:"intentionally_empty",allowed_entities:"minecraft:villager",swappable:false,damage_on_hurt:false,can_be_sheared:false}]
execute as @s[scores={dnt_tavern_xp=150..},nbt={VillagerData:{level:3}}] run item replace entity @s saddle with saddle[enchantments={"nova_structures:tavern_level_checker":3},equippable={slot:"saddle",equip_sound:"intentionally_empty",allowed_entities:"minecraft:villager",swappable:false,damage_on_hurt:false,can_be_sheared:false}]
execute as @s[scores={dnt_tavern_xp=70..},nbt={VillagerData:{level:2}}] run item replace entity @s saddle with saddle[enchantments={"nova_structures:tavern_level_checker":2},equippable={slot:"saddle",equip_sound:"intentionally_empty",allowed_entities:"minecraft:villager",swappable:false,damage_on_hurt:false,can_be_sheared:false}]
execute as @s[scores={dnt_tavern_xp=10..},nbt={VillagerData:{level:1}}] run item replace entity @s saddle with saddle[enchantments={"nova_structures:tavern_level_checker":1},equippable={slot:"saddle",equip_sound:"intentionally_empty",allowed_entities:"minecraft:villager",swappable:false,damage_on_hurt:false,can_be_sheared:false}]

