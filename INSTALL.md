# Building/Installing SA2
This doc assumes you are somewhat familiar with using a terminal/command line. If not, you may find these instructions confusing and this project might not be for you at this stage. If you still want to continue, googling anything which you don't understand might be a first step and then asking in the discord would be a fallback option.

## Setup environment

This project is designed to be built on MacOS or Linux. If you are using Windows then you will need to build the project in a Linux environemnt. There are a few options for that:

### Easiest option: Dev container

This step assumes you have vscode and you can run [Dev Containers](https://code.visualstudio.com/docs/remote/containers) already. If you wanna figure that out, look up a tutorial or something.

1. Open this project in VSCode and then select "open dev container" when prompted
2. Wait for it to build.
3. Once running, skip to *Build the GBA rom* (no further install requirements)

If using the Dev container you will be able to build for the GBA and PC. However, if you build the "Linux/MacOS" target you will not be able to execute that on MacOS when built from the dev container.

### WSL

Install and use WSL (Ubuntu). Once using WSL, open this project in the WSL terminal and follow the linux instructions. There are tutorials online for setting up WSL. You may need to mount this project in your WSL environment.

### MSYS

Another option is to install 
[**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM) and build the project in MSYS but this is not recomended unless you know what you are doing. It doesn't really function properly.

## Install system requirements

**NOTE**: You can skip these steps if you are using the devcontainer.
 
### On Linux systems (including WSL)
```
sudo apt update
sudo apt install build-essential binutils-arm-none-eabi gcc-arm-none-eabi libpng-dev xorg-dev libsdl2-dev gcc-mingw-w64 libarchive-tools
```

### On MacOS

```
brew install libpng sdl2 mingw-w64 arm-none-eabi-gcc
```

## Install `agbcc` into the repo (skip if not compiling for the GBA)

Clone the [agbcc](https://github.com/SAT-R/agbcc) repo into another folder

Inside the `agbcc` folder, run `./build.sh` and then install the compiler in this repo `./install.sh path/to/sa2`


## Building

Clone/Download the repo

The repo targets multiple platforms. You don't need to build the rom to build the port, so skip that step if you just want to run it on the PC.

Run all commands in the same folder as this project. All outputs go into the same folder.

**NOTE**: You can significantly speed up initial build times by passing the number of processes you wish to use for the build `make ... -j<insert number of CPU cores>`

### GBA rom

1. Run `make`
1. If the rom built successfully you will see this output: `sa2.gba: OK` (if you modify the source code this will no longer output `OK`)
1. `sa2.gba` will be output. 

You can execute the rom in an emulator

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

## Code formatting

All C code in this repo is formatted with `clang-format-13`. If using the Dev Container this is installed automatically. 

To format code run `make format`

