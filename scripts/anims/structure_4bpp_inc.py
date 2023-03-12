content = ""
with open("graphics/obj_tiles_4bpp_new.inc", "w") as new:
    with open("graphics/obj_tiles_4bpp.inc", "r") as file:
        for line in file.readlines():
            if "graphics/obj_tiles/4bpp" in line:
                filename = line.split("/")[-1]
                anim_segment = filename.split("_")[0]
                id = int(anim_segment.split("a")[1])
                folder = f"graphics/obj_tiles/4bpp/anim_{id:04}"
                
                new.write(f".incbin \"{folder}/{filename.replace(anim_segment + '_', '')}")
    