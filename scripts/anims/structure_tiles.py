import os


for file in os.listdir("graphics/obj_tiles"):
    if file.endswith(".png"):
        anim_segment = file.split("_")[0]
        
        id = int(anim_segment.split("a")[1])
        print(id)
