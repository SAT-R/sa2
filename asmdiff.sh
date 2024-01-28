#!/bin/bash

OBJDUMP="arm-none-eabi-objdump -D -bbinary -marmv4t -Mforce-thumb"
OPTIONS="--start-address=$(($1)) --stop-address=$(($1 + $2))"
$OBJDUMP $OPTIONS baserom.gba > baserom.dump
$OBJDUMP $OPTIONS sa2.gba > sa2.dump
git diff --no-index baserom.dump sa2.dump
