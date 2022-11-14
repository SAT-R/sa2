from io import BufferedReader
import os
import sys
import struct

address = int(sys.argv[1], 16)
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

def read_s32(rom: BufferedReader):
    return struct.unpack('i', rom.read(4))[0]


def format_hex(val):
    return f"0x{hex(val)[2:].upper()}"

with open('baserom.gba', 'rb') as rom:
    rom.seek(address)
    for i in range(length // 2):
        print(f"{read_s16(rom)}, ", end="")
    # for i in range(length // 2 // 3):
    #     print("{ ", end="")
    #     for j in range(2):
    #         print(f"{read_s16(rom)}" + ", ", end="")
    #     print("},")
    
    print(read_s16(rom))

    # print("{ ", end="")
    # for i in range(length):
    #     print(str(read_u8(rom)) + ", ", end="")
    # print("},")

