#!/bin/bash

OBJDUMP="arm-none-eabi-objdump -D -bbinary -marmv4t -Mforce-thumb"
OPTIONS="--start-address=$(($1)) --stop-address=$(($1 + $2))"
$OBJDUMP $OPTIONS data/rom_data.bin > baserom.dump
$OBJDUMP $OPTIONS mb_chao_garden.gba > mb_chao_garden.dump
git diff --no-index baserom.dump mb_chao_garden.dump
