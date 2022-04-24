import os
import sys

skipped = []

SONGS_DIR = 'sound/songs'
NON_MATCHED_MIDIS = 'sound/songs/midi/non_matching'
MATCHED_MIDIS = 'sound/songs/midi'
LDSCRIPT = 'ldscript.txt'

to_match = reversed(sorted(map(lambda s: s.split('.s')[0], filter(lambda f: f.endswith('.s') , os.listdir(SONGS_DIR)))))

for next_song in to_match:
    if next_song in skipped:
        print(f"skipping {next_song}")
        continue
        
    if not next_song:
        print("None left!")
        sys.exit(1)

    print(f"matching {next_song}")
    os.remove(SONGS_DIR + "/" + next_song + ".s")
    os.rename(NON_MATCHED_MIDIS + "/" + next_song + ".mid", MATCHED_MIDIS + "/" + next_song + ".mid")

    ldscript_data = ""
    with open(LDSCRIPT) as ldscript:
        ldscript_data = "".join(ldscript.readlines())

    ldscript_data = ldscript_data.replace("build/sa2/sound/songs/" + next_song + ".o", "build/sa2/sound/songs/midi/" + next_song + ".o")

    with open(LDSCRIPT, "w") as ldscript:
        ldscript.write(ldscript_data)


    os.system("make tidy >/dev/null 2>&1")
    print('Verifying build')
    result = os.system("make >/dev/null 2>&1")
    if not result:
        print('success!')
        os.system('git add -A')
    else:
        print('fail, reverting')
        os.system('git checkout -- sound ldscript.txt')
        os.system('git clean -f >/dev/null 2>&1')
