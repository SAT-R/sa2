import os

for file_name in os.listdir("voicegroups"):
    with open("voicegroups/" + file_name) as vg_file:
        contents = "".join(vg_file.readlines())
        if ".global" in contents:
            continue

        contents = \
            contents.replace(
                "	.align 2\n",
                "	.align 2\n" + 
                f"	.global {file_name.split('.')[0]}\n"
            )
        
        with open("voicegroups/" + file_name, 'w') as write_file:
            write_file.write(contents)
