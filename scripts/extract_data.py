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

with open('rom_data.bin', 'rb') as rom:
    rom.seek(address)
    # for i in range(length // 4):
    #     print(f"Q({read_s32(rom) / 256}), ")
    # for i in range(length // 2):
    #     print(f"{read_u16(rom)}, ")
    # for i in range(length // 8):
    #     print(f"{read_u8(rom)}, ")
    # for i in range(length // 4):
    #     print("{ ", end="")
    #     for j in range(2):
    #         print(f"{(read_u16(rom))}" + ", ", end="")
    #     print("},")
    for i in range(length // 4):
        print("{ ", end="")
        # for j in range(2):
        print(f"{(read_u16(rom))}, {(read_u16(rom))}", end="")
        print("},")
    # for i in range(length // 4):
    #     p = read_u32(rom)
    #     idx = int((p - 0x80D859C) / (6 * 4))
    #     print(f"gUnknown_080D859C[{idx}],")

    # print("{ ", end="")
    # for i in range(length):
    #     print(str(read_s8(rom)) + ", ", end="")
    # print("},")
    
    # for i in range(length // 4):
    #     print("{" + f" {read_u16(rom)}, {read_u8(rom)}, {read_u8(rom)} " + "},")
    
    # for i in range(length // 24):
    #     print("{ ", end="")
    #     for j in range(12):
    #         print(f"Q({(read_s16(rom)) / 256})" + (", " if j != 11 else ""), end="")
    #     print("},")


    # for i in range(length // 4):
    #     print(f"void sub_{hex(read_s32(rom) - 1).split('x')[1].upper()}(EggFrog*); ")
