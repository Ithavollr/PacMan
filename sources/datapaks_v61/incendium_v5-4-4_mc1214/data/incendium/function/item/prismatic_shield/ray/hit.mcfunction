scoreboard players set #hit in.fire_laser 1
summon minecraft:firework_rocket ~ ~ ~ {Silent:1b,Motion:[0.0,0.0,0.0],ShotAtAngle:true,LifeTime:0,FireworksItem:{id:"firework_rocket",count:1,components:{fireworks:{flight_duration:1,explosions:[{shape:"small_ball",has_twinkle:true,has_trail:false,colors:[I;16777215]}]}}}}
data modify entity @e[type=firework_rocket,distance=..4,limit=1,sort=nearest] o set from entity @p[gamemode=!spectator] UUID
