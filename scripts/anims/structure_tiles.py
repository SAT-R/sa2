import os

for file in os.listdir("graphics/obj_tiles/4bpp"):
    if file.endswith(".png"):
        anim_segment = file.split("_")[0]
        id = int(anim_segment.split("a")[1])
        
        folder = f"graphics/obj_tiles/4bpp/anim_{id:04}"

        os.makedirs(folder, exist_ok=True)
        
        os.rename(f"graphics/obj_tiles/4bpp/{file}", f"{folder}/{file.replace(anim_segment + '_', '')}")
        print(f"graphics/obj_tiles/4bpp/{file}", f"{folder}/{file.replace(anim_segment + '_', '')}")

