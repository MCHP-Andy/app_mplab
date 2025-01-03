# I3C test


## Download toolchain & Tool
### Zephyr SDK
https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.17.0/zephyr-sdk-0.17.0_windows-x86_64.7z


### MPLAB X IDE


### SF100


### CPGZephyrDocs
https://github.com/MicrochipTech/CPGZephyrDocs


## Zephyr

```
# Create a new virtual environment
python -m venv .venv

# Active virtual environment
.venv\Scripts\activate.bat

# Install west
pip install west

# Download zephyr source code
west init zephyr_3.7.0 --mr v3.7.0
cd zephyr_3.7.0
west update

# Export a Zephyr CMake package
west zephyr-export

# Install requirements
pip install -r zephyr\scripts\requirements.txt

``` 

### Setup
```
.venv\Scripts\activate.bat

set ZES_ENABLE_SYSMAN=1
set ZEPHYR_SDK_INSTALL_DIR=C:\Users\Andy\Desktop\app_mplab\zephyr-sdk-0.17.0

zephyr_3.7.0\zephyr\zephyr-env.cmd

west build -p -b mec172xmodular_assy6930 zephyr_3.7.0\zephyr\samples\hello_world
```
