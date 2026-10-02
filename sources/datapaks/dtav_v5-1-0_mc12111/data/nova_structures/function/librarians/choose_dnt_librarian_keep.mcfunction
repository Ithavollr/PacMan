# Revoke advancement from player
advancement revoke @s only nova_structures:mark_keep_trader

# Tag any nearby novice librarian inside the correct structure as a nether keep librarian trader
tag @e[type=villager,distance=..15,sort=nearest,predicate=nova_structures:librarian/trade_location_keep,tag=!dnt_librarian_keep,nbt={VillagerData:{profession:"minecraft:librarian",level:1}}] add dnt_librarian_keep