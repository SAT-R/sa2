import os
import sys

skipped = []

SONGS_DIR = 'sound/songs'
NON_MATCHED_MIDIS = 'sound/songs/midi/non_matching'
MATCHED_MIDIS = 'sound/songs/midi'
LDSCRIPT = 'ldscript.txt'

to_match = reversed(sorted(map(lambda s: s.split('.s')[0], filter(lambda f: f.endswith('.s') , os.listdir(SONGS_DIR)))))

all_time_signatures = [None]

for denom in range(2, 17):
    if denom % 2 > 0:
        continue

    for num in range(1, 17):
        ts = (num, denom)
        if ts not in all_time_signatures:
            all_time_signatures.append(ts)

for next_song in to_match:
    if next_song != "song0044":
        continue

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


    print('Cleaning build')
    os.system('make tidy >/dev/null 2>&1')

    success = False
    for ts in all_time_signatures:
        if ts:
            print(f'applying time signature {ts[0]}/{ts[1]}')
            os.system(f'python3 scripts/edit_time_signature.py {next_song} {ts[0]} {ts[1]}')
        
        print('Verifying build')
        error = os.system("make >/dev/null 2>&1")
        if not error:
            print('success!')
            os.system('git add -A')
            success = True
            break
        break

    if not success:      
        print('fail, reverting')
        os.system('git checkout -- sound ldscript.txt')
        os.system('git clean -f >/dev/null 2>&1')
