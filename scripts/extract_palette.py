import os
import sys

address = int(sys.argv[1], 16)
length = int(sys.argv[2], 16)

with open('baserom.gba', 'rb') as rom:
    rom.seek(address)
    with open("graphics/" + str(hex(0x8000000 + address).upper())[2:] + ".gbapal", "wb") as bin:
        bin.write(rom.read(length))
    os.system(f"tools/gbagfx/gbagfx graphics/8C8796C.gbapal graphics/8C8796C.pal")
