import os
import shutil

tile_map_data_content = ""
with open("src/data/tilemap_data.c", "r") as tile_map_data_file:
    tile_map_data_content = "".join(tile_map_data_file.readlines())

for folder in os.listdir("data/tilemaps"):
    if folder.startswith("zone_"):
        zone_num = folder.split("_")[1]
        act_num = folder.split("_")[3]
        layer = folder.split("_")[4]

        zone = f"zone_{zone_num}"
        act = f"act_{act_num}"

        new_path = f"data/maps/{zone}/{act}/tilemaps/{layer}"
        tile_maps_path = f"data/maps/{zone}/{act}/tilemaps/"
        old_path = "data/tilemaps/" + folder + "/"

        print(old_path, new_path)
        shutil.move(old_path, new_path)
        
        header_content = ""
        with open(new_path + "/header.c", "r") as header_file:
            header_content = "".join(header_file.readlines())
        
        header_content = header_content.replace(old_path, new_path + "/")
        tile_map_data_content = tile_map_data_content.replace(old_path, new_path + "/")        
        
        with open(new_path + "/header.c", "w") as header_file:
            header_file.write(header_content)
            
with open("src/data/tilemap_data.c", "w") as tile_map_data_file:
    tile_map_data_file.write(tile_map_data_content)
