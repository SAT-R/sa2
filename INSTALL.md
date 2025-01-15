# Building/Installing SA2
This doc assumes you are somewhat familiar with using a terminal/command line. If not, you may find these instructions confusing and this project might not be for you at this stage. If you still want to continue, googling anything which you don't understand might be a first step and then asking in the discord would be a fallback option.

**NOTE**: You can significantly speed up initial build times by passing the number of processes you wish to use for the build `make ... -j<number of CPU cores>`

## Setup environment

### Easiest option: Dev container

This step assumes you have vscode and you can run [Dev Containers](https://code.visualstudio.com/docs/remote/containers) already. If you wanna figure that out, look up a tutorial or something.

1. Open this project in VSCode and then select "open dev container" when prompted
2. Wait for it to build.
3. Once running, skip to *Build the GBA rom* (no further install requirements)

## Install system requirements *(without dev container)*
 
### On Linux systems
```
sudo apt update
sudo apt install build-essential binutils-arm-none-eabi gcc-arm-none-eabi libpng-dev xorg-dev libsdl2-dev gcc-mingw-w64 libarchive-tools
```

### On MacOS

```
brew install libpng sdl2 mingw-w64
```

**ONLY** if building for GBA: Install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM)


### On Windows

Install and use WSL (Ubuntu). Once using WSL follow the linux instructions in your WSL terminal.

Another option is to install 
[**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM) and build the project in MSYS but this is not recomended unless you know what you are doing.


## Install `agbcc` into the repo (skip if not compiling for the GBA)

Clone the [agbcc](https://github.com/SAT-R/agbcc) repo into another folder

Inside the `agbcc` folder, run `./build.sh` and then install the compiler in this repo `./install.sh path/to/sa2`


## Build the GBA rom

### On Linux and MacOS 

Run `make` in the root of the repo to build

### On Windows

If using WSL, follow linux instructions. Otherwise:

You can build using `make` in the MSYS environment provided with devkitARM.

### Verify

If the rom built successfully you will see this output

```bash
sa2.gba: OK
```

## Build the port

Building the port requires using Linux, MacOS or WSL. **Don't use the msys environement**

Run all commands in the root directory of the project

### For Windows

1. Run `make SDL2.dll`
1. Run `make sdl_win32`
1. `sa2.sdl_win32.exe` will be created

**NOTE**: If you get an error when running `make SDL2.dll`, you'll need to [download](https://github.com/libsdl-org/SDL/releases/download/release-2.30.3/SDL2-devel-2.30.3-mingw.zip) and extract SDL2 to an `ext` folder in the root of the repo before building. Afterwards you can re-run `make SDL2.dll`


### For Linux/MacOS

1. Run `make sdl`
1. `sa2.sdl` will be created

## Code formatting

All C code in this repo is formatted with `clang-format-13`. If using the Dev Container this is installed automatically. 

To format code run `make format`

