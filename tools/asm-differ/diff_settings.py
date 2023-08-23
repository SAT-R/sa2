#!/usr/bin/env python3
from pathlib import Path
import os

root_dir = Path(__file__).parent.parent.parent.absolute()
devkit_dir = os.environ.get("DEVKITARM")


def apply(config, args):
    config["baseimg"] = f"{root_dir}/baserom.gba"
    config["myimg"] = f"{root_dir}/sa2.gba"
    config["mapfile"] = f"{root_dir}/sa2.map"
    config["source_directories"] = [
        f"{root_dir}/src",
        f"{root_dir}/include",
        f"{root_dir}/asm",
    ]
    config["objdump_flags"] = ["-marmv4t", "-Mforce-thumb"]
    config["arch"] = "arm32"
    config["objdump_executable"] = (
        "arm-none-eabi-objdump"
        if not devkit_dir
        else f"{devkit_dir}/bin/arm-none-eabi-objdump"
    )
    # config["objdump_flags"].append("-Mno-aliases")
