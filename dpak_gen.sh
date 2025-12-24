#!/bin/bash

## Remove BS Windows metafiles
find . -name "*:Zone.Identifier" -type f -delete

## Remove data dir & recreate
rm -rf data_v61
mkdir -p data_v61/data

## Sync sources with data, first here is "last" to load, ones farther down will overwrite
# https://modrinth.com/datapack/terralith ; add structures only from Terralith
rsync -avhc ./sources/datapaks/terralith_v2-5-8_mc1214/data/ ./data_v61/data/
rsync -avhc ./sources/datapaks/terralith_v2-5-8_mc1214/1-21-2-overlay/data/ ./data_v61/data/
rsync -avhc ./sources/datapaks/terralith_v2-5-8_mc1214/1-21-4-overlay/data/ ./data_v61/data/
rm -rf ./data_v61/data/minecraft
rm -rf ./data_v61/data/biome_tag_villagers
rm -rf ./data_v61/data/c
rm -rf ./data_v61/data/terralith/recipe
rm -rf ./data_v61/data/terralith/worldgen/biome
rm -rf ./data_v61/data/terralith/worldgen/placed_feature
rm -rf ./data_v61/data/terralith/worldgen/density_function
rm -rf ./data_v61/data/terralith/worldgen/configured_feature
rm -rf ./data_v61/data/terralith/worldgen/structure/underground
rm -rf ./data_v61/data/terralith/tags/worldgen/biome
rm -f ./data_v61/data/terralith/worldgen/structure_set/underground_dungeon.json
# https://modrinth.com/datapack/continents ; make continents larger
rsync -avhc ./sources/datapaks/continents_v1-1-10_mc1214/data/ ./data_v61/data/
# https://modrinth.com/datapack/incendium ; terralith for the Nether
rsync -avhc ./sources/datapaks/incendium_v5-4-4_mc1214/data/ ./data_v61/data/
rsync -avhc ./sources/datapaks/incendium_v5-4-4_mc1214/1-21-4-overlay/data/ ./data_v61/data/
rm -rf ./data_v61/data/minecraft/recipe
rm -rf ./data_v61/data/minecraft/loot_table
rm -rf ./data_v61/data/minecraft/tags/block
rm -rf ./data_v61/data/minecraft/tags/damage_type
rm -rf ./data_v61/data/minecraft/tags/function
# https://modrinth.com/datapack/nullscape ; terralith for the End
rsync -avhc ./sources/datapaks/nullscape_v1-2-13_mc1214/data/ ./data_v61/data/
rsync -avhc ./sources/datapaks/nullscape_v1-2-13_mc1214/1-21-2-overlay/data/ ./data_v61/data/
rsync -avhc ./sources/datapaks/nullscape_v1-2-13_mc1214/1-21-4-overlay/data/ ./data_v61/data/
# https://modrinth.com/datapack/dungeons-and-taverns
rsync -avhc ./sources/datapaks/dtav_v4-6-3_mc1214/data/ ./data_v61/data/
rsync -avhc ./sources/datapaks/dtav_nomag_v1-5_mc1214/data/ ./data_v61/data/
rm -rf ./data_v61/data/nova_structures/worldgen/structure_set
mkdir -p ./data_v61/data/nova_structures/worldgen/structure_set
cp ./sources/datapaks/dtav_v4-6-3_mc1214/data/nova_structures/worldgen/structure_set/conduit_ruin.json ./data_v61/data/nova_structures/worldgen/structure_set/
# https://modrinth.com/datapack/tectonic
rsync -avhc ./sources/datapaks/tectonic_v2-4-2_mc1214/data/ ./data_v61/data/
# https://modrinth.com/datapack/qraftys-mushroom-villages
rsync -avhc ./sources/datapaks/qrafty_shroomvillage_mc1214/data/ ./data_v61/data/
# https://modrinth.com/datapack/qraftys-archeology-dig-sites
rsync -avhc ./sources/datapaks/qrafty_digsites_mc1214/data/ ./data_v61/data/
# https://modrinth.com/mod/aquatic-shulkers
# Nothing to do - ported into custom from mod jar
# NV Packs
# rsync -avhc ./sources/datapaks/nv_nitwitquests_v1-1_mc1214/data/ ./data_v61/data/ -- breaks tick_thread, move to cardinal
# rsync -avhc ./sources/datapaks/nv_talkingvillager_v1-1_mc1214/data/ ./data_v61/data/ -- move to cardinal
# rsync -avhc ./sources/datapaks/nv_villagenames_v1-4b_mc1214/data/ ./data_v61/data/ -- move to cardinal
# rsync -avhc ./sources/datapaks/nv_villagernames_v1-2_mc1214/data/ ./data_v61/data/ -- move to cardinal
# rsync -avhc ./sources/datapaks/nv_wandtraderannounce_v1-1_mc1214/data/ ./data_v61/data/ -- move to cardinal
# rsync -avhc ./sources/datapaks/nv_wandtradertrades_v1-2_mc1214/data/ ./data_v61/data/ -- move to cardinal
rsync -avhc ./sources/datapaks/katters_structs_onlyvil_v2-2_mc1214/data/ ./data_v61/data/
# Remove all villages except sky, sea, and underground
rm -rf ./data_v61/data/kattersstructures/worldgen/structure_set
# https://modrinth.com/plugin/tooltrims ; trims for tools ;)
rsync -avhc ./sources/datapaks/tooltrims_dp_v2-3-0b_mc1214/data/ ./data_v61/data/
### always keep custom changes last..
rsync -avhc ./sources/datapaks/custom_overlay_mc1214/data/ ./data_v61/data/

