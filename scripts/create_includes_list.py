import glob

for file in glob.glob('./include/game/interactables_*/*') + glob.glob('./include/game/interactables_*/**/*'):
    if file.endswith(".h"):
        print(f"#include \"{file.replace('./include/', '')}\"")
    