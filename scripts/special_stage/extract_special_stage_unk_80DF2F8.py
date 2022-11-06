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

data_offset = 0x000DF2F8

with open('baserom.gba', 'rb') as rom:
    rom.seek(start_address)

    new_array = True
    for i in range(length // 8):
        if new_array:
            print(f"\n/** {i} **/")
            new_array = False
        
        print("    { ", end="")

        start = read_u16(rom)
        print(f"{str(start)}, ", end="")
        print(f"{str(read_u16(rom))}, ", end="")
        print(f"{str(read_u16(rom))}, ", end="")
        print(f"{str(read_u8(rom))}, ", end="")
        end = read_u8(rom)
        print(f"{str(end)}, ", end="")

        print("},")

        if start == 0xFFFF:
            new_array = True
