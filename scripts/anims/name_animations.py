import os

animations_contant = ""
songs_mk_contents = ""

with open("data/animations/animations.inc") as animations:
    animations_contant = "".join(animations.readlines())

with open("data/animations/animations_table.inc") as animation_table:
    animation_table_content = "".join(animation_table.readlines())
    
with open("graphics/obj_tiles_4bpp.inc") as tile_table_4bpp:
    tile_table_4bpp_content = "".join(tile_table_4bpp.readlines())

with open("graphics.mk") as graphics_makefile:
    graphics_make_content = "".join(graphics_makefile.readlines())

with open("include/constants/animations.h") as songs_header:
    for line in songs_header.readlines():
        if not line.startswith("#define"):
            continue

        line = line.strip()
        # strip comments
        line = line.split(' //')[0]
        line = " ".join(line.split())
        segments = line.split(' ')
        if len(segments) != 3:
            continue

        _, name, number = segments
        name = name.lower()

        if not name.startswith("sa2_anim") or name.startswith("sa2_anim_variant") or name.startswith("sa2_anim_char_"):
            continue

        try:
            number = int(number)
        except:
            continue

        new_anim_name = f"{name.replace('sa2_', '')}.inc"
        old_anim_name = f"anim_{number:04}.inc"
        old_anim_folder = old_anim_name.replace(".inc", "")
        new_anim_folder = new_anim_name.replace(".inc", "")
        
        matched = False
        if old_anim_name in os.listdir('data/animations/anims/'):
            matched = True

            content = ""
            with open(f"data/animations/anims/{old_anim_name}", "r") as anim_content:
                content = "".join(anim_content.readlines())
                
            content = content.replace(f"anim_{number:04}", f"{name.replace('sa2_', '')}")
            content = content.replace(f"anim_data__{number:04}_", f"{name.replace('sa2_', '')}_variant_")
            
            with open(f"data/animations/anims/{old_anim_name}", "w") as anim_content:
                anim_content.write(content)
            
            print("rename", f"data/animations/anims/{old_anim_name}", f"data/animations/anims/{new_anim_name}")
            os.rename(f"data/animations/anims/{old_anim_name}", f"data/animations/anims/{new_anim_name}")
            
            animations_contant = animations_contant.replace(old_anim_name, new_anim_name)
            animation_table_content = animation_table_content.replace(old_anim_name.replace('.inc', ""), new_anim_name.replace('.inc', ""))
        
        if old_anim_folder in os.listdir('graphics/obj_tiles/4bpp/'):
            print("rename", f"graphics/obj_tiles/4bpp/{old_anim_folder}", f"graphics/obj_tiles/4bpp/{new_anim_folder}")
            os.rename(f"graphics/obj_tiles/4bpp/{old_anim_folder}", f"graphics/obj_tiles/4bpp/{new_anim_folder}")
            tile_table_4bpp_content = tile_table_4bpp_content.replace(old_anim_folder, new_anim_folder)
            graphics_make_content = graphics_make_content.replace(old_anim_folder, new_anim_folder)

        # if not matched:
        #     print("Unmatched", name, number)

with open("data/animations/animations.inc", "w") as animations:
     animations.write(animations_contant)

with open("data/animations/animations_table.inc", "w") as animation_table:
    animation_table.write(animation_table_content)

with open("graphics/obj_tiles_4bpp.inc", "w") as tile_table_4bpp:
    tile_table_4bpp.write(tile_table_4bpp_content)

with open("graphics.mk", "w") as graphics_makefile:
    graphics_makefile.write(graphics_make_content)
