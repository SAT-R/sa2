import glob

for file in glob.glob('./include/game/enemies/*'):
    if file.endswith(".h"):
        print(f"#include \"{file.replace('./include/', '')}\"")
    