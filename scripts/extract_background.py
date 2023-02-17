from io import BufferedReader
import struct
import sys

address = int(sys.argv[1], 16)
length = int(sys.argv[2], 16)

graphics_data_reference = """
struct GraphicsData {
    void *src;
    void *dest;
    u16 size;
    u16 anim;
};
"""

background_reference = """
typedef struct {
    struct GraphicsData graphics;

    // 'tilesVram' points to tile-index array in VRAM, telling the GBA which tiles to
    // draw on this BG
    //
    // (!!! Data likely different depending on type of Background (Affine vs. Text). !!!)
    //
    // Data-Structure (16 bits): MSB > PPPPYXTTTTTTTTTT < LSB
    // P = Palette Index
    // Y = Y-Flip
    // X = X-Flip
    // T = Tile-Index
    //
    // NOTE: It does NOT point to the tileset!
    // NOTE/TODO (Jace): Should this also be const?
    //                   It's in VRAM, so it doesn't make much sense?
    u16 *tilesVram;
    u16 *unk10;

    u16 unk14;
    u16 unk16;
    u16 unk18;
    u16 unk1A;

    // assetId
    u16 unk1C;
    u16 unk1E;

    u16 unk20;
    u16 unk22;
    u16 unk24;
    u16 unk26;
    u16 unk28;
    u8 unk2A;
    u8 animFrameCounter;
    u8 animDelayCounter;

    u8 unk2D;

    // Flags
    // 0x200 = something about updating animations (sub_8003638)
    u16 unk2E;

    // apparently NOT signed?
    u16 scrollX;
    u16 scrollY;
    u16 prevScrollX;
    u16 prevScrollY;
    u16 *unk38;
    u16 unk3C;
    u16 unk3E;
} Background;
"""

graphics_schema = []

def read_u8(rom: BufferedReader):
    return struct.unpack('B', rom.read(1))[0]

def read_s8(rom: BufferedReader):
    return struct.unpack('b', rom.read(1))[0]

def read_u16(rom: BufferedReader):
    return struct.unpack('H', rom.read(2))[0]

def read_s16(rom: BufferedReader):
    return struct.unpack('h', rom.read(2))[0]

def read_u32(rom: BufferedReader):
    return struct.unpack('I', rom.read(4))[0]

def read_s32(rom: BufferedReader):
    return struct.unpack('i', rom.read(4))[0]

def format_hex(val):
    return f"0x{hex(val)[2:].upper()}"

def read_graphics_data(rom: BufferedReader):
    result = ""
    result += "{" 
    for field, key in graphics_schema:
        align, reader = references[key]
        while rom.tell() % align != 0:
            rom.read(1)
        value = reader(rom)
        result += f"  .{field} = {value},"
    result += "}"
    
    return result


references = {
    "*": (4, lambda rom: f"(void*){format_hex(read_u32(rom))}"),
    "u8": (1, read_u8),
    "u16": (2, read_u16),
    "u32": (4, read_u32),
    "s8": (1, read_s8),
    "s16": (2, read_s16),
    "s32": (4, read_s32),
    "struct GraphicsData": (4, read_graphics_data),
}

for line in graphics_data_reference.split("\n")[2:]:
    for key in references:
        if key in line:
            field = line.split(key)[1].replace(";", "").strip()
            graphics_schema.append((field, key))

background_schema = []

for line in background_reference.split("\n")[2:]:
    for key in references:
        if key in line:
            field = line.split(key)[1].replace(";", "").strip()
            background_schema.append((field, key))
            break

with open('baserom.gba', 'rb') as rom:
    end = address + length
    rom.seek(address)
    while rom.tell() < end:
        print("{")
        for field, key in background_schema:
            align, reader = references[key]
            while rom.tell() % align != 0:
                rom.read(1)
            value = reader(rom)
            print(f".{field} = {value},")
        print("},")
