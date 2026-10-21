# Remove schedule tag
tag @s remove dnt_librarian_keep_schedule

# Store villager exp into scoreboard
execute store result score @s dnt_tavern_xp run data get entity @s Xp

# Check if exp is enough to level up, give saddle if true
execute as @s[scores={dnt_tavern_xp=10..},nbt={VillagerData:{level:1}}] run item replace entity @s saddle with saddle[enchantments={"nova_structures:librarian_level_checker":1},equippable={slot:"saddle",equip_sound:"intentionally_empty",allowed_entities:"minecraft:villager",swappable:false,damage_on_hurt:false,can_be_sheared:false}]

