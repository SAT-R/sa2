# Sonic Advance 2 (USA)

This is a work in progress matching decompilation of Sonic Advance 2

It so far builds the following ROM:
* [sa2.gba](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=0890) `sha1: 7bcd6a07af7c894746fa28073fe0c0e34408022d`

### Current state

- Assembly code extracted and dissembled
- Some assembly code categorised
- Nearly all libaries have been decompiled to C

### Setting up the repository

* You must have a copy of the Sonic Advance 2 (USA) ROM named `baserom.gba` in the repository directory.

* Install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM).

* Clone the [agbcc](https://github.com/pret/agbcc) repo into another folder

* Run `./build.sh` and `./install.sh path/to/SoAdvance2`

* You can then build sa2 using `make` in the MSYS environment provided with devkitARM.

### Notes

- It seems the [Kirby & The Amazing Mirror](https://github.com/jiangzhengwenjz/katam/) decompilation uses a very similar codebase
- https://decomp.me is a great resource for helping to create matching functions
- `ldscript.txt` tells the linker the order which files should be linked
- For more info, see the [FAQs section](https://zelda64.dev/games/tmc) of TMC

### Credits

- Special thanks to [@normatt](github.com/normatt) for the initial repo setup and sounds decompilation
- Shout out to [@froggestspirit](github.com/froggestspirit) for the drive to set this project up
- [Pokemon Reverse Engineering Team](github.com/pret) for their help with the project, and tooling for GBA decompilations
