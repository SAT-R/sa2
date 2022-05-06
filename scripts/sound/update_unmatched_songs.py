import os

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

for song_file in os.listdir('songs'):
    if not song_file.endswith('.s'):
        continue

    print("sound/songs/" + song_file)
    
    data = ""
    with open('songs/' + song_file) as f_song:
        data = "".join(f_song.readlines())
    
    for addr in tone_to_vg:
        data = data.replace(f"gUnknown_0{addr}", tone_to_vg[addr])
    
    with open('songs/' + song_file, "w") as f_song:
        f_song.write(data)
