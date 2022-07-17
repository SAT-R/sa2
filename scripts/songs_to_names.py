songs = [    
    1, 
    2, 
    3, 
    4, 
    5, 
    6, 
    7, 
    9, 
    13, 
    14, 
    15, 
    16, 
    17, 
    18, 
    19, 
    20, 
    21, 
    22, 
    23, 
    24, 
    25, 
    26, 
    27, 
    28, 
    29, 
    31, 
    32, 
    33, 
    34, 
    35, 
    36, 
    37, 
    38, 
    41, 
    42, 
    43, 
    44, 
    45, 
    46, 
    48, 
    49, 
    50, 
    51, 
    52, 
    53, 
    54, 
    55, 
    56, 
    57, 
    66, 
    58, 
    64, 
    59, 
    61, 
    401, 
    402, 
    403, 
    404, 
    405, 
    406, 
    407, 
    410, 
    412, 
    413, 
    414, 
    408, 
    415, 
    411
]

numbers_to_name_map = {}

with open("include/constants/songs.h") as songs_header:
    for line in songs_header.readlines():
        if not line.startswith("#define"):
            continue

        line = line.strip()
        # strip comments
        line = line.split(' //')[0]
        segments = line.split(' ')
        if len(segments) < 3:
            continue

        _, name, number = line.split(' ')
        number = int(number)
        numbers_to_name_map[number] = name

for num in songs:
    print(numbers_to_name_map[num] + ",")
