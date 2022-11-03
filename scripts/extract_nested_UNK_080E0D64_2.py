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

def format_hex(val):
    return f"0x{hex(val)[2:].upper()}"

langs = [
    "DEFAULT",
    "JAPANESE",
    "ENGLISH",
    "GERMAN",
    "FRENCH",
    "SPANISH",
    "ITALIAN"
]

with open('baserom.gba', 'rb') as rom:
    rom.seek(address)
    for i in range(length // 8 // 7):
        lang = langs[i]
        # num elements
        print("{")
        for j in range(7): 
            unk0 = read_u32(rom)
            unk4 = read_u16(rom)
            element = read_u8(rom)
            print(f"    TextElementAlt2(LANG_{lang}, {element}, {unk0}, {unk4}),")
            
            # unused
            read_u8(rom)
        print("}")
