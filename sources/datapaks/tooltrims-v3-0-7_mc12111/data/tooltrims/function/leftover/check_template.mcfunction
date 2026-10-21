execute if entity @s[tag=tooltrims.linear] as @p[gamemode=survival, scores={tooltrims.used_linear=1..}] run function tooltrims:leftover/used_linear
execute if entity @s[tag=tooltrims.tracks] as @p[gamemode=survival, scores={tooltrims.used_tracks=1..}] run function tooltrims:leftover/used_tracks
execute if entity @s[tag=tooltrims.charge] as @p[gamemode=survival, scores={tooltrims.used_charge=1..}] run function tooltrims:leftover/used_charge
execute if entity @s[tag=tooltrims.frost] as @p[gamemode=survival, scores={tooltrims.used_frost=1..}] run function tooltrims:leftover/used_frost
kill @s