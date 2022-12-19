import os


for file in os.listdir("graphics/obj_tiles"):
    if file.endswith(".png"):
        a_id = file.split("_")[0]
