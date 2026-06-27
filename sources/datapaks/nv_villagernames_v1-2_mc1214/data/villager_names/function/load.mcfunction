##default technical scoreboard
scoreboard objectives add eden.technical dummy

##init schedules
schedule function villager_names:run 3s

##create database
function villager_names:database/create

##remove temp storage
data remove storage eden:temp villager_names