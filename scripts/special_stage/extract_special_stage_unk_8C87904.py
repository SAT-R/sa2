from io import BufferedReader
import os
import sys
import struct

start_address = int(sys.argv[1], 16)
length = int(sys.argv[2], 16)

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

def format_hex(val):
    return f"0x{hex(val)[2:].upper()}"

data_offset = 0x000DF6EC

with open('baserom.gba', 'rb') as rom:
    rom.seek(start_address)

    print(f"gUnknown_0{str(hex(start_address + 0x8000000)).replace('0x', '').upper()}:")
    for i in range(length // 4):
        addr = read_u32(rom) - 0x8000000

        offset = (addr - data_offset) // 4
        print(f"    .4byte gUnknown_080DF6EC + ({offset} * 4)")
