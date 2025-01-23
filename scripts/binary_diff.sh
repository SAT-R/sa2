xxd baserom.gba > baserom.hex
xxd sa2.gba > sa2.hex
git diff --no-index baserom.hex sa2.hex
