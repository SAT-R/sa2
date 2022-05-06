import os

name_mappings = {}
id_mappings = {}

i = 1

wave_data_table = ""
with open(f"programmable_wave_data.inc") as wave_table:
    wave_data_table = "".join(wave_table.readlines())


for pcm_file in sorted(os.listdir('programmable_wave_samples')):
    current_id = pcm_file.split('.')[0]
    new_id = f"{i:02d}"
    current_name = f"gUnknown_{current_id}"
    new_name = f"ProgrammableWaveData_{i}"
    
    print(current_id, new_id, current_name, new_name)

    wave_data_table = wave_data_table.replace(f"	.global {current_name}\n", "")
    wave_data_table = wave_data_table.replace(current_name, new_name)
    wave_data_table = wave_data_table.replace(current_id, new_id)

    name_mappings[current_name] = new_name
    id_mappings[current_id] = new_id

    i += 1

with open(f"programmable_wave_data.inc", 'w') as wave_table:
    wave_table.write(wave_data_table)

for current_id in id_mappings:
    os.rename(f'programmable_wave_samples/{current_id}.pcm', f'programmable_wave_samples/{id_mappings[current_id]}.pcm')

for vg_file in os.listdir('voicegroups'):
    vg_data = ""

    with open('voicegroups/' + vg_file) as f_vg:
        vg_data = "".join(f_vg.readlines())

    for current_name in name_mappings:
        vg_data = vg_data.replace(current_name, name_mappings[current_name])
    
    with open('voicegroups/' + vg_file, 'w') as f_vg:
        f_vg.write(vg_data)
