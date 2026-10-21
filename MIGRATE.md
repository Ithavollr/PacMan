# Datapack Migration: 1.21.4 → 1.21.11

1.21.11 is data format **94.1** (Mojang `version.json`). Upstream 1.21.11 builds declare
`min_format`/`max_format` in `pack.mcmeta`; ours declares `pack_format: 61`.

Prerequisite: Aincrad on 1.21.11. Nothing below can be tested before that.

## Packs

"Proof" = every file of our `sources/` unpack hashed against the upstream 1.21.4 release.
"Placed" / "loot" = our live structure IDs / live loot tables present in the 1.21.11 build.

| source (1.21.4) | Modrinth project (ID) | proof | 1.21.11 build | placed | loot |
|---|---|---|---|---|---|
| terralith_v2-5-8 | Terralith `8oi3bsk5` | 2215/2215 | 2.6.0 | 22/22 | 53/53 |
| incendium_v5-4-4 | Incendium Legacy `ZVzW5oNS` | 3774/3774 | 5.4.12 | none placed | 141/142 (castle, not placed) |
| hopo_uwruins_v1-2-2 | Hopo Better Underwater Ruins `BuWCQzqf` | 235/235 | 1.2.6 | 1/1 | 13/13 |
| dtav_v4-6-3 | Dungeons and Taverns `tpehi7ww` | 5508/5508 | v5.1.0 | 17/17 | 331/339 (missing 8 belong to unplaced structures and the old trade route) |
| dtav_nomag_v1-5 | DnT Enchant Disabler `jr7t09l6` | 26/26 | 4.1 (for DnT 5.1) | — | — |
| qrafty_shroomvillage + qrafty_digsites | `rzcwdD7B` + `5hXlgCAz` | 22/22, 19/19 | qraftyfied 11.0.0 | 4/4 | — |
| katters_structs_onlyvil_v2-2 | Katters Structures - Village `tzWbvcEg` | 1011/1011 | Katters Structures 2.3.1 | 3/3 | 96/96 |
| tooltrims_dp_v2-3-0b | Tool Trims `uXeEiQk1` | extracted from plugin | 3.0.7 | — | 0/4 item templates |
| custom_overlay | ours (incl. Aquatic Shulkers port) | — | ours | 2 aquatic_shulker | — |

## Steps

### 1. Sources
Replace each source with the pristine 1.21.11 unpack (rule 3 in the root `MIGRATE.md`).

### 2. `dpak_gen.sh`
- **Terralith:** drop both overlay `rsync` lines (2.6.0 has no overlays). Existing `rm` lines apply.
- **Incendium:** drop the `1-21-4-overlay` line; do not `rsync` `26-1-overlay` (format 101 = 26.1).
  Existing `rm` lines apply.
- **DnT:** unchanged; the 5 copied `structure_set` files exist in v5.1.0.
- **Enchant Disabler 4.1** replaces `dtav_nomag`. It must move in lockstep with DnT: DnT 5.1's
  librarian trades run from advancement rewards and enchantment effects, not tick, so stripping
  tick/load does not stop them.
- **qraftyfied** replaces both qrafty packs: `rm -rf qrafty/worldgen/structure_set`, then copy back
  `archeology`, `archeology_desert`, `archeology_taiga` (`mushroom_village` comes from the overlay).
- **Katters Structures 2.3.1:** unchanged (sets removed, overlay places 3).
- **Tool Trims:** extract from the plugin as before.

### 3. `custom_overlay`
73 of its vanilla overrides changed in vanilla between 1.21.4 and 1.21.11; the 1.21.4 copies would
revert those changes.
- **Delete** the 61 biome files that are unmodified 1.21.4 copies (rule 2).
- **Re-derive from 1.21.11 vanilla:** the 4 biomes with spawner edits (frozen_peaks, ice_spikes,
  jagged_peaks, mushroom_fields) and the 10 lava-lake `sed` targets (the pattern still matches).
  1.21.11 moved biome sky/fog colors from `effects` to `attributes`.
- **Delete `dimension_type/the_nether.json`:** Incendium 5.4.12 ships the same `logical_height: 192`
  in the 1.21.11 schema.
- **Re-derive `dimension_type/overworld.json`:** 1.21.11 removed `bed_works`, `effects`,
  `has_raids`, `natural`, `piglin_safe`, `respawn_anchor_works`, `ultrawarm` and added
  `attributes`, `timelines`; `height`/`logical_height` remain, so the height `sed` still applies.
- **Re-derive `noise_settings/nether.json`:** 1.21.11 vanilla + Incendium 5.4.12's surface rule,
  height 192, roof taper 168/192, −0.01 bias on `base_3d_noise`. Re-check Ferma's decoupled baseline.
- **Re-derive `noise_settings/overworld.json`:** 1.21.11 vanilla (router changed); height `sed` applies.
  - `preliminary_surface_level.upper_bound` is clamped to 320. Safe only while solid terrain stays
    below it (top fade, next item); raise the clamp with the fade if the fade ever passes 320.
  - **Terrain height (manual, TODO):** the `y_clamped_gradient` top fade 240→256 (1.0→0.0) forces
    air above y 256 regardless of noise height or Ferma noise — Ferma only replaces climate nodes.
    To use the 416-high noise (top y 352), shift the fade by the same +32 as the top (→ 272→288)
    in **both** `final_density` and `preliminary_surface_level.density`. Unverified: how far the
    vanilla shape actually rises once uncapped (its `depth` gradient still spans −64→320).
- **Re-check** `tags/block/enderman_holdable`, `tags/enchantment/non_treasure`,
  `tags/worldgen/biome/stronghold_biased_to` against 1.21.11.

### 4. `pack.mcmeta`
Set format 94.1 for `dpack.mcmeta`.

## Unverified until Aincrad runs 1.21.11
- Whether 1.21.11 still accepts `pack_format` alone.
- Block/item data inside structure `.nbt` templates.
