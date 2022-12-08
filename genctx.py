import glob
import itertools as it
from graphlib import TopologicalSorter
import sys

if len(sys.argv) > 1 and sys.argv[1] == '-e':
    excluded = sys.argv[1:]
else:
    excluded = []

depends_on = {}
data = {}

def search_directories(*patterns):
    return it.chain.from_iterable(glob.iglob(pattern,recursive=True) for pattern in patterns)

for filename in search_directories('./src/**/*.h', './include/**/*.h'):
    with open(filename) as header:
        header_name = filename.split('/')[-1]

        if "constants/" in filename:
            header_name = f"constants/{header_name}"

        if "gba/" in filename:
            header_name = "gba/" + header_name

        if not header_name in depends_on:
            
            depends_on[header_name] = set()
            if not header_name.startswith("gba/") and header_name != "global.h" and header_name != "functions.h":
                depends_on[header_name].add("global.h")
            
            if header_name.startswith("gba/") and not header_name.endswith("types.h") and not header_name.endswith("defines.h"):
                depends_on[header_name].add("gba/types.h")
            
            if header_name.startswith("gba/") and not header_name.endswith("multiboot.h") and not header_name.endswith("types.h"):
                depends_on[header_name].add("gba/multiboot.h")
                
        data[header_name] = ""
        for line in header.readlines():
            if "#include" in line and not line.startswith("//") and '<' not in line:
                requires = line.split('"')[1]
                depends_on[header_name].add(requires)
                continue
                
            data[header_name] += line
        data[header_name] += "\n"

ts = TopologicalSorter(depends_on)
print_order = tuple(ts.static_order())

with open('ctx.c', 'w') as context:
    for header in print_order:
        exclude = False
        for e in excluded:
            if e in header:
                exclude = True
                break
        
        if not exclude:
            print(header)
            context.write(data[header])

    