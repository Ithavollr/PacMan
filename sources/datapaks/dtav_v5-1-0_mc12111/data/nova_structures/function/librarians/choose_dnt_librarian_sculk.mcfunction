# Revoke advancement from player
advancement revoke @s only nova_structures:mark_sculk_trader

# This first checks for the presence of a function from the Ancient City Overhaul datapack, therefore requiring it for the tag to be given.
# If it succeeds, then tag any nearby novice librarian inside the correct structure as a sculk librarian trader

execute if function nova_structures:librarians/ancient_city_overhaul_true run tag @e[type=villager,distance=..15,sort=nearest,predicate=nova_structures:librarian/trade_location_sculk,tag=!dnt_librarian_sculk,nbt={VillagerData:{profession:"minecraft:librarian",level:1}}] add dnt_librarian_sculk