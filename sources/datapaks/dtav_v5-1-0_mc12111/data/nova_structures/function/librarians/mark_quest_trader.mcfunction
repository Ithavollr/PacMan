# Revoke advancement from player
advancement revoke @s only nova_structures:mark_quest_trader

# Tag any nearby novice cartographer as a tavern quest trader
tag @e[type=villager,distance=..5,sort=nearest,tag=!dnt_quest_trader,nbt={VillagerData:{profession:"minecraft:cartographer",level:1}}] add dnt_quest_trader