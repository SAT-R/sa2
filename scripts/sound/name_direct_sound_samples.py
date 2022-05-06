import os

name_mappings = {}
id_mappings = {}

i = 1

direct_sound_table_data = ""
with open(f"direct_sound_data.inc") as f_direct_sound_table:
    direct_sound_table_data = "".join(f_direct_sound_table.readlines())

for sound_sample in sorted(os.listdir('direct_sound_samples')):
    if not sound_sample.endswith('.aif'):
        continue

    if not sound_sample.startswith('08'):
        print(f"skipping {sound_sample}")
        continue

    current_id = sound_sample.split('.')[0]
    new_id = f"unknown_{i:03d}"
    current_name = f"gUnknown_{current_id}"
    new_name = f"DirectSoundWaveData_{i}"
    
    print(current_id, new_id, current_name, new_name)

    # Remove the global reference
    direct_sound_table_data = direct_sound_table_data.replace(f"	.global {current_name}\n", "")

    direct_sound_table_data = direct_sound_table_data.replace(current_name, new_name)
    direct_sound_table_data = direct_sound_table_data.replace(current_id, new_id)

    name_mappings[current_name] = new_name
    id_mappings[current_id] = new_id

    i += 1

# print(direct_sound_table_data)

with open(f"direct_sound_data.inc", 'w') as f_direct_sound_table:
    f_direct_sound_table.write(direct_sound_table_data)

for current_id in id_mappings:
    os.rename(f'direct_sound_samples/{current_id}.aif', f'direct_sound_samples/{id_mappings[current_id]}.aif')

for vg_file in os.listdir('voicegroups'):
    vg_data = ""

    with open('voicegroups/' + vg_file) as f_vg:
        vg_data = "".join(f_vg.readlines())

    for current_name in name_mappings:
        vg_data = vg_data.replace(current_name, name_mappings[current_name])
    
    with open('voicegroups/' + vg_file, 'w') as f_vg:
        f_vg.write(vg_data)
