import os
import hashlib
import shutil
from pathlib import Path


files_by_hash = {}
sa2_to_sa1_sample = {}


for root, _, files in os.walk("sound/sa2/direct_sound_samples"):
    for file in files:
        if file.endswith(".aif"):
            path = root + "/" + file
            with open(path, 'rb') as f:
                files_by_hash[hashlib.md5(f.read()).hexdigest()] = path

for root, _, files in os.walk("sound/sa1/direct_sound_samples"):
    for file in files:
        if file.endswith(".aif"):
            path = root + "/" + file
            with open(path, 'rb') as f:
                hash = hashlib.md5(f.read()).hexdigest()
                if hash in files_by_hash:
                    sa2_to_sa1_sample[files_by_hash[hash]] = path

for file in sa2_to_sa1_sample:
    new_path = file.replace("/sa2/", "/shared/")
    Path(new_path).parent.mkdir(parents=True, exist_ok=True)
    shutil.copy(file, new_path)

contents = ""
with open("sound/sa1/direct_sound_data.inc") as sound_data_file:
    contents = sound_data_file.read()
    for file in sa2_to_sa1_sample:
        sa1_file = sa2_to_sa1_sample[file]
        contents = contents.replace(sa1_file.replace(".aif", ".bin"), file.replace("/sa2/", "/shared/").replace(".aif", ".bin"))

with open("sound/sa1/direct_sound_data.inc", "w") as sound_data_file:
    sound_data_file.write(contents)

contents = ""
with open("sound/sa2/direct_sound_data.inc") as sound_data_file:
    contents = sound_data_file.read()
    for file in sa2_to_sa1_sample:
        contents = contents.replace(file.replace(".aif", ".bin"), file.replace("/sa2/", "/shared/").replace(".aif", ".bin"))

with open("sound/sa2/direct_sound_data.inc", "w") as sound_data_file:
    sound_data_file.write(contents)

for sa2_file, sa1_file in sa2_to_sa1_sample.items():
    os.remove(sa2_file)
    os.remove(sa1_file)
