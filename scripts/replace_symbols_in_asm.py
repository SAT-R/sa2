new_code = ""
with open("asm/old_code.txt") as code:
    new_code = "".join(code.readlines())
    with open("mb_chao_garden.map") as map_file:
        for line in map_file.readlines():
            line = line.strip()

            if line.startswith("0x0000000002") or line.startswith("0x0000000003"):
                addr, sym = line.split("                ")
                if sym.startswith("."):
                    continue
                sym = sym.replace(" = .", "")
                addr = int(addr, base=16)
                
                print("Replacing", f"sub_0{hex(addr).replace('0x', '').lower()}", "with", sym)
                new_code = new_code.replace(f"sub_0{hex(addr).replace('0x', '').lower()}", sym)
                new_code = new_code.replace(f"sub_0{hex(addr).replace('0x', '').upper()}", sym)
                print("Replacing", f"0x0{hex(addr).replace('0x', '').upper()}", "with", sym)
                new_code = new_code.replace(f"0x0{hex(addr).replace('0x', '').upper()}", sym)

                if line.startswith("0x0000000003"):
                    new_code = new_code.replace("@ gUnknown_03", "@ 0x03")
                    new_code = new_code.replace("@ sub_03", "@ 0x03")
                else:
                    new_code = new_code.replace("@ gUnknown_02", "@ 0x02")
                    new_code = new_code.replace("@ sub_02", "@ 0x02")


new_code = new_code.replace("@ gUnknown_03", "@ 0x03")
new_code = new_code.replace("@ sub_03", "@ 0x03")
new_code = new_code.replace("@ gUnknown_02", "@ 0x02")
new_code = new_code.replace("@ sub_02", "@ 0x02")

with open("asm/code.s", "w") as code:
    code.write(new_code)
