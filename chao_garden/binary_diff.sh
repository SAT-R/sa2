xxd data/rom_data.bin > baserom.hex
xxd mb_chao_garden.gba > mb_chao_garden.hex
git diff --no-index baserom.hex mb_chao_garden.hex
