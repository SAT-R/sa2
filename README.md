# Sonic Advance 2
[![CI status][ci-badge]][ci-status-link] [![Decompilation Progress][progress-badge]][progress-link] [![Contributors][contributors-badge]][contributors-link] [![Discord][discord-badge]][discord-link]

[ci-status-link]: https://github.com/SAT-R/sa2/actions/workflows/build.yml
[ci-badge]: https://github.com/SAT-R/sa2/actions/workflows/build.yml/badge.svg

[progress-link]: https://github.com/SAT-R/sa2
[progress-badge]: https://img.shields.io/endpoint?url=https://sat-r.github.io/sa2/reports/progress-sa2-shield.json

[contributors-link]: https://github.com/SAT-R/sa2/graphs/contributors
[contributors-badge]: https://img.shields.io/github/contributors/SAT-R/sa2

[discord-badge]: https://img.shields.io/discord/1052347299457671200
[discord-link]: https://discord.gg/vZTvVH3gA9

This is a work in progress matching decompilation of Sonic Advance 2

It so far builds the following ROMs:
* [**sa2.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=0890) `sha1: 7bcd6a07af7c894746fa28073fe0c0e34408022d` (USA) (En,Ja,Fr,De,Es,It)
* [**sa2_europe.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=0900) `sha1: b0f64bdca097f2de8f05ac4c8caea2b80c5faeb1` (Europe) (En,Ja,Fr,De,Es,It)
* [**sa2_japan.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=0799) `sha1: dffd0188fc78154b42b401398a224ae0713edf23` (Japan) (En,Ja,Fr,De,Es,It) (:warning: Work in Progress)

### Current state

- :tada: The build is shiftable! You can make any code or asset additions/modifications you like, and most aspects of the game will continue to function.
- Assembly code [extracted, disassembled, and somewhat categorised](./asm/)
- All libraries decompiled to C or referenced from `agbcc`
- Most aspects of the game, including all interactables, have been decompiled to matching C code. Most have not been fully documented, but major functions are.
- All songs have been extracted, and documented as [matching MIDI files](./sound/songs/midi)
- All sprite animation frames have been extracted to PNGs and are used to build the matching rom
- Most tilemaps (backgrounds) have been documented and had their tiles extracted


### Community

Join us on [discord](https://discord.gg/vZTvVH3gA9) to get started in helping out

### Setting up the repository

**Provide assets**

You must have a copy of the Sonic Advance 2 (USA) ROM named `baserom.gba` in the repository directory.


**Dev container**

If you use `vscode` then consider using the provided [Dev Container](https://code.visualstudio.com/docs/remote/containers) which skips the requirement for any setup. This requires docker is installed on your system. Once running skip to ..

**Install build requirements** *(without dev container)*
 
On Linux systems
```
sudo apt install binutils-arm-none-eabi gcc-arm-none-eabi libpng-dev xorg-dev
```

On MacOS and Windows install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM)

**Install `agbcc` into the repo** *(without dev container)*

Clone the [agbcc](https://github.com/pret/agbcc) repo into another folder

Inside the `agbcc` repo and run `./build.sh` and then install the compiler in this repo `./install.sh path/to/sa2`

**Build the rom**

On Linux and MacOS, run `make` in the root of the repo to build.

On Windows you can build using `make` in the MSYS environment provided with devkitARM.

This command will also build all the required tooling in the `tools` directory. 
The `tools` directory contains a bunch of tooling (built by [pret](https://github.com/pret)) which is used to build assets and create a matching rom.

If the rom built successfully you will see this output

```bash
sa2.gba: OK
```

**NOTE**: You can significantly speed up initial build times by passing the number of processes you wish to use for the build `make -j<number>`

### Code formatting

All C code in this repo is formatted with `clang-format-13`. If using the Dev Container this is installed automatically.

To format code run `make format`

### Notes

- The [Kirby & The Amazing Mirror](https://github.com/jiangzhengwenjz/katam/) decompilation uses a very similar codebase, as it was written by the same dev team (Dimps)
- https://decomp.me is a great resource for helping to create matching functions
- `ldscript.txt` tells the linker the order which files should be linked
- For more info, see the [FAQs section](https://zelda64.dev/games/tmc) of TMC

### Credits

- Shout out to [@froggestspirit](https://github.com/froggestspirit) for the drive to set this project up
- Special thanks to [@normmatt](https://github.com/normmatt) for the initial repo setup and sounds decompilation
- [JaceCear](https://github.com/JaceCear) for his dedication to understanding the internals of the graphics engine and writing [tools to extract this data](https://github.com/JaceCear/SA-Trilogy-Animation-Exporter), as well as massive effort in contributing towards the decompilation process
- [Pokemon Reverse Engineering Team](https://github.com/pret) for their help with the project, and tooling for GBA decompilations
- [Kermalis](https://github.com/Kermalis) for [their tool](https://github.com/Kermalis/VGMusicStudio) which was used to dump the game midis
- [琪姬](https://github.com/laqieer) for their exellent work [documenting](https://github.com/FireEmblemUniverse/fireemblem8u/pull/137) all the quirks of matching midis
