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

data_offset = 0x000DA270

with open('baserom.gba', 'rb') as rom:
    rom.seek(start_address)

    sub_array_addrs = []
    for i in range(length // 4):
        addr = read_u32(rom)
        sub_array_addrs.append(addr - 0x8000000)

    print("")
    for i in range(len(sub_array_addrs)):
        array_addr = sub_array_addrs[i]
        end = sub_array_addrs[i + 1] if i + 1 < len(sub_array_addrs)  else start_address
        print(f"gUnknown_0{str(hex(array_addr + 0x8000000)).replace('0x', '').upper()}:")
        rom.seek(array_addr)
        for j in range((end - array_addr) // 4):
            item_addr = read_u32(rom) - 0x8000000
            offset = (item_addr - data_offset) // 8
            print(f"    .4byte gUnknown_080DA270 + ({offset} * 8)")

    print("")
    print(f"    .global gUnknown_0{str(hex(start_address + 0x8000000)).replace('0x', '').upper()}")
    print(f"gUnknown_0{str(hex(start_address + 0x8000000)).replace('0x', '').upper()}:")
    for array_addr in sub_array_addrs:
        print(f"    .4byte gUnknown_0{str(hex(array_addr + 0x8000000)).replace('0x', '').upper()}") 
    