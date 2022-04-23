from io import BufferedReader
import struct

tone_to_vg = {
    '8AD1544': 'voicegroup013', 
    '8ACF510': 'voicegroup007', 
    '8ACF384': 'voicegroup006', 
    '8AD1160': 'voicegroup012', 
    '8ACEBD4': 'voicegroup004', 
    '8AD0710': 'voicegroup010', 
    '8AD0D10': 'voicegroup011', 
    '8ACED90': 'voicegroup005', 
    '8ACE3A0': 'voicegroup001', 
    '8AD1F94': 'voicegroup015', 
    '8AD1B44': 'voicegroup014', 
    '8ACDF50': 'voicegroup000', 
    '8AD2108': 'voicegroup016', 
    '8ACE550': 'voicegroup002', 
    '8ACE784': 'voicegroup003', 
    '8AD2558': 'voicegroup017', 
    '8AD2ABC': 'voicegroup019', 
    '8AD2948': 'voicegroup018', 
    '8AD42BC': 'voicegroup023', 
    '8ACFB10': 'voicegroup008', 
    '8AD30BC': 'voicegroup020', 
    '8AD36BC': 'voicegroup021', 
    '8AD0110': 'voicegroup009', 
    '8AD3CBC': 'voicegroup022',
    '8AD470C': 'voicegroup024'
}

play_table_addr = 0x08AD4F1C
num_players = 4
song_table_addr = play_table_addr + (num_players * 12)
num_songs = 507

def addr_to_offset(addr):
    if (addr > 0x08000000):
        return addr -  0x08000000
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
    return f"""
$(MID_SUBDIR)/{name}.s: %.s: %.mid
	$(MID) $< $@ -E -R{"$(STD_REVERB)" if reverb == 128 else reverb} -G{vg_id} {f"-P{priority}" if priority else ""}
    """

def extract_from_song_table(rom: BufferedReader):
    song_addr_to_name = {}

    with open("songs.inc", "w") as f_song_table:
        with open('songs.mk', "w") as f_songs_config:
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
                    else:
                        song_addr_to_name[song_addr] = "dummy_song_header"

                    rom.seek(curr_offset)
                
                f_song_table.write(f"\tsong {song_addr_to_name[song_addr]}, {ms}, {me}\n")

            if "dummy_song_header" in list(song_addr_to_name.values()):
                f_song_table.write("\n\t.align 2\n")
                f_song_table.write("dummy_song_header:\n")
                f_song_table.write("\t.byte 0, 0, 0, 0\n")
        
    print(song_addr_to_name)

with open('baserom.gba', 'rb') as rom:
    rom.seek(addr_to_offset(song_table_addr))
    extract_from_song_table(rom)
