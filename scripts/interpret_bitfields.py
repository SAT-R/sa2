val = int(input('hex: '), 16)

for i in range(len(bin(val).split('0b')[1])):
    if val & (1 << i):
        print(hex(1 << i))
