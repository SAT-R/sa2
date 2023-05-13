import subprocess

size = 0x15b20

while True:
    size += 1
    print(hex(size))
    try:
        subprocess.check_output(f"python3 scripts/extract_bin.py 0x00CBAC04 {hex(size)} && mv 8CBAC04.bin 8CBAC04.bin.lz && ./tools/gbagfx/gbagfx 8CBAC04.bin.lz 8CBAC04.gba", shell=True, )
    except subprocess.CalledProcessError as err:
        continue

    expected_hash = subprocess.check_output("sha1sum 8CBAC04.bin.lz", shell=True).decode().split(" ")[0]

    subprocess.check_output("./tools/gbagfx/gbagfx 8CBAC04.gba 8CBAC04-new.bin.lz -search 2", shell=True)
    new_hash = subprocess.check_output("sha1sum 8CBAC04-new.bin.lz", shell=True).decode().split(" ")[0]
    print(expected_hash, new_hash)

    if new_hash == expected_hash:
        print(hex(size) + " works")

print(hex(size))
