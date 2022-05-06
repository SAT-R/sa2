import os

mapping = {}

for name in os.listdir('voicegroups'):
    with open('voicegroups/' + name) as vg_file:
        id = name.split('.')[0]
        for line in vg_file.readlines():
            if line.startswith(id):
                mapping[line.split('@')[1].strip().split('0x0')[1]] = id

print(mapping)
