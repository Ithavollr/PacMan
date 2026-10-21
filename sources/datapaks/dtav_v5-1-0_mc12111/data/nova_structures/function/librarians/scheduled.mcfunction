# Run function on tagged scheduled villager
# This allows us to run the next functions directly on the villager, reducing @n/@e selectors
execute as @n[type=villager,tag=dnt_quest_trader,tag=dnt_quest_schedule] run function nova_structures:quest/villager_lvcheck
