<h1 align="center">Sonic Advance Trilogy</h1>
<p align="center">
  <img height="240" src=".github/media/titlescreen.png" alt="Sonic Advance 2 title screen">
</p>
<p align="center">
  <a href="https://github.com/SAT-R/sa2/actions/workflows/build.yml"><img src="https://github.com/SAT-R/sa2/actions/workflows/build.yml/badge.svg" alt="CI status"></a>
  <a href="https://github.com/SAT-R/sa2"><img src="https://img.shields.io/endpoint?url=https://sat-r.github.io/sa2/reports/progress-sa2-shield.json" alt="Decompilation Progress"></a>
  <a href="https://github.com/SAT-R/sa2"><img src="https://img.shields.io/endpoint?url=https://sat-r.github.io/sa2/reports/progress-sa2-shield-matching.json" alt="Decompilation Matching Progress"></a>
  <a href="https://github.com/SAT-R/sa2/graphs/contributors"><img src="https://img.shields.io/github/contributors/SAT-R/sa2" alt="Contributors"></a>
  <a href="https://discord.gg/vZTvVH3gA9"><img src="https://img.shields.io/discord/1052347299457671200" alt="Discord"></a>
</p>

> :warning: **This project is not completed and still under active development**

This is a work in progress matching decompilation of Sonic Advance 1, 2, [& eventually 3](https://github.com/SAT-R/sa3/)

It builds the following ROMs:
* [**sa1.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=0330) `sha1: eb00f101af23d728075ac2117e27ecd8a4b4c3e9` (Europe) (En,Ja,Fr,De,Es)
* [**sa2.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=0890) `sha1: 7bcd6a07af7c894746fa28073fe0c0e34408022d` (USA) (En,Ja,Fr,De,Es,It)
* [**sa2_europe.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=0900) `sha1: b0f64bdca097f2de8f05ac4c8caea2b80c5faeb1` (Europe) (En,Ja,Fr,De,Es,It)
* [**sa2_japan.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=0799) `sha1: dffd0188fc78154b42b401398a224ae0713edf23` (Japan) (En,Ja,Fr,De,Es,It)
* [**sa2_japan_vc.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=x380) `sha1: 2aa6ee2cf2b0ebfafbea6d6d24165b252a7e329e` (Japan) (En,Ja,Fr,De,Es,It) (Virtual Console)
* [**sa2_beta.gba**](https://datomatic.no-intro.org/index.php?page=show_record&s=23&n=x149) `sha1: 3368642fc4157824af63367e2a685b7d6ee9b09d` (USA) (Beta) (2002-10-25)

It can also build:
* **sa2.sdl** `make sdl` (Linux/MacOS SDL 64bit port)
* **sa2.sdl_win32.exe** `make sdl_win32` (Windows SDL 64bit port)
* :construction: **sa2.win32.exe** `make win32` (Win32 OpenGL port, not functional)
* **sa2.ps2.iso** `make ps2` (PlayStation 2 port, requires [PS2DEV](https://github.com/ps2dev/ps2dev))
* **EBOOT.PBP** `make sdl_psp` (PlayStation Portable SDL port, requires [PSPDEV](https://github.com/pspdev/pspdev))

## Current state (SA2)

- :tada: The build is 100% from C files with [~60 functions which currently don't match](./asm/non_matching)
- All assembly code extracted, disassembled, and decompiled by hand to their C equivilent
- All songs have been extracted, and documented as [matching MIDI files](./sound/sa2/songs/midi)
- All sprite animation frames have been [extracted to PNGs and are used to build the matching rom](./graphics/sa2/obj_tiles)
- All tilemaps (backgrounds) have been documented and [had their tiles extracted](./data/sa2/tilemaps)
- Most aspects of core game play have been documented, but >600 functions are still unnamed
- The game compiles to a widescreen port (*426x240*) for multiple platforms

## Sub games

Within the Sonic Advance Trilogy roms there are some "Sub games" which we have begun to decompile as part of this project. These sub games are automatically compiled and bundled during the main build process, as they are necessary to create a matching binary.

| Game | Multiboot rom | Decompilation |
| --- | --- | --- |
| SA2 | [**mb_chao_garden.gba**](./chao_garden) | ![Decompilation Progress](https://img.shields.io/endpoint?url=https://sat-r.github.io/sa2/reports/progress-mb_chao_garden-shield.json) |
| SA2 | [**collect_rings.gba**](./multi_boot/roms/collect_rings/) | ![Decompilation Progress](https://img.shields.io/endpoint?url=https://sat-r.github.io/sa2/reports/progress-collect_rings-shield.json) |


## Setting up the repo

Please see follow [these instructions](./INSTALL.md)

## Contributing

Join us on [discord](https://discord.gg/vZTvVH3gA9) to get started in helping out. Otherwise, we are always looking for people to document the code base, and there are [many non matching functions](./asm/non_matching) which need human input to resolve. 

### Strict No LLM / No AI Policy

- No LLMs for issues.
- No LLMs for pull requests.

This project was created as a learning excerise, I (freshollie) like learning new things. Of course it also has real world outcomes (having the ability to play, mod, port this game), but we as maintainers are not interested in submissions from LLM origin.

We want humans to use this project to practice their skills. Reverse engineering, documenting, understanding, being part of the process. If you submit a pull request we want you to have accountability as well as knowledge of what you've done. We want you to develop on those skills and continue to contribute. If "the computer" did all the work for you, we are not interested.

Our policy is based off [Zig's](https://ziglang.org/code-of-conduct/)

### Layout
```
├── asm
│   ├── macros # Common macros used in asm files
│   └── non_matching # Non matching assembly pulled in the C compilation process
├── chao_garden # The tiny chao garden project (based on the SA2 version)
├── data # Raw data pulled into the rom via ASM files
├── graphics # Graphics related assets
├── include # Headers
├── libagbsyscall # The agbsyscall library included as part of the nintendo SDK
├── multi_boot # Any multiboot roms (used for singlepak multiplayer)
├── scripts # Scripts used in the decompilation process
├── sound # Sound related assets
├── src
│   ├── data # C files which pull in assets as part of the compilation process
│   ├── game
│   │   ├── sa1
│   │   ├── sa2
│   │   └── shared # C files used across all 3 games
│   ├── lib # libraries which were originally statically linked
│   │   ├── agb_flash
│   │   └── m4a
│   ├── platform # port related code
│   └── . # src root contains Dimps "engine" C files
└── tools # tools used for compilation or extraction
```

### Notable info

- The [Kirby & The Amazing Mirror](https://github.com/jiangzhengwenjz/katam/) decompilation uses the same "engine", as it was written by the same dev team (Dimps)
- https://decomp.me is a great resource for helping to create matching function
- For more info, see the [FAQs section](https://zelda64.dev/games/tmc) of TMC

## Credits

- [JaceCear](https://github.com/JaceCear) for his dedication to understanding the internals of the graphics engine, writing [tools to extract this data](https://github.com/JaceCear/SA-Trilogy-Animation-Exporter), as well as massive effort in contributing towards the decompilation process (including decompiling the whole of sa1!), *and* setting up the PC ports
- Shout out to [@froggestspirit](https://github.com/froggestspirit) for the drive to set this project up
- Special thanks to [@normmatt](https://github.com/normmatt) for the initial repo setup and sounds disassembly
- [Pokemon Reverse Engineering Tools](https://github.com/pret) community for their help with the project, and tooling for GBA decompilations
- [Kermalis](https://github.com/Kermalis) for [their tool](https://github.com/Kermalis/VGMusicStudio) which was used to dump the game midis
- [琪姬](https://github.com/laqieer) for their exellent work [documenting](https://github.com/FireEmblemUniverse/fireemblem8u/pull/137) all the quirks of matching midis
