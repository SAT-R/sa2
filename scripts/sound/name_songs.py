import os

ldscript_contents = ""
songs_mk_contents = ""

with open("ldscript.txt") as ldscript:
    ldscript_contents = "".join(ldscript.readlines())

with open("songs.mk") as songs_mk:
    songs_mk_contents = "".join(songs_mk.readlines())

with open("sound/song_table.inc") as song_table:
    song_table_contents = "".join(song_table.readlines())

with open("include/constants/songs.h") as songs_header:
    for line in songs_header.readlines():
        if not line.startswith("#define"):
            continue

        line = line.strip()
        # strip comments
        line = line.split(' //')[0]
        segments = line.split(' ')
        if len(segments) < 3:
            continue

        _, name, number = line.split(' ')
        name = name.lower()
        number = int(number)

        new_midi_name = f"{name}.mid"
        old_midi_name = f"song{number:04}.mid"

        matched = False
        if old_midi_name in os.listdir('sound/songs/midi/'):
            matched = True
            os.rename(f"sound/songs/midi/{old_midi_name}", f"sound/songs/midi/{new_midi_name}")
        elif old_midi_name.replace('.mid', ".s") in os.listdir('sound/songs/'):
            matched = True
            os.rename(f"sound/songs/{old_midi_name.replace('.mid', '.s')}", f"sound/songs/{new_midi_name.replace('.mid', '.s')}")
        
        if matched:
            ldscript_contents = ldscript_contents.replace(old_midi_name.replace('.mid', ".o"), new_midi_name.replace('.mid', ".o"))
            songs_mk_contents = songs_mk_contents.replace(old_midi_name.replace('.mid', ".s"), new_midi_name.replace('.mid', ".s"))
            song_table_contents = song_table_contents.replace(old_midi_name.replace('.mid', ""), new_midi_name.replace('.mid', ""))
        else:
            print("Unmatched", name, number)

with open("ldscript.txt", "w") as ldscript:
    ldscript.write(ldscript_contents)

with open("songs.mk", "w") as songs_mk:
     songs_mk.write(songs_mk_contents)

with open("sound/song_table.inc", "w") as song_table:
     song_table.write(song_table_contents)
