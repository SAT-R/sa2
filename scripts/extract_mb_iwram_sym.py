ewram_syms = {}
iwram_syms = {}

replace = {}

max_ewram = "0x0202EB6C"

with open("multi_boot/subgame_loader/signed_payload/payload/asm/code.s") as code_file:
    for line in code_file.readlines():
        line = line.strip()
        if "0x030" in line and ":" not in line:
            addr = line.split("0x03")[1].split(" ")[0]
            iwram_syms[f"0x00{addr}"] = f"gUnknown_03{addr}"
            replace[f"0x03{addr}"] = f"gUnknown_03{addr}"
        elif "0x020" in line and ":" not in line:
            addr = line.split("0x02")[1].split(" ")[0]
            full_addr = f"0x02{addr}"
            if full_addr < max_ewram:
                ewram_syms[f"0x00{addr}"] = f"gUnknown_02{addr}"
                replace[full_addr] = f"gUnknown_02{addr}"

    code_file.seek(0)
    code_content = code_file.read()
    
    for addr, sym in replace.items():
        code_content = code_content.replace(addr, sym)
    
    with open("multi_boot/subgame_loader/signed_payload/payload/asm/new_code.s", "w") as new_code:
        new_code.write(code_content)

    with open("multi_boot/subgame_loader/signed_payload/payload/sym_iwram.txt", "w") as iwram_sym_file:
        keys = sorted(iwram_syms.keys())
        for addr in keys:
            sym = iwram_syms[addr]
            iwram_sym_file.write(f". = {addr}; {sym} = .;\n")
    
    with open("multi_boot/subgame_loader/signed_payload/payload/sym_ewram.txt", "w") as ewram_sym_file:
        keys = sorted(ewram_syms.keys())
        for addr in keys:
            sym = ewram_syms[addr]
            ewram_sym_file.write(f". = {addr}; {sym} = .;\n")
        