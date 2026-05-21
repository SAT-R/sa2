import os
import sys

address = int(sys.argv[1], 16)
length = int(sys.argv[2], 16)
width = sys.argv[3]
if not width.isdigit():
    sys.exit("Error: width must be a positive integer")

def run_cmd(path, args):
    pid = os.posix_spawn(path, args, os.environ)
    os.waitpid(pid, 0)

with open('baserom.gba', 'rb') as rom:
    rom.seek(address)
    base_name = str(hex(0x8000000 + address).upper())[2:]
    name = os.path.basename(base_name + ".bin.lz")
    with open(name, "wb") as bin:  # nosec
        bin.write(rom.read(length))
    run_cmd("tools/gbagfx/gbagfx", ["gbagfx", name, base_name + ".bin"])
    os.rename(f"{base_name}.bin", f"{base_name}.4bpp")
    run_cmd("tools/gbagfx/gbagfx", ["gbagfx", base_name + ".4bpp", base_name + ".png", "-width", width])
