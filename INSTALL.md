# Building/Installing SA2
This doc assumes you are somewhat familiar with using a terminal/command line. If not, you may find these instructions confusing and this project might not be for you at this stage. If you still want to continue, googling anything which you don't understand might be a first step and then asking in the discord would be a fallback option.

## Before building

This project is designed to be built on MacOS or Linux. 

### If you only have a windows computer

Install WSL (Ubuntu). Once installed, open this project in the WSL terminal and follow the linux instructions. There are tutorials online for setting up WSL. You may need to mount this project in your WSL environment.

### Install system requirements
 
#### On Linux (including WSL)
```
sudo apt update
sudo apt install build-essential binutils-arm-none-eabi gcc-arm-none-eabi libpng-dev xorg-dev libsdl2-dev gcc-mingw-w64 libarchive-tools
```

#### On MacOS

```
brew install libpng sdl2 mingw-w64 arm-none-eabi-gcc
```

## Building

Clone/Download the repo

The repo targets multiple platforms. You don't need to build the GBA rom to build the port, so skip that step if you only want to run it on PC.

Run all commands in the same folder as this project. All outputs go into the same folder.

**NOTE**: You can significantly speed up initial build times by passing the number of processes you wish to use for the build. For example `make -j4` with 4 being the number of cores

### PC port

The PC port targets different platforms depending on where you are going to be playing it.

#### For Windows

1. Run `make SDL2.dll`
1. Run `make sdl_win32`
1. `sa2.sdl_win32.exe` will be created
1. Open the game in Windows by double clicking on it

Tip: On Linux and MacOS this can be opened with `wine sa2.sdl_win32.exe`

**NOTE**: If you get an error when running `make SDL2.dll`, you'll need to [download](https://github.com/libsdl-org/SDL/releases/download/release-2.30.3/SDL2-devel-2.30.3-mingw.zip) and extract SDL2 to an `ext` folder in the root of the repo before building. Afterwards you can re-run `make SDL2.dll`

#### For Linux/MacOS

1. Run `make sdl`
1. `sa2.sdl` will be created
1. Launch the game from the terminal with `./sa2.sdl`

### GBA rom

1. Clone [agbcc](https://github.com/SAT-R/agbcc) repo into another folder

1. Inside the `agbcc` folder, run `./build.sh` and then install the compiler in this repo `./install.sh path/to/sa2`
1. Run `make`
1. If the rom built successfully you will see this output: `sa2.gba: OK` (if you modify the source code this will no longer output `OK`)
1. `sa2.gba` will be output. 

You can execute the rom in an emulator

## Code formatting

All C code in this repo is formatted with `clang-format-13`. If using the Dev Container this is installed automatically. 

To format code run `make format`

