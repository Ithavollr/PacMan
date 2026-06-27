##default technical scoreboard
scoreboard objectives add eden.technical dummy

##remove temp storage
data remove storage eden:temp villager.talking

##create database
function talking_villager:database/create

##init schedules
schedule function talking_villager:run 5s