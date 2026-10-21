# Revoke advancement from player
advancement revoke @s only nova_structures:mark_desert_trader

# Tag any nearby novice librarian inside the correct structure as a desert librarian trader
tag @e[type=villager,distance=..15,sort=nearest,predicate=nova_structures:librarian/trade_location_desert,tag=!dnt_librarian_desert,nbt={VillagerData:{profession:"minecraft:librarian",level:1}}] add dnt_librarian_desert