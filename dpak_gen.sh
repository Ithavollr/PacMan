#!/bin/bash

## Remove BS Windows metafiles
find . -name "*:Zone.Identifier" -type f -delete

## Remove data dir & recreate
rm -rf data_v94
mkdir -p data_v94/data

## Sync sources with data, first here is "last" to load, ones farther down will overwrite
# https://modrinth.com/datapack/hopo-better-underwater-ruins
rsync -avhc ./sources/datapaks/hopo_uwruins_v1-2-6_mc12111/data/ ./data_v94/data/
rm -rf ./data_v94/data/minecraft
rm -rf ./data_v94/data/hopo/worldgen/structure_set
# https://modrinth.com/datapack/terralith ; add structures only from Terralith
rsync -avhc ./sources/datapaks/terralith_v2-6-0_mc12111/data/ ./data_v94/data/
rm -rf ./data_v94/data/minecraft
rm -rf ./data_v94/data/biome_tag_villagers
rm -rf ./data_v94/data/c
rm -rf ./data_v94/data/terralith/recipe
rm -rf ./data_v94/data/terralith/worldgen/biome
rm -rf ./data_v94/data/terralith/worldgen/placed_feature
rm -rf ./data_v94/data/terralith/worldgen/density_function
rm -rf ./data_v94/data/terralith/worldgen/configured_feature
rm -rf ./data_v94/data/terralith/worldgen/structure/underground
rm -rf ./data_v94/data/terralith/tags/worldgen/biome
rm -f ./data_v94/data/terralith/worldgen/structure_set/underground_dungeon.json
rm -f ./data_v94/data/terralith/worldgen/structure/underground_cabin.json
rm -rf ./data_v94/data/terralith/worldgen/noise_settings
rm -rf ./data_v94/data/terralith/worldgen/world_preset
rm -rf ./data_v94/data/terralith/worldgen/multi_noise_biome_source_parameter_list
rm -rf ./data_v94/data/sereneseasons
rm -rf ./data_v94/data/tectonic
# https://modrinth.com/datapack/incendium ; terralith for the Nether
rsync -avhc ./sources/datapaks/incendium_v5-4-12_mc12111/data/ ./data_v94/data/
rm -rf ./data_v94/data/minecraft/recipe
rm -rf ./data_v94/data/minecraft/loot_table
rm -rf ./data_v94/data/minecraft/tags/block
rm -rf ./data_v94/data/minecraft/tags/damage_type
rm -rf ./data_v94/data/minecraft/tags/function
# Disable Incendium structures: drop its two structure_sets, and its nether_complexes
# override (whose exclusion_zone points at greater_structures) so the vanilla built-in returns.
rm -f ./data_v94/data/incendium/worldgen/structure_set/greater_structures.json
rm -f ./data_v94/data/incendium/worldgen/structure_set/lesser_structures.json
rm -f ./data_v94/data/minecraft/worldgen/structure_set/nether_complexes.json
# Incendium's nether.json rewrites the noise_router, which kills Ferma
rm -f ./data_v94/data/minecraft/worldgen/noise_settings/nether.json
# https://modrinth.com/datapack/dungeons-and-taverns
rsync -avhc ./sources/datapaks/dtav_v5-1-0_mc12111/data/ ./data_v94/data/
rsync -avhc ./sources/datapaks/dtav_nomag_v4-1_mc12111/data/ ./data_v94/data/
rm -rf ./data_v94/data/nova_structures/worldgen/structure_set
mkdir -p ./data_v94/data/nova_structures/worldgen/structure_set
cp ./sources/datapaks/dtav_v5-1-0_mc12111/data/nova_structures/worldgen/structure_set/bunker.json ./data_v94/data/nova_structures/worldgen/structure_set/
cp ./sources/datapaks/dtav_v5-1-0_mc12111/data/nova_structures/worldgen/structure_set/conduit_ruin.json ./data_v94/data/nova_structures/worldgen/structure_set/
cp ./sources/datapaks/dtav_v5-1-0_mc12111/data/nova_structures/worldgen/structure_set/creeping_crypt.json ./data_v94/data/nova_structures/worldgen/structure_set/
cp ./sources/datapaks/dtav_v5-1-0_mc12111/data/nova_structures/worldgen/structure_set/taverns.json ./data_v94/data/nova_structures/worldgen/structure_set/
cp ./sources/datapaks/dtav_v5-1-0_mc12111/data/nova_structures/worldgen/structure_set/trident_trial_monument.json ./data_v94/data/nova_structures/worldgen/structure_set/
# https://modrinth.com/datapack/qraftyfied ; replaces qrafty's Mushroom Villages + Archeology Dig Sites
rsync -avhc ./sources/datapaks/qraftyfied_v11-0-0_mc12111/data/ ./data_v94/data/
# Place only the dig sites; custom_overlay places mushroom_village and castle_tower
rm -rf ./data_v94/data/qrafty/worldgen/structure_set
mkdir -p ./data_v94/data/qrafty/worldgen/structure_set
cp ./sources/datapaks/qraftyfied_v11-0-0_mc12111/data/qrafty/worldgen/structure_set/archeology.json ./data_v94/data/qrafty/worldgen/structure_set/
cp ./sources/datapaks/qraftyfied_v11-0-0_mc12111/data/qrafty/worldgen/structure_set/archeology_desert.json ./data_v94/data/qrafty/worldgen/structure_set/
cp ./sources/datapaks/qraftyfied_v11-0-0_mc12111/data/qrafty/worldgen/structure_set/archeology_taiga.json ./data_v94/data/qrafty/worldgen/structure_set/
# https://modrinth.com/mod/aquatic-shulkers
# Nothing to do - ported into custom from mod jar
# https://modrinth.com/datapack/katters-structures
rsync -avhc ./sources/datapaks/katters_structs_v2-3-1_mc12111/data/ ./data_v94/data/
# Remove all structure sets; custom_overlay places sky, sea, and underground villages
rm -rf ./data_v94/data/kattersstructures/worldgen/structure_set
# Unlink the Deep Blue dimension; its type, noise_settings and biomes stay as unused content
rm -f ./data_v94/data/kattersstructures/dimension/deep_blue.json
# https://modrinth.com/plugin/tooltrims ; trims for tools ;)
#STAGE2-3# rsync -avhc ./sources/datapaks/tooltrims_dp_v2-3-0b_mc1214/data/ ./data_v94/data/
### always keep custom changes last..
rsync -avhc ./sources/datapaks/custom_overlay_mc12111/data/ ./data_v94/data/

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
$SEDCMD -i 's/"logical_height": 384,/"logical_height": 432,/g' data_v94/data/minecraft/dimension_type/overworld.json
$SEDCMD -i 's/"height": 384,/"height": 432,/g' data_v94/data/minecraft/dimension_type/overworld.json
$SEDCMD -i 's/"height": 384,/"height": 416,/g' data_v94/data/minecraft/worldgen/noise_settings/overworld.json

