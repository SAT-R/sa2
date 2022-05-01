from io import BufferedReader
import struct

song_nums_to_names = {
    "song0001": "mus_intro",
    "song0002": "mus_title_fanfare",
    "song0106": "se_select",
    "song0107": "se_return",
    "song0108": "se_menu_cursor_move"
}

song_volumes = {
    "song0001": 120,
    "song0002": 120,
    "song0003": 120,
    "song0004": 108,
    "song0005": 115,
    "song0006": 108,
    "song0007": 110,
    "song0009": 100,
    "song0013": 94,
    "song0014": 94,
    "song0015": 94,
    "song0016": 94,
    "song0017": 94,
    "song0018": 94,
    "song0019": 110,
    "song0020": 110,
    "song0021": 110,
    "song0022": 110,
    "song0023": 110,
    "song0024": 120,
    "song0025": 110,
    "song0026": 110,
    "song0027": 110,
    "song0028": 92,
    "song0029": 110,
    "song0031": 86,
    "song0032": 110,
    "song0033": 110,
    "song0034": 110,
    "song0035": 98,
    "song0036": 98,
    "song0037": 100,
    "song0038": 100,
    "song0041": 110,
    "song0042": 100,
    "song0043": 98,
    "song0044": 98,
    "song0045": 100,
    "song0046": 100,
    "song0048": 94,
    "song0049": 94,
    "song0050": 100,
    "song0051": 115,
    "song0052": 115,
    "song0053": 115,
    "song0054": 120,
    "song0055": 100,
    "song0056": 85,
    "song0057": 92,
    "song0058": 105,
    "song0059": 105,
    "song0061": 110,
    "song0064": 105,
    "song0066": 105,
    "song0102": 100,
    "song0103": 120,
    "song0104": 120,
    "song0105": 120,
    "song0106": 90,
    "song0107": 90,
    "song0108": 90,
    "song0109": 110,
    "song0110": 75,
    "song0111": 120,
    "song0112": 120,
    "song0113": 75,
    "song0114": 100,
    "song0115": 75,
    "song0116": 75,
    "song0117": 100,
    "song0118": 127,
    "song0119": 127,
    "song0120": 127,
    "song0121": 107,
    "song0125": 100,
    "song0126": 110,
    "song0127": 120,
    "song0128": 120,
    "song0129": 120,
    "song0131": 120,
    "song0135": 120,
    "song0138": 127,
    "song0139": 70,
    "song0140": 90,
    "song0141": 120,
    "song0142": 110,
    "song0143": 120,
    "song0144": 120,
    "song0145": 120,
    "song0146": 64,
    "song0147": 100,
    "song0148": 120,
    "song0149": 89,
    "song0150": 127,
    "song0151": 100,
    "song0152": 90,
    "song0153": 120,
    "song0154": 90,
    "song0155": 90,
    "song0156": 90,
    "song0157": 90,
    "song0158": 90,
    "song0159": 120,
    "song0160": 120,
    "song0161": 120,
    "song0162": 120,
    "song0163": 120,
    "song0164": 120,
    "song0165": 120,
    "song0166": 120,
    "song0167": 120,
    "song0168": 120,
    "song0169": 88,
    "song0170": 88,
    "song0201": 127,
    "song0202": 127,
    "song0203": 127,
    "song0204": 127,
    "song0205": 127,
    "song0206": 127,
    "song0208": 127,
    "song0209": 127,
    "song0210": 127,
    "song0211": 127,
    "song0212": 127,
    "song0213": 96,
    "song0214": 98,
    "song0215": 98,
    "song0216": 98,
    "song0217": 98,
    "song0218": 100,
    "song0219": 100,
    "song0220": 100,
    "song0221": 100,
    "song0222": 100,
    "song0223": 100,
    "song0224": 100,
    "song0225": 100,
    "song0226": 100,
    "song0227": 100,
    "song0228": 100,
    "song0229": 100,
    "song0230": 100,
    "song0231": 100,
    "song0232": 100,
    "song0234": 100,
    "song0235": 100,
    "song0236": 100,
    "song0237": 65,
    "song0238": 100,
    "song0239": 100,
    "song0241": 100,
    "song0242": 100,
    "song0243": 100,
    "song0244": 100,
    "song0245": 100,
    "song0246": 100,
    "song0248": 100,
    "song0249": 100,
    "song0250": 100,
    "song0251": 100,
    "song0252": 100,
    "song0253": 100,
    "song0254": 100,
    "song0255": 90,
    "song0256": 92,
    "song0257": 100,
    "song0258": 100,
    "song0259": 100,
    "song0260": 100,
    "song0261": 100,
    "song0262": 100,
    "song0263": 100,
    "song0264": 98,
    "song0265": 100,
    "song0266": 100,
    "song0267": 100,
    "song0268": 100,
    "song0269": 100,
    "song0270": 100,
    "song0271": 100,
    "song0272": 100,
    "song0273": 100,
    "song0274": 100,
    "song0275": 100,
    "song0276": 100,
    "song0277": 100,
    "song0278": 100,
    "song0279": 98,
    "song0280": 100,
    "song0281": 90,
    "song0282": 90,
    "song0283": 100,
    "song0284": 98,
    "song0285": 100,
    "song0286": 90,
    "song0287": 100,
    "song0288": 100,
    "song0289": 100,
    "song0290": 100,
    "song0291": 100,
    "song0292": 90,
    "song0293": 100,
    "song0294": 100,
    "song0295": 100,
    "song0296": 100,
    "song0297": 100,
    "song0298": 100,
    "song0300": 120,
    "song0301": 120,
    "song0302": 120,
    "song0303": 120,
    "song0304": 127,
    "song0305": 127,
    "song0306": 127,
    "song0307": 127,
    "song0308": 127,
    "song0309": 127,
    "song0310": 127,
    "song0311": 127,
    "song0312": 127,
    "song0313": 120,
    "song0314": 120,
    "song0315": 120,
    "song0316": 120,
    "song0317": 120,
    "song0318": 120,
    "song0319": 120,
    "song0320": 120,
    "song0321": 120,
    "song0322": 120,
    "song0323": 120,
    "song0324": 127,
    "song0325": 120,
    "song0326": 120,
    "song0327": 120,
    "song0328": 120,
    "song0329": 120,
    "song0331": 120,
    "song0332": 120,
    "song0333": 120,
    "song0401": 103,
    "song0402": 107,
    "song0403": 110,
    "song0404": 100,
    "song0405": 110,
    "song0406": 99,
    "song0407": 120,
    "song0408": 105,
    "song0410": 90,
    "song0411": 105,
    "song0412": 77,
    "song0413": 77,
    "song0414": 77,
    "song0415": 105,
    "song0504": 105,
    "song0505": 110,
    "song0506": 110,
}

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

    vol = song_volumes[name]
    real_name = song_nums_to_names[name] if name in song_nums_to_names else name

    return f"""
$(MID_SUBDIR)/{real_name}.s: %.s: %.mid
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
                        song_files.append(f"build/sa2/sound/songs/midi/{song_name}.o(.rodata);")
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

with open('baserom.gba', 'rb') as rom:
    rom.seek(addr_to_offset(song_table_addr))
    extract_from_song_table(rom)
