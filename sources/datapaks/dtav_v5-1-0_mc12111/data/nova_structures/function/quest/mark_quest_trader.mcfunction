# Revoke advancement from player
advancement revoke @s only nova_structures:mark_quest_trader

# Tag any nearby novice cartographer inside the correct structure as a tavern quest trader
tag @e[type=villager,distance=..15,sort=nearest,predicate=nova_structures:quest/in_taverns,tag=!dnt_quest_trader,nbt={VillagerData:{profession:"minecraft:cartographer",level:1}}] add dnt_quest_trader