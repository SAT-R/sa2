import re

with open("chao_garden/asm/code.s", "r") as code_file:
    data = code_file.read()

regex = re.compile("IWRAM_START \+ 0x([A-F0-9]{3})")
matches = regex.findall(data)
unique = sorted(list(set("".join(match) for match in matches)))

for replace in unique:
    data = data.replace(f"IWRAM_START + 0x{replace}", f"gUnknown_03000{replace}")
    print(f"        . = 0x00000{replace}; gUnknown_03000{replace} = .;")
