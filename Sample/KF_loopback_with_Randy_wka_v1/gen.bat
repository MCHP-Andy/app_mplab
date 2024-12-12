@echo off

@REM echo "Original path"

@REM echo %PATH%

set OBJ_TOOL_PATH=C:\Users\A78501\mchp_zephyr\zephyr-sdk-0.17.0\arm-zephyr-eabi\bin
set IMG_TOOL_PATH=C:\Users\A78501\mchp_zephyr\CPGZephyrDocs\MEC175x
@REM set PATH=%PATH%;%IMG_TOOL_PATH%;%IMG_TOOL_PATH%


@REM echo ""
@REM echo "Modify path"
@REM echo ""

@REM echo %PATH%
@REM echo %OBJ_TOOL_PATH%
@REM echo %IMG_TOOL_PATH%


@REM 


echo "Generate bin file from elf"
%OBJ_TOOL_PATH%\arm-zephyr-eabi-objcopy.exe --input-target=ihex --output-target=binary kf_freertos_fpga.X\dist\kf_freertos_fpga\production\kf_freertos_fpga.X.production.hex zephyr.bin
@REM %OBJ_TOOL_PATH%\arm-zephyr-eabi-objcopy.exe -O binary kf_freertos_fpga.X\dist\kf_freertos_fpga\production\kf_freertos_fpga.X.production.elf zephyr.bin


echo "Generate SPI Image"
mec175x_spi_gen.exe -i %IMG_TOOL_PATH%\mec175x_spi_cfg.txt -o spi_image.bin

@REM echo "Flash SPI Image"
@REM set PROG_TOOL_PATH="C:\Program Files (x86)\DediProg\SF Programmer"
@REM dediprog "--spi-image=${PROJECT_BINARY_DIR}/${SPI_IMAGE_NAME}" "--vcc=0"
@REM %PROG_TOOL_PATH%\dpcmd.exe --spi-image=spi_image.bin --vcc=0
