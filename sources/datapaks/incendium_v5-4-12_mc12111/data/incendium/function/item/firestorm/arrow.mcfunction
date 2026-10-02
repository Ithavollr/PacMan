# from: ./on_shot
# @s: firestorm arrow

execute on origin if entity @s[tag=in.self,distance=..5] run tag @s add laser
execute on origin run tag @s remove in.self

function incendium:item/firestorm/ray/start

tag @a remove laser

kill @s
