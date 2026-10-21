# Remove advancement from player
advancement revoke @s only nova_structures:give_quest_trader_trade

# Tag potential quest villagers to run functions on, and schedule a function on them the next tick
# Checking for tag "trade5added" is required to make sure the trade additions stop once the librarian reachs Master level.
execute as @e[type=villager,tag=dnt_quest_desert,distance=..5,sort=nearest] unless entity @s[tag=trade5added] run tag @s add dnt_quest_schedule

# Scheduling the function afterwards is required because the villager's exp needs a tick to update after the advancement is triggered
schedule function nova_structures:quest/scheduled 1t