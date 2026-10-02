#!/bin/bash

## Remove BS Windows metafiles
find . -name "*:Zone.Identifier" -type f -delete

## Remove data dir & recreate
rm -rf data_v61
mkdir -p data_v61/data

## Sync sources with data, first here is "last" to load, ones farther down will overwrite
# https://modrinth.com/datapack/hopo-better-underwater-ruins
rsync -avhc ./sources/datapaks/hopo_uwruins_v1-2-2_mc1214/data/ ./data_v61/data/
rm -rf ./data_v61/data/minecraft
rm -rf ./data_v61/data/hopo/worldgen/structure_set
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
rm -f ./data_v61/data/terralith/worldgen/structure/underground_cabin.json
# https://modrinth.com/datapack/incendium ; terralith for the Nether
rsync -avhc ./sources/datapaks/incendium_v5-4-4_mc1214/data/ ./data_v61/data/
rsync -avhc ./sources/datapaks/incendium_v5-4-4_mc1214/1-21-4-overlay/data/ ./data_v61/data/
rm -rf ./data_v61/data/minecraft/recipe
rm -rf ./data_v61/data/minecraft/loot_table
rm -rf ./data_v61/data/minecraft/tags/block
rm -rf ./data_v61/data/minecraft/tags/damage_type
rm -rf ./data_v61/data/minecraft/tags/function
# Disable Incendium structures: drop its two structure_sets, and its nether_complexes
# override (whose exclusion_zone points at greater_structures) so the vanilla built-in returns.
rm -f ./data_v61/data/incendium/worldgen/structure_set/greater_structures.json
rm -f ./data_v61/data/incendium/worldgen/structure_set/lesser_structures.json
rm -f ./data_v61/data/minecraft/worldgen/structure_set/nether_complexes.json
# Incendium's nether.json rewrites the noise_router, which fails Ferma's decoupled baseline
# and drops the world to vanilla generation. custom_overlay ships a vanilla-router replacement;
# this drops Incendium's copy first so the pack never depends on overlay ordering alone.
rm -f ./data_v61/data/minecraft/worldgen/noise_settings/nether.json
# https://modrinth.com/datapack/dungeons-and-taverns
rsync -avhc ./sources/datapaks/dtav_v4-6-3_mc1214/data/ ./data_v61/data/
rsync -avhc ./sources/datapaks/dtav_nomag_v1-5_mc1214/data/ ./data_v61/data/
rm -rf ./data_v61/data/nova_structures/worldgen/structure_set
mkdir -p ./data_v61/data/nova_structures/worldgen/structure_set
cp ./sources/datapaks/dtav_v4-6-3_mc1214/data/nova_structures/worldgen/structure_set/bunker.json ./data_v61/data/nova_structures/worldgen/structure_set/
cp ./sources/datapaks/dtav_v4-6-3_mc1214/data/nova_structures/worldgen/structure_set/conduit_ruin.json ./data_v61/data/nova_structures/worldgen/structure_set/
cp ./sources/datapaks/dtav_v4-6-3_mc1214/data/nova_structures/worldgen/structure_set/creeping_crypt.json ./data_v61/data/nova_structures/worldgen/structure_set/
cp ./sources/datapaks/dtav_v4-6-3_mc1214/data/nova_structures/worldgen/structure_set/taverns.json ./data_v61/data/nova_structures/worldgen/structure_set/
cp ./sources/datapaks/dtav_v4-6-3_mc1214/data/nova_structures/worldgen/structure_set/trident_trial_monument.json ./data_v61/data/nova_structures/worldgen/structure_set/
# https://modrinth.com/datapack/qraftys-mushroom-villages
rsync -avhc ./sources/datapaks/qrafty_shroomvillage_mc1214/data/ ./data_v61/data/
# https://modrinth.com/datapack/qraftys-archeology-dig-sites
rsync -avhc ./sources/datapaks/qrafty_digsites_mc1214/data/ ./data_v61/data/
# https://modrinth.com/mod/aquatic-shulkers
# Nothing to do - ported into custom from mod jar
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
# Fix overworld height:
$SEDCMD -i 's/"logical_height": 384,/"logical_height": 432,/g' data_v61/data/minecraft/dimension_type/overworld.json
$SEDCMD -i 's/"height": 384,/"height": 432,/g' data_v61/data/minecraft/dimension_type/overworld.json
$SEDCMD -i 's/"height": 384,/"height": 416,/g' data_v61/data/minecraft/worldgen/noise_settings/overworld.json

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
