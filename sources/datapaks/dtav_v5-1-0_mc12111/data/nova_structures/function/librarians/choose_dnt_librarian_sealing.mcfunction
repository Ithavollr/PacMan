# Revoke advancement from player
advancement revoke @s only nova_structures:mark_sealing_trader

# Tag any nearby novice librarian inside the correct structure as a sealing halls librarian trader
tag @e[type=villager,distance=..15,sort=nearest,predicate=nova_structures:librarian/trade_location_sealing,tag=!dnt_librarian_sealing,nbt={VillagerData:{profession:"minecraft:librarian",level:1}}] add dnt_librarian_sealing