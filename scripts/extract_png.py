import os
import sys

address = int(sys.argv[1], 16)
length = int(sys.argv[2], 16)
width = sys.argv[3]

with open('baserom.gba', 'rb') as rom:
    rom.seek(address)
    base_name = str(hex(0x8000000 + address).upper())[2:]
    name = base_name+ ".4bpp"
    with open(name, "wb") as bin:
        bin.write(rom.read(length))
    os.system(f"tools/gbagfx/gbagfx {name} {base_name}.png -width {width}")
