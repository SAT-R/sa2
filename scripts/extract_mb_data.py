end_of_code = 0x02012510
end_of_data = 0x0202EB6C

addresses = set()

with open('chao_garden/asm/code.s') as code:
    for line in code.readlines():
        line = line.strip()
        if ".4byte 0x02" in line:
            address = int(line.split("0x0")[1], 16)
            if address >= end_of_code and address < end_of_data:
                addresses.add(address)

addresses_with_size = []
sorted_addresses = sorted(addresses)

def upper_addr(addr):
    return "0x" + hex(addr).split('0x')[1].upper()

def format_memory_addr(addr):
    return "0x0" + hex(addr).split("0x")[1].upper()

def to_var_name(addr):
    without_hex = addr.split("0x")[1]
    return f"gUnknown_{without_hex}"


for i in range(len(sorted_addresses)):
    address = sorted_addresses[i]
    if i + 1 < len(sorted_addresses):
        next_address = sorted_addresses[i + 1]
    else:
        next_address = end_of_data

    addresses_with_size.append((address, format_memory_addr(address), upper_addr(next_address - address)))

summed = 0

with open("chao_garden/data/new_data.s", "w") as data_file:
    data_file.write('	.section .rodata\n')
    data_file.write('\n')
    for raw_addr, addr, size in addresses_with_size:
        summed += int(size, 16)
        var = to_var_name(addr)
        data_file.write(f"""    .global {var}
{var}:
    .incbin "data/rom_data.bin", 0x{f"{(raw_addr - 0x02000000):08x}".upper()}, {size}

""")

print(hex(summed))
with open("chao_garden/asm/new_code.s", "w") as new_rom:
    existing_code = "".join(open("chao_garden/asm/code.s").readlines())
    for _, addr, __ in addresses_with_size:
        var = to_var_name(addr)
        existing_code = existing_code.replace(addr, to_var_name(addr))
    
    new_rom.write(existing_code)
