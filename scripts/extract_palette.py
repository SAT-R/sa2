import os
import sys

address = int(sys.argv[1], 16)
length = int(sys.argv[2], 16)

with open('baserom.gba', 'rb') as rom:
    rom.seek(address)
    outpath = "graphics/" + str(hex(0x8000000 + address).upper())[2:] + ".gbapal"
    with open(outpath, "wb") as bin:
        bin.write(rom.read(length))
    os.system(f"tools/gbagfx/gbagfx {outpath} {outpath.replace('.gbapal', '.pal')}")
