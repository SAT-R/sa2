import sys
asm_file = sys.argv[1]

asm_content = "".join(open(asm_file).readlines())
func_lines = asm_content.split("thumb_func_start")[1].split('\n')
func_name = func_lines[0].strip()
func_body = "\n".join(func_lines[2:])

new_asm_content = asm_content.replace("thumb_func_start" + asm_content.split("thumb_func_start")[1], "")

content = f"""\
.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
{func_body}
.syntax divided
"""

open(f"asm/non_matching/{func_name}.inc", 'w').write(content)
open(asm_file, "w").write(new_asm_content)
print(f"""NONMATCH("asm/non_matching/{func_name}.inc", void {func_name}()) {{

}}
END_NONMATCH
""")
