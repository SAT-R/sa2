import os

references = """
. = 0x000020C0; gUnknown_030020C0 = .;
"""

vars_to_iwram = {}

for line in references.split(";\n"):
    if not line:
        continue

    var = line.split(';')[1].split("= .")[0].strip()
    offset = hex(int(var.split('gUnknown_03')[1], 16)).upper().replace('X', 'x')
    vars_to_iwram[var] = f"IWRAM_START + {offset}"


for code_file in os.listdir('asm'):
    if not code_file.endswith('.s'):
        continue

    new_data = ""

    with open("asm/" + code_file) as f_asm:
        new_data = "".join(f_asm.readlines())
    
    for var in vars_to_iwram:
        new_data = new_data.replace(var, vars_to_iwram[var])
    
    with open("asm/" + code_file, "w") as f_asm:
        f_asm.write(new_data)
