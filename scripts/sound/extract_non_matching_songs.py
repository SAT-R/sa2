ids = [ 9, 13, 14, 15, 16 ]
exclude = [1,2,3,4,5,6,7]

header = """
	.align 2
	@********************** Track  1 **********************@
"""

with open('songs_reference_data.inc') as songs:
    data = "".join(songs.readlines())

    for section in data.split(header):
        if "	.global" not in section:
            continue

        section_song_name = section.split("	.global ")[1].split("_1")[0]
        print(section_song_name)

        no_process = False
        for id in exclude:
            id_song_name = f"song{id:04d}"
            if section_song_name == id_song_name:
                no_process = True
                break

        if no_process:
            continue

        with open("songs/" + section_song_name + ".s", "w") as f_song:
            f_song.write('\t.include "MPlayDef.s"\n')
            f_song.write("\t.section .rodata")
            f_song.write(header)
            f_song.write(section)
