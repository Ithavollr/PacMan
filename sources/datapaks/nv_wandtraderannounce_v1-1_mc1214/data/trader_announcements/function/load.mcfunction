##default technical scoreboard
scoreboard objectives add eden.technical dummy

##init schedules
schedule function trader_announcements:run 5s

##remove temp storage
data remove storage eden:temp trader.announcement

## Wandering Trader Team
team add wandering_trader
team modify wandering_trader color blue