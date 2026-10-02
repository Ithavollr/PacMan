# from: ./iter
# @s: baby ghast

scoreboard players set #hit in.fire_laser 1
summon minecraft:firework_rocket ~ ~ ~ {Silent:1b,Motion:[0.0,0.0,0.0],ShotAtAngle:1,LifeTime:0,FireworksItem:{id:"firework_rocket",count:1,components:{fireworks:{flight_duration:1,explosions:[{shape:'small_ball',has_twinkle:false,has_trail:false,colors:[I;16744448]}]}}}}
kill @e[type=fireball,distance=..3] 