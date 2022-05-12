from io import BufferedReader
import os
import struct

table = 0x00C87AAC
table_length = 4
final_recording_end = 0x00C882C7

def read_u32(rom: BufferedReader):
    return struct.unpack('I', rom.read(4))[0]

def file_addr(addr):
    if addr > 0x8000000:
        return addr - 0x8000000
    return addr

with open('baserom.gba', 'rb') as rom:
    rom.seek(table)

    recording_addresses = []

    for i in range(table_length):
        recording_addresses.append(read_u32(rom))

    recording_addresses = sorted(recording_addresses)

    for i in range(table_length):
        start_addr = file_addr(recording_addresses[i])

        print(start_addr)
        length = 0
        if i + 1 >= table_length:
            length = final_recording_end - start_addr
        else:
            length = file_addr(recording_addresses[i + 1]) - start_addr

        rom.seek(start_addr)
        print(length)
        recording_file_uncompressed = f"data/recordings/demo_{i + 1}.bin"
        recording_file_compressed = f"{recording_file_uncompressed}.lz"
        with open(recording_file_compressed, "wb") as recording:
            recording.write(rom.read(length))
        
        os.system(f"tools/gbagfx/gbagfx {recording_file_compressed} {recording_file_uncompressed}")
