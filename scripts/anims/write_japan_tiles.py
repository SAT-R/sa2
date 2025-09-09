import os


content = ""

with open("graphics/obj_tiles_4bpp.inc") as tiles_file:
    content = tiles_file.read()

for folder in sorted(os.listdir("graphics/obj_tiles/4bpp/")):
    if folder.endswith("_japan"):
        anim_number = int(folder.replace("_japan", "").replace("anim_", ""))
        path = "graphics/obj_tiles/4bpp/" + folder
        base_path = path.replace("_japan", "")
        next_path = f"graphics/obj_tiles/4bpp/anim_{anim_number + 1:04}"
        
        
        start_offset = content.find(f'.incbin "{base_path}/f000.4bpp"')
        if start_offset == -1:
            print(f"Could not find {base_path} in file")
        
        insert = "#ifdef JAPAN\n"

        for anim_file in sorted(os.listdir(path)):
            if anim_file.endswith(".png"):
                insert += f'.incbin "{path}/{anim_file.replace(".png", "")}.4bpp"\n'
        insert += "#else\n"
        content = content[:start_offset] + insert + content[start_offset:]
        
        end_offset = content.find(f'.incbin "{next_path}/f000.4bpp"')
        if end_offset == -1:
            print(f"Could not find {next_path}/f000.4bpp in file")
        content = content[:end_offset] + "#endif\n" + content[end_offset:]
print(content)
