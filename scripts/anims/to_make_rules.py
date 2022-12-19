

with open("graphics.mk", "w") as graphics_file:
    with open("obj_tiles_4bpp.sh") as script_file:
        content = script_file.readlines()
        for line in content:
            line = line.strip()
            _, png_file, bin_file, __, num_tiles = line.split(' ')
            
            filename = png_file.split("/")[-1]
            anim_segment = filename.split("_")[0]
            id = int(anim_segment.split("a")[1])
            folder = f"anim_{id:04}"
                
            rule = f"""
$(OBJ_TILES_4BPP_SUBDIR)/{folder}/{filename.replace(anim_segment + '_', '').replace(".png", ".4bpp")}: %.4bpp: %.png
	$(GFX) $< $@ -num_tiles {num_tiles}
"""
            graphics_file.write(rule)
