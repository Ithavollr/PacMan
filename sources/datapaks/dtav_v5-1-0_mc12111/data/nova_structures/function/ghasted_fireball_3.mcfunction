summon minecraft:fireball ~ ~ ~ {Tags:["dnt_ghasted_fireball"],ExplosionPower:3}
data modify entity @n[type=minecraft:fireball,tag=dnt_ghasted_fireball,sort=nearest] Motion set from entity @s Motion
data modify entity @n[type=minecraft:fireball,tag=dnt_ghasted_fireball,sort=nearest] Owner set from entity @s Owner
kill @s