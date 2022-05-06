def remove_comment(vg):
    new_vg_lines = []
    for line in vg.split('\n'):
        if len(line) > 0 and "Voicegroup" not in line:
            new_vg_lines.append(line)
    
    return "\n".join(new_vg_lines)

def replace_ids(contents, ids_map):
    for old_id in ids_map:
        contents = contents.replace(old_id, ids_map[old_id])
    
    return contents

def get_id(vg):
    for line in vg.split('\n'):
        if ":" in line:
            return line.split(':')[0]
    return None

id_num = 0

def get_new_id():
    global id_num
    
    name = f"voicegroup{id_num:03d}"
    id_num += 1

    return name

vg_map = {}

new_vgs = []

with open("voice_groups.inc") as whole_file:
    data = "".join(whole_file.readlines())
    for section in data.split(".align 2")[1:]: 
        vg = "\n".join((section.split('.global')[1].split('\n')[1:]))
        vg = "	.align 2\n" + remove_comment(vg)

        vg_map[get_id(vg)] = get_new_id()
        new_vgs.append(vg)

with open("songs.inc") as songs_file:
    songsdata = "".join(songs_file.readlines())

    with open('new_songs.inc', 'w') as new_songs_file:
        new_songs_file.write(replace_ids(songsdata, vg_map))

for vg in new_vgs:
    with open(f"voicegroups/{vg_map[get_id(vg)]}.inc", 'w') as new_file:
        new_file.write(replace_ids(vg, vg_map))

with open('new_voicegroups.inc', 'w') as vgs_file:
    new_content = "".join(map(lambda val: f".include \"sound/voicegroups/{val}.inc\"\n", vg_map.values()))
    vgs_file.write(new_content)
