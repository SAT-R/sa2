import shutil
new_file_names = {}

base_folder = "graphics/obj_tiles/4bpp"

with open("graphics.mk", "r") as graphics_file:
    content = "".join(graphics_file.readlines())
    segments = content.split("$(OBJ_TILES_4BPP_SUBDIR)/")[1:]
    for segment in segments:
        file = segment.split(":")[0]
        new_file_names[file] = file.replace(".4bpp", f"_tiles_{segment.split('-num_tiles ')[1].strip()}.4bpp")

with open("graphics/obj_tiles_4bpp.inc", "r") as tiles_inc:
    content = "".join(tiles_inc.readlines())
    for file in new_file_names:
        content = content.replace(file, new_file_names[file])
    
    with open("graphics/obj_tiles_4bpp_new.inc", "w") as tiles_inc_new:
        tiles_inc_new.write(content)

for file in new_file_names:
    print(f"{base_folder}/{file}".replace(".4bpp", ".png"), f"{base_folder}/{new_file_names[file]}".replace(".4bpp", ".png"))
    try:
        shutil.move(f"{base_folder}/{file}".replace(".4bpp", ".png"), f"{base_folder}/{new_file_names[file]}".replace(".4bpp", ".png"))
    except:
        print(f"{base_folder}/{file}".replace(".4bpp", ".png"), "does not exist")