## Handle OS sed commands:
unamestr=$(uname)

if [ "$unamestr" = "Darwin" ]; then
    SEDCMD='gsed'
elif [ "$unamestr" = "Linux" ]; then
    SEDCMD='sed'
fi

## Make continents larger:
#sed -i 's/"xz_scale": 0.13,/"xz_scale": 0.08,/g' data/minecraft/worldgen/density_function/overworld/base_continents.json
#sed -i 's/"xz_scale": 0.2,/"xz_scale": 0.12,/g' data/minecraft/worldgen/density_function/overworld_large_biomes/base_continents.json

## World Settings Tweaks
# Remove noise caves:
$SEDCMD -i 's/"aquifers_enabled": true,/"aquifers_enabled": true,\n\    "noise_caves_enabled": false,/g' data_v61/data/minecraft/worldgen/noise_settings/overworld.json
# Fix overworld height:
$SEDCMD -i 's/"logical_height": 480,/"logical_height": 432,/g' data_v61/data/minecraft/dimension_type/overworld.json
$SEDCMD -i 's/"height": 480,/"height": 432,/g' data_v61/data/minecraft/dimension_type/overworld.json
$SEDCMD -i 's/"height": 384,/"height": 416,/g' data_v61/data/minecraft/worldgen/noise_settings/overworld.json
# Fix end height:
$SEDCMD -i 's/"logical_height": 384,/"logical_height": 320,/g' data_v61/data/minecraft/dimension_type/the_end.json
$SEDCMD -i 's/"height": 384,/"height": 320,/g' data_v61/data/minecraft/dimension_type/the_end.json

## Remove lava lakes from vegetation biomes:
# (( MINECRAFT BIOMES ))
# -= Cherry Grove =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v61/data/minecraft/worldgen/biome/cherry_grove.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v61/data/minecraft/worldgen/biome/cherry_grove.json
# -= Dark Forest =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v61/data/minecraft/worldgen/biome/dark_forest.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v61/data/minecraft/worldgen/biome/dark_forest.json
# -= Flower Forest =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v61/data/minecraft/worldgen/biome/flower_forest.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v61/data/minecraft/worldgen/biome/flower_forest.json
# -= Forest =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v61/data/minecraft/worldgen/biome/forest.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v61/data/minecraft/worldgen/biome/forest.json
# -= Meadow =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v61/data/minecraft/worldgen/biome/meadow.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v61/data/minecraft/worldgen/biome/meadow.json
# -= Taiga =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v61/data/minecraft/worldgen/biome/taiga.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v61/data/minecraft/worldgen/biome/taiga.json
# -= Snowy Taiga =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v61/data/minecraft/worldgen/biome/snowy_taiga.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v61/data/minecraft/worldgen/biome/snowy_taiga.json
# -= Old Growth Forests =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v61/data/minecraft/worldgen/biome/old_growth_birch_forest.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v61/data/minecraft/worldgen/biome/old_growth_birch_forest.json
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v61/data/minecraft/worldgen/biome/old_growth_pine_taiga.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v61/data/minecraft/worldgen/biome/old_growth_pine_taiga.json
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v61/data/minecraft/worldgen/biome/old_growth_spruce_taiga.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v61/data/minecraft/worldgen/biome/old_growth_spruce_taiga.json

#========== REMOVE TICK.JSON =============#
if [ -f data_v61/data/minecraft/tags/function/tick.json ]; then
    echo "WARNING: MC 1.21.x tick hooks found"
    rm -f data_v61/data/minecraft/tags/function/tick.json
fi
if [ -f data_v61/data/minecraft/tags/function/load.json ]; then
    echo "WARNING: MC 1.21.x load hook found"
    rm -f data_v61/data/minecraft/tags/function/load.json
fi
if [ -d data_v61/data/minecraft/tags/functions ]; then
    echo "WARNING: MC pre-1.21 directories found"
    rm -rf data_v61/data/minecraft/tags/functions
fi

cp dpack.mcmeta data_v61/pack.mcmeta
cp pack.png data_v61/pack.png