## Remove lava lakes from vegetation biomes:
# (( MINECRAFT BIOMES ))
# -= Cherry Grove =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v94/data/minecraft/worldgen/biome/cherry_grove.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v94/data/minecraft/worldgen/biome/cherry_grove.json
# -= Dark Forest =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v94/data/minecraft/worldgen/biome/dark_forest.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v94/data/minecraft/worldgen/biome/dark_forest.json
# -= Flower Forest =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v94/data/minecraft/worldgen/biome/flower_forest.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v94/data/minecraft/worldgen/biome/flower_forest.json
# -= Forest =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v94/data/minecraft/worldgen/biome/forest.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v94/data/minecraft/worldgen/biome/forest.json
# -= Meadow =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v94/data/minecraft/worldgen/biome/meadow.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v94/data/minecraft/worldgen/biome/meadow.json
# -= Taiga =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v94/data/minecraft/worldgen/biome/taiga.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v94/data/minecraft/worldgen/biome/taiga.json
# -= Snowy Taiga =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v94/data/minecraft/worldgen/biome/snowy_taiga.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v94/data/minecraft/worldgen/biome/snowy_taiga.json
# -= Old Growth Forests =-
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v94/data/minecraft/worldgen/biome/old_growth_birch_forest.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v94/data/minecraft/worldgen/biome/old_growth_birch_forest.json
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v94/data/minecraft/worldgen/biome/old_growth_pine_taiga.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v94/data/minecraft/worldgen/biome/old_growth_pine_taiga.json
$SEDCMD -i '/^.*"minecraft:lake_lava_surface".*/d' data_v94/data/minecraft/worldgen/biome/old_growth_spruce_taiga.json
$SEDCMD -i 's/"minecraft:lake_lava_underground",/"minecraft:lake_lava_underground"/g' data_v94/data/minecraft/worldgen/biome/old_growth_spruce_taiga.json

#========== REMOVE TICK.JSON =============#
if [ -f data_v94/data/minecraft/tags/function/tick.json ]; then
    echo "WARNING: MC 1.21.x tick hooks found"
    rm -f data_v94/data/minecraft/tags/function/tick.json
fi
if [ -f data_v94/data/minecraft/tags/function/load.json ]; then
    echo "WARNING: MC 1.21.x load hook found"
    rm -f data_v94/data/minecraft/tags/function/load.json
fi
if [ -d data_v94/data/minecraft/tags/functions ]; then
    echo "WARNING: MC pre-1.21 directories found"
    rm -rf data_v94/data/minecraft/tags/functions
fi
# Packs overwrite each other's curse tag (last rsync wins); drop it so vanilla's returns
if [ -f data_v94/data/minecraft/tags/enchantment/curse.json ]; then
    echo "WARNING: curse tag override found"
    rm -f data_v94/data/minecraft/tags/enchantment/curse.json
fi

cp dpack.mcmeta data_v94/pack.mcmeta
cp pack.png data_v94/pack.png
