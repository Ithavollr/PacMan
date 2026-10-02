# Revoke advancement from player
advancement revoke @s only nova_structures:mark_jungle_trader

# Tag any nearby novice librarian in the correct structure as a jungle librarian trader
tag @e[type=villager,distance=..15,sort=nearest,predicate=nova_structures:librarian/trade_location_jungle,tag=!dnt_librarian_jungle,nbt={VillagerData:{profession:"minecraft:librarian",level:1}}] add dnt_librarian_jungle