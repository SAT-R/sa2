from io import BufferedReader
import struct

song_nums_to_names = {
    "song0001": "song0001",
    "song0002": "song0002",
    "song0106": "song0106",
    "song0107": "song0107",
    "song0108": "song0108"
}

song_volumes = {
    "song0001": 100,
    "song0002": 120,
    "song0004": 100,
    "song0011": 85,
    "song0012": 70,
    "song0013": 66,
    "song0014": 100,
    "song0015": 80,
    "song0016": 90,
    "song0017": 68,
    "song0018": 80,
    "song0019": 95,
    "song0020": 95,
    "song0021": 95,
    "song0022": 95,
    "song0023": 115,
    "song0024": 95,
    "song0025": 95,
    "song0026": 105,
    "song0027": 95,
    "song0028": 105,
    "song0029": 70,
    "song0030": 95,
    "song0031": 127,
    "song0032": 70,
    "song0033": 127,
    "song0034": 95,
    "song0035": 100,
    "song0036": 105,
}

tone_to_vg = {
    '2019D30': 'voicegroup000', 
    '201A180': 'voicegroup001', 
}

play_table_addr = 0x0201A474
num_players = 4
song_table_addr = 0x0201A4A4
num_songs = 37

def addr_to_offset(addr):
    if (addr > 0x02000000):
        return addr -  0x02000000
    return addr

def read_u8(rom: BufferedReader):
    return struct.unpack('B', rom.read(1))[0]

def read_u16(rom: BufferedReader):
    return struct.unpack('H', rom.read(2))[0]

def read_u32(rom: BufferedReader):
    return struct.unpack('I', rom.read(4))[0]


def peek_bytes(rom: BufferedReader, num):
    offset = rom.tell()

    peek = []
    for i in range(num):
        peek.append(read_u8(rom))

    rom.seek(offset)
    return peek


def extract_song_compiler_config(data: BufferedReader, name: str):
    block_count = read_u8(data)
    priority = read_u8(data)
    reverb = read_u8(data)
    tone_addr = read_u32(data)
    
    vg = tone_to_vg[hex(tone_addr).split('0x')[1].upper()]
    vg_id = int(vg.replace('voicegroup', ''))

    vol = song_volumes[name]
    real_name = song_nums_to_names[name] if name in song_nums_to_names else name

    return f"""
$(MID_SUBDIR)/{real_name}.s: %.s: %
	$(MID) $< $@ -E -R{"$(STD_REVERB)" if reverb == 128 else reverb} -G{vg_id} {f"-P{priority}" if priority else ""} -V{vol}
    """

def extract_from_song_table(rom: BufferedReader):
    song_addr_to_name = {}
    song_files = []

    with open("new_songs.inc", "w") as f_song_table:
        with open('new_songs.mk', "w") as f_songs_config:
            f_song_table.write("\t.align 2\n")
            f_song_table.write("\t.global gSongTable\n")
            song_table_addr = hex(rom.tell() + 0x08000000).split("0x")[1]
            f_song_table.write(f"gSongTable:\t@ 0x0{song_table_addr.upper()}\n")

            for song_num in range(num_songs):
                song_addr = read_u32(rom)
                ms = read_u16(rom)
                me = read_u16(rom)


                if song_addr not in song_addr_to_name:
                    song_name = f"song{song_num:04d}"
                    song_addr_to_name[song_addr] = song_name

                    curr_offset = rom.tell()

                    rom.seek(addr_to_offset(song_addr))
                    track_count = read_u8(rom)

                    if track_count != 0:
                        f_songs_config.write(extract_song_compiler_config(rom, song_name))
                        song_files.append(f"build/mb_chao_garden/sound/songs/midi/{song_name}.o(.rodata);")
                    else:
                        song_addr_to_name[song_addr] = "dummy_song_header"

                    rom.seek(curr_offset)
                
                f_song_table.write(f"\tsong {song_addr_to_name[song_addr]}, {ms}, {me}\n")

            if "dummy_song_header" in list(song_addr_to_name.values()):
                f_song_table.write("\n\t.align 2\n")
                f_song_table.write("dummy_song_header:\n")
                f_song_table.write("\t.byte 0, 0, 0, 0\n")
        
    print(song_addr_to_name)
    print("\n".join(song_files))

with open('data/rom_data.bin', 'rb') as rom:
    rom.seek(addr_to_offset(song_table_addr))
    extract_from_song_table(rom)
