from io import BufferedReader
import struct


def read_u8(file: BufferedReader):
    return struct.unpack("B", file.read(1))[0]


def read_s8(file: BufferedReader):
    return struct.unpack("b", file.read(1))[0]


def read_u16(file: BufferedReader):
    return struct.unpack("H", file.read(2))[0]


def read_u32(file: BufferedReader):
    return struct.unpack("I", file.read(4))[0]


def format_hex(val):
    return f"0x{hex(val)[2:].upper()}"


with open("test.vbm", "rb") as vbm:
    signature = vbm.read(4)
    if signature != b"VBM\x1A":
        print("Not a VBM file")
        exit(1)

    vbm.seek(0xC)  # number of frames
    
    num_frames = read_u32(vbm)
    print(f"num_frames: {num_frames}")
    
    vbm.seek(0x15) #  controller flags
    
    num_controllers = read_u8(vbm)
    if num_controllers != 1:
        print(f"Invalid number of controllers {num_controllers}")
        exit(1)
     
    vbm.seek(0x38)
    save_state_offset = read_u32(vbm)
    
    if save_state_offset != 0:
        print("This file contains a save state which means that it's unlikely to be supported")
        
    controller_data_offset = read_u32(vbm)

    name = ""
    for i in range(64):
        char = read_u8(vbm)
        if char != 0:
            name += chr(char)
    print(name)
    
    description = ""
    for i in range(128):
        char = read_u8(vbm)
        if char != 0:
            description += chr(char)
    print(description)
    
    vbm.seek(controller_data_offset)
    controller_data = vbm.read()
    with open("data/recordings/test.bin", "wb") as output:
        output.write(controller_data)
    
        
