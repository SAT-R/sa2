import os

skipped = []

SONGS_DIR = 'sound/songs'
NON_MATCHED_MIDIS = 'sound/songs/midi/non_matching'
MATCHED_MIDIS = 'sound/songs/midi'
LDSCRIPT = 'ldscript.txt'

to_match = reversed(sorted(map(lambda s: s.split('.s')[0], filter(lambda f: f.endswith('.s') , os.listdir(SONGS_DIR)))))

next_song = list(to_match).pop(0)

os.remove(SONGS_DIR + "/" + next_song + ".s")
os.rename(NON_MATCHED_MIDIS + "/" + next_song + ".mid", MATCHED_MIDIS + "/" + next_song + ".mid")

ldscript_data = ""
with open(LDSCRIPT) as ldscript:
    ldscript_data = "".join(ldscript.readlines())

ldscript_data = ldscript_data.replace("build/sa2/sound/songs/" + next_song + ".o", "build/sa2/sound/songs/midi/" + next_song + ".o")

with open(LDSCRIPT, "w") as ldscript:
    ldscript.write(ldscript_data)

result = os.system("make tidy && make")
if not result:
    print('success!')
    os.system('git add -A')
else:
    print('fail, reverting')
    os.system('git checkout -- .')
