ewram_syms = {}
iwram_syms = {}

replace = {}

# because of the task system, any pointers below this are probably
# task related, we can worry about anything which is left later
min_iwram = 0x30004B0

base_ewram = 0x1E130

with open("multi_boot/roms/collect_rings/asm/m4a.s") as code_file:
    for line in code_file.readlines():
        line = line.strip()
        if "0x030" in line and ":" not in line:
            addr = line.split("0x03")[1].split(" ")[0]
            if int(f"0x03{addr}", 16) >= min_iwram:
                iwram_syms[f"0x00{addr}"] = f"gUnknown_03{addr}"
                replace[f"0x03{addr}"] = f"gUnknown_03{addr}"

        if "0x020" in line and ":" not in line:
            addr = line.split("0x02")[1].split(" ")[0]
            if int(addr, 16) >= base_ewram:
                ewram_syms[f"0x00{addr}"] = f"gUnknown_02{addr}"
                replace[f"0x02{addr}"] = f"gUnknown_02{addr}"

    code_file.seek(0)
    code_content = code_file.read()

    for addr, sym in replace.items():
        code_content = code_content.replace(addr, sym)

    with open("multi_boot/roms/collect_rings/asm/m4a-new.s", "w") as new_code:
        new_code.write(code_content)

    with open("multi_boot/roms/collect_rings/sym_ewram-m4a.txt", "w") as ewram_sym_file:
        keys = sorted(ewram_syms.keys())
        for addr in keys:
            sym = ewram_syms[addr]
            new_addr = hex(int(addr, base=16) - base_ewram).split("0x")[1]
            ewram_sym_file.write(
                f". = 0x{new_addr.upper().zfill(8)}; {sym} = .;\n"
            )
