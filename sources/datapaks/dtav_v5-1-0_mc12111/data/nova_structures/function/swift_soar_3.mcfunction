#check if sprint key has been pressed, then tag the ghast as sprinting
execute on controller if predicate nova_structures:sprint_key run execute on vehicle run tag @s add sprinting

#check if forward key is being held while the ghast is tagged as sprinting, then apply flying speed boost
execute on controller if predicate nova_structures:forward_key run execute on vehicle as @s[tag=sprinting] run attribute @s flying_speed modifier add nova_structures:sprint_flight_speed 0.5 add_multiplied_base

#remove sprinting tag from ghast if forward key is not being held down or if no player is riding the ghast
execute on controller unless predicate nova_structures:forward_key run execute on vehicle run tag @s remove sprinting
execute unless predicate nova_structures:ridden_by_player run tag @s remove sprinting

#remove flying speed boost if ghast is not tagged as sprinting
execute as @s[tag=!sprinting] run attribute @s flying_speed modifier remove nova_structures:sprint_flight_speed

#modify player fov depending on sprinting state
execute as @s[tag=sprinting] run execute on passengers run attribute @s movement_speed modifier add nova_structures:boost_player_fov 0.25 add_multiplied_base
execute as @s[tag=!sprinting] run execute on passengers run attribute @s movement_speed modifier remove nova_structures:boost_player_fov