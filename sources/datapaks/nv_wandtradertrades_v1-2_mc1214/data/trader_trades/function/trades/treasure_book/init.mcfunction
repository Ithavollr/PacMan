loot spawn ~ ~ ~ loot eden:gameplay/treasure_book
data modify storage eden:temp trader.trades.treasure_book set from entity @n[type=item,distance=..2,predicate=eden:entity/is_enchanted_book] Item.components
kill @n[type=item,distance=..2,predicate=eden:entity/is_enchanted_book]

function trader_trades:trades/treasure_book/add with storage eden:temp trader.trades

data remove storage eden:temp trader.trades