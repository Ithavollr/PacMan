# Run function on tagged scheduled villager
# This allows us to run the next functions directly on the villager, reducing @n/@e selectors
execute as @e[type=villager,tag=dnt_librarian_sculk,tag=dnt_librarian_sculk_schedule] run function nova_structures:librarians/villager_lvcheck_librarian_sculk
