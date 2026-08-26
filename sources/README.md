# sources/

Every directory here is a **direct, unmodified unpack** of the pack as hosted online.
Never edit inside one — they are inputs, not workpieces.

All mutation lives in `dpak_gen.sh` / `rpak_gen.sh`, applied to the generated
`data_v61/` / `assets_v46/` output.

| Task | Do this |
|---|---|
| Update a pack | Drop in the new unpack, rename the dir in the script |
| Drop content from a pack | `rm -rf ./data_v61/data/<path>` after that pack's rsync |
| Remove a pack | Delete the dir **and** its rsync lines |
| Add/override a file by hand | Put it in `custom_overlay_mc1214` |

`custom_overlay_mc1214` is the sole exception: it is ours, not an upstream unpack, and
rsyncs last so it wins every collision.
