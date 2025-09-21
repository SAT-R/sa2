import os

for pal in os.listdir("graphics/obj_palettes"):
    if pal.endswith("_vc.gbapal"):
        os.system(f"tools/gbagfx/gbagfx graphics/obj_palettes/{pal} graphics/obj_palettes/{pal.replace('gbapal', 'pal')}")
