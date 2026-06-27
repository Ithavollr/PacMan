##default technical scoreboard
scoreboard objectives add eden.technical dummy

##additional scoreboards
scoreboard objectives add village_names trigger
scoreboard objectives add village_names_msg_on dummy
scoreboard objectives add village_names_msg_off dummy
scoreboard objectives modify village_names displayname "Village Names Title Message Toggle"
scoreboard objectives add eden.used.bell minecraft.custom:minecraft.bell_ring

##init schedules
schedule function village_names:run 2s
schedule function village_names:bell_particles 10t
schedule function village_names:rename/run 5t

##create database
function village_names:database/create

##remove temp storage
data remove storage eden:temp village