import os
import shutil

content = ""
with open("src/game/assets/compressed/entities.c") as entities_file:
    content = "".join(entities_file.readlines())


for zone in os.listdir("data/maps"):
    zone_num = zone.split("zone")[1]
    
    if zone_num == "8":
        zone_num = "final"
    
    new_zone = "zone_" + zone_num
    
    os.makedirs("data/maps/" + new_zone, exist_ok=True)
    
    for act in os.listdir("data/maps/" + zone):
        act_num = act.split("act")[1] if "act" in act else act        
        
        if zone_num == "final":
            if act_num == "1":
                act_num = "xx"
            elif act_num == "2":
                act_num = "ta53"
            elif act_num == "boss":
                act_num = "unused"
                
        
        new_act = "act_" + act_num
        
        old = "data/maps/" + zone + "/" + act + "/"
        new = "data/maps/" + new_zone + "/" + new_act
        # new = "data/maps/" + new_zone + "/" + new_act + "/"
        
        print(old, new)
        shutil.move(old, new)
        # os.rename(new_zone + act, new)
        
        content = content.replace(old, new)

with open("src/game/assets/compressed/entities.c", "w") as entities_file:
    entities_file.write(content)

