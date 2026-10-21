#!/usr/bin/env python3
# Merges Fresh Animations' entity textures into vanilla ones for custom_overlay_mc12111.
# FA paints its extra model parts (eyes etc.) into texture areas vanilla leaves transparent, and
# erases vanilla's painted eyes. Merged = vanilla pixel wherever vanilla is opaque, else FA's pixel:
# vanilla clients see vanilla mobs, EMF clients still get FA's extra parts.
# Needs the 1.21.11 vanilla assets (Cardinal monorepo); output is committed. Rerun when FA or MC updates:
#   python3 fa_vanilla_merge.py [path/to/DefaultPack/assets/minecraft] [output_dir]
import os, struct, sys, zlib

HERE = os.path.dirname(os.path.abspath(__file__))
VANILLA = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, '../../references/DefaultPack/assets/minecraft')
OUT = sys.argv[2] if len(sys.argv) > 2 else os.path.join(HERE, 'sources/resourcepaks/custom_overlay_mc12111/assets/minecraft')
FA = os.path.join(HERE, 'sources/resourcepaks/freshanims_v1-10-4_mc12111')
FA_LAYERS = ['assets', '20-3/assets', '21-2/assets', '21-5/assets', '21-11/assets']  # pack.mcmeta order, later wins


def read_png(path):
    """Decode an 8-bit non-interlaced PNG to (w, h, rows of RGBA bytes)."""
    data = open(path, 'rb').read()
    pos, idat, pal, trns = 8, b'', None, None
    while pos < len(data):
        n = struct.unpack('>I', data[pos:pos + 4])[0]
        kind, body = data[pos + 4:pos + 8], data[pos + 8:pos + 8 + n]
        pos += 12 + n
        if kind == b'IHDR':
            w, h, depth, ctype, _, _, interlace = struct.unpack('>IIBBBBB', body)
        elif kind == b'PLTE':
            pal = [body[i:i + 3] for i in range(0, len(body), 3)]
        elif kind == b'tRNS':
            trns = body
        elif kind == b'IDAT':
            idat += body
    channels = {0: 1, 2: 3, 3: 1, 4: 2, 6: 4}[ctype]
    if interlace or depth == 16 or (depth < 8 and channels != 1):
        raise ValueError(f'unsupported PNG (depth {depth}, interlace {interlace}): {path}')
    bpp = channels if depth == 8 else 1  # filter unit in bytes
    stride = (w * channels * depth + 7) // 8
    raw, prev, rows, i = zlib.decompress(idat), bytearray(stride), [], 0
    for _ in range(h):
        f, line = raw[i], bytearray(raw[i + 1:i + 1 + stride])
        i += 1 + stride
        for x in range(stride):
            a = line[x - bpp] if x >= bpp else 0
            b, c = prev[x], (prev[x - bpp] if x >= bpp else 0)
            if f == 1: line[x] = (line[x] + a) & 255
            elif f == 2: line[x] = (line[x] + b) & 255
            elif f == 3: line[x] = (line[x] + (a + b) // 2) & 255
            elif f == 4:
                pa, pb, pc = abs(b - c), abs(a - c), abs(a + b - 2 * c)
                line[x] = (line[x] + (a if pa <= pb and pa <= pc else b if pb <= pc else c)) & 255
        prev = line
        if depth < 8:  # unpack 1/2/4-bit samples (palette or grayscale) to one byte each
            per = 8 // depth
            line = bytearray((line[x // per] >> (8 - depth * (x % per + 1))) & ((1 << depth) - 1) for x in range(w))
            if ctype == 0:
                line = bytearray(v * 255 // ((1 << depth) - 1) for v in line)
        rgba = bytearray()
        for x in range(w):
            px = line[x * channels:(x + 1) * channels]
            if ctype == 6: rgba += px
            elif ctype == 2: rgba += px + b'\xff'
            elif ctype == 3: rgba += pal[px[0]] + bytes([trns[px[0]] if trns and px[0] < len(trns) else 255])
            elif ctype == 4: rgba += bytes([px[0]] * 3 + [px[1]])
            else: rgba += bytes([px[0]] * 3 + [255])
        rows.append(rgba)
    return w, h, rows


def write_png(path, w, h, rows):
    def chunk(kind, body):
        return struct.pack('>I', len(body)) + kind + body + struct.pack('>I', zlib.crc32(kind + body))
    raw = b''.join(b'\x00' + bytes(r) for r in rows)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, 'wb') as f:
        f.write(b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', w, h, 8, 6, 0, 0, 0))
                + chunk(b'IDAT', zlib.compress(raw, 9)) + chunk(b'IEND', b''))


def merge(vrows, frows, w):
    out = []
    for vr, fr in zip(vrows, frows):
        row = bytearray(vr)
        for x in range(w):
            if vr[x * 4 + 3] == 0:  # vanilla transparent here -> FA's pixel (its extra parts live here)
                row[x * 4:x * 4 + 4] = fr[x * 4:x * 4 + 4]
        out.append(row)
    return out


fa = {}  # entity texture path -> FA file, last layer wins
for layer in FA_LAYERS:
    root = os.path.join(FA, layer, 'minecraft/textures/entity')
    for d, _, files in os.walk(root):
        for name in files:
            if name.endswith('.png'):
                fa[os.path.relpath(os.path.join(d, name), root)] = os.path.join(d, name)

written = skipped = 0
for rel, fa_path in sorted(fa.items()):
    van_path = os.path.join(VANILLA, 'textures/entity', rel)
    if not os.path.exists(van_path):
        skipped += 1  # FA-only texture, vanilla never uses it
        continue
    vw, vh, vrows = read_png(van_path)
    fw, fh, frows = read_png(fa_path)
    if (vw, vh) != (fw, fh):
        print(f'size mismatch, skipped: {rel} vanilla {vw}x{vh} FA {fw}x{fh}')
        skipped += 1
        continue
    merged = merge(vrows, frows, vw)
    # self-check: every opaque vanilla pixel survives unchanged
    assert all(m[x * 4:x * 4 + 4] == v[x * 4:x * 4 + 4] for m, v in zip(merged, vrows) for x in range(vw) if v[x * 4 + 3]), rel
    write_png(os.path.join(OUT, 'textures/entity', rel), vw, vh, merged)
    written += 1
print(f'{written} merged textures written to {OUT}/textures/entity, {skipped} skipped')
