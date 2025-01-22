/*
 * THIS CODE IS PROVIDED BY PARADE AND ITS CONTRIBUTORS "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT ARE
 * DISCLAIMED. IN NO EVENT SHALL PARADE OR ITS CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OR
 * REDISTRIBUTION OF THIS CODE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */

// PS8833_FwUpd_SampleCode.c : v1.0.10.0
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <errno.h>
// #include <unistd.h>


#define TRUE 1
#define FALSE 0

// Utility.
//

#define SIZE_64K 0x10000
#define SIZE_4K 0x1000
#define SIZE_256 0x100

#define ALLOC(_MEM_SIZE_) malloc(_MEM_SIZE_)
#define FREE(_MEM_PTR_) free(_MEM_PTR_)
#define SET(_MEM_PTR_, _MEM_SIZE_, _PATTERN_)                                  \
    memset((_MEM_PTR_), (_PATTERN_), (_MEM_SIZE_))

#define IS_EQUAL(_MEM_1_, _MEM_2_, _MEM_SIZE)                                  \
    (0 == memcmp(_MEM_1_, _MEM_2_, _MEM_SIZE))
#define IS_NOT_EQUAL(_MEM_1_, _MEM_2_, _MEM_SIZE)                              \
    (!IS_EQUAL(_MEM_1_, _MEM_2_, _MEM_SIZE))

// #define DELAY_MS(_MILLISECONDS_) sleep(_MILLISECONDS_)
#define DELAY_MS(_MILLISECONDS_) do{}while(0)

#define ALIGNMENT_HI(_SIZE_, _ALIGNMENT_)                                      \
    ((_SIZE_ % _ALIGNMENT_)                                                    \
         ? (_SIZE_ + (_ALIGNMENT_ - (_SIZE_ % _ALIGNMENT_)))                   \
         : (_SIZE_))
#define ALIGNMENT_LO(_SIZE_, _ALIGNMENT_)                                      \
    ((_SIZE_ % _ALIGNMENT_) ? (_SIZE_ - (_SIZE_ % _ALIGNMENT_)) : (_SIZE_))

#define uint32_t_GET_uint8_t(_DWORD_, _uint8_t_) ((uint8_t)(_DWORD_ >> (_uint8_t_ * 8)))

#define SAFE_FREE(_PTR_)                                                       \
    if (_PTR_) {                                                               \
        FREE(_PTR_);                                                           \
        _PTR_ = NULL;                                                          \
    }

#define EXIT_FALSE(_STATUS_)                                                   \
    if (!_STATUS_) {                                                           \
        goto Exit;                                                             \
    }

#define BIT_SET(_DATA_, _BIT_) (_DATA_ |= (1 << _BIT_))
#define BIT_CLEAR(_DATA_, _BIT_) (_DATA_ &= ~(1 << _BIT_))

// PS8833 Definition.
//

#define PS8833_POLLING_MAX_SPI (20)

#define PS8833_INDEX_OF_BANK0 0
#define PS8833_INDEX_OF_BANK1 1
#define PS8833_INDEX_OF_BANK2 2
#define PS8833_INDEX_OF_BANK3 3

#define PS8833_SPI_BANK_SIZE SIZE_64K
#define PS8833_SPI_SECTOR_SIZE SIZE_4K
#define PS8833_SPI_PAGE_SIZE SIZE_256

#define PS8833_SPI_NUMBER_OF_SECTORS_PER_BANK                                  \
    (PS8833_SPI_BANK_SIZE / PS8833_SPI_SECTOR_SIZE)
#define PS8833_SPI_NUMBER_OF_PAGES_PER_SECTOR                                  \
    (PS8833_SPI_SECTOR_SIZE / PS8833_SPI_PAGE_SIZE)

#define PS8833_SPI_ADDRESS_BANK2 (0x00020000)

#define PS8833_SPI_COMMAND_SECTOR_ERASE 0x20
#define PS8833_SPI_COMMAND_WRITE_ENABLE 0x06
#define PS8833_SPI_COMMAND_WRITE_STATUS_REGISTER_ENABLE 0x01

#define PS8833_SPI_BURST_SIZE 16
#define PS8833_WAIT_SPI_ROM_POLLING_MAX 1024

#define PS8833_SET_SPI_ADDRESS_RETRY_MAX 3

// Hardware path setting.
//

//#define _USE_I2C1
#define _USE_I2C2

// I2C Slave Address.(8-bits)
//

#define PS8833_I2C_SLAVE_ADDRESS (0x10)

#define I2C_PAGE0 (PS8833_I2C_SLAVE_ADDRESS)
#define I2C_PAGE1 (PS8833_I2C_SLAVE_ADDRESS + 2)
#define I2C_PAGE2 (PS8833_I2C_SLAVE_ADDRESS + 4)
#define I2C_PAGE3 (PS8833_I2C_SLAVE_ADDRESS + 6)
#define I2C_PAGE4 (PS8833_I2C_SLAVE_ADDRESS + 8)
#define I2C_PAGE5 (PS8833_I2C_SLAVE_ADDRESS + 10)
#define I2C_PAGE6 (PS8833_I2C_SLAVE_ADDRESS + 12)
#define I2C_PAGE7 (PS8833_I2C_SLAVE_ADDRESS + 14)
#define I2C_PAGE8 (PS8833_I2C_SLAVE_ADDRESS + 16)
#define I2C_PAGE9 (PS8833_I2C_SLAVE_ADDRESS + 18)
#define I2C_PAGE10 (PS8833_I2C_SLAVE_ADDRESS + 20)
#define I2C_PAGE11 (PS8833_I2C_SLAVE_ADDRESS + 22)
#define I2C_PAGE12 (PS8833_I2C_SLAVE_ADDRESS + 24)
#define I2C_PAGE13 (PS8833_I2C_SLAVE_ADDRESS + 26)
#define I2C_PAGE14 (PS8833_I2C_SLAVE_ADDRESS + 28)
#define I2C_PAGE15 (PS8833_I2C_SLAVE_ADDRESS + 30)

#if 1
// Please implement your own i2c burst write function here.
//
bool __attribute__((weak)) PS8833_WriteBurst(uint8_t I2cSlaveAddress, uint8_t Offset, uint8_t *DataBuffer,
                       int DataBufferSize) {
    bool bStatus;

    bStatus = TRUE;

    return bStatus;
}

// Please implement your own i2c burst read function here.
//
bool __attribute__((weak)) PS8833_ReadBurst(uint8_t I2cSlaveAddress, uint8_t Offset, uint8_t *DataBuffer,
                      int DataBufferSize) {
    bool bStatus;

    bStatus = TRUE;

    return bStatus;
}
#else
extern bool PS8833_WriteBurst(uint8_t I2cSlaveAddress, uint8_t Offset, uint8_t *DataBuffer,
                       int DataBufferSize);
extern bool PS8833_ReadBurst(uint8_t I2cSlaveAddress, uint8_t Offset, uint8_t *DataBuffer,
                      int DataBufferSize);
#endif

bool PS8833_WriteBurstEx(uint8_t I2cSlaveAddress, uint8_t Offset, uint8_t *DataBuffer,
                         int DataBufferSize, int BurstSize) {
    bool bStatus = TRUE;
    int numberOfBursts;
    int indexOfBurst;
    int remainder;
    uint8_t offset;
    uint8_t *dataBufferTemp;
    uint8_t *dataBuffer0xFF;

    dataBuffer0xFF = NULL;

    dataBuffer0xFF = (uint8_t *)ALLOC(BurstSize);
    SET(dataBuffer0xFF, BurstSize, 0xFF);

    numberOfBursts = DataBufferSize / BurstSize;
    remainder = DataBufferSize % BurstSize;

    offset = Offset;
    dataBufferTemp = DataBuffer;
    for (indexOfBurst = 0; indexOfBurst < numberOfBursts; indexOfBurst++) {
        if (!IS_EQUAL(dataBufferTemp, dataBuffer0xFF, BurstSize)) {
            bStatus = PS8833_WriteBurst(I2cSlaveAddress, offset, dataBufferTemp,
                                        BurstSize);
            EXIT_FALSE(bStatus);
        }

        offset += BurstSize;
        dataBufferTemp += BurstSize;
    }

    if (remainder) {
        bStatus = PS8833_WriteBurst(I2cSlaveAddress, offset, dataBufferTemp,
                                    remainder);
        EXIT_FALSE(bStatus);
    }

Exit:

    return bStatus;
}

bool PS8833_ReadBurstEx(uint8_t I2cSlaveAddress, uint8_t Offset, uint8_t *DataBuffer,
                        int DataBufferSize, int BurstSize) {
    bool bStatus;
    int numberOfBursts;
    int indexOfBurst;
    int remainder;
    uint8_t offset;
    uint8_t *dataBufferTemp;

    numberOfBursts = DataBufferSize / BurstSize;
    remainder = DataBufferSize % BurstSize;

    offset = Offset;
    dataBufferTemp = DataBuffer;
    for (indexOfBurst = 0; indexOfBurst < numberOfBursts; indexOfBurst++) {
        bStatus = PS8833_ReadBurst(I2cSlaveAddress, offset, dataBufferTemp,
                                   BurstSize);
        EXIT_FALSE(bStatus);

        offset += BurstSize;
        dataBufferTemp += BurstSize;
    }

    if (remainder) {
        bStatus = PS8833_ReadBurst(I2cSlaveAddress, offset, dataBufferTemp,
                                   remainder);
        EXIT_FALSE(bStatus);
    }

Exit:

    return bStatus;
}

bool PS8833_Writeuint8_t(uint8_t I2cSlaveAddress, uint8_t Offset, uint8_t Data) {
    bool bStatus;

    bStatus = PS8833_WriteBurst(I2cSlaveAddress, Offset, &Data, 1);

    return bStatus;
}

bool PS8833_Readuint8_t(uint8_t I2cSlaveAddress, uint8_t Offset, uint8_t *Data) {
    bool bStatus;

    bStatus = PS8833_ReadBurst(I2cSlaveAddress, Offset, Data, 1);

    return bStatus;
}

bool PS8833_Writeuint8_tReadBackCheck(uint8_t I2cSlaveAddress, uint8_t Offset,
                                   uint8_t Data) {
    bool bStatus;
    uint8_t uint8_tDataReadBack;

    bStatus = PS8833_Writeuint8_t(I2cSlaveAddress, Offset, Data);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Readuint8_t(I2cSlaveAddress, Offset, &uint8_tDataReadBack);
    EXIT_FALSE(bStatus);

    if (Data != uint8_tDataReadBack) {
        bStatus = FALSE;
        goto Exit;
    }

Exit:

    return bStatus;
}

// Firmware Update Functions.
//

bool PS8833_SafeModeAndEscapeLowPower() {
    bool bStatus;
    uint8_t uint8_tData;
    int index;

    bStatus = FALSE;

    // Safe Mode if mode is not set.
    // p0.0x00 = 0x01
    //
    bStatus = PS8833_Readuint8_t(I2C_PAGE0, 0x00, &uint8_tData);
    EXIT_FALSE(bStatus);

    if (0 == uint8_tData) {
        // Safe mode.
        //
        bStatus = PS8833_Writeuint8_t(I2C_PAGE0, 0x00, 0x01);
        EXIT_FALSE(bStatus);
    }

    // Escape A2 low power of no device connected.
    // p1.0x70 = 0x00
    // Need to check 3 times because of firmware may program this value after
    // wakeup.
    //
    for (index = 0; index < 3; index++) {
        bStatus = PS8833_Readuint8_t(I2C_PAGE1, 0x70, &uint8_tData);
        EXIT_FALSE(bStatus);

        if (0 != uint8_tData) {
            // Disable low power.
            //
            bStatus = PS8833_Writeuint8_t(I2C_PAGE1, 0x70, 0x00);
            EXIT_FALSE(bStatus);
        }

        DELAY_MS(50);
    }

    bStatus = TRUE;

Exit:

    return bStatus;
}

bool PS8833_SPIMapEnable() {
    bool bStatus;

    // Please check folloing setting according to your hardware path.

#ifdef _USE_I2C1
    // For I2C1 EC->PD->RT
    //
    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xBD, 0x9F);
#endif

#ifdef _USE_I2C2
    // For I2C2 SOC->RT
    //
    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xBD, 0xDF);
#endif

    return bStatus;
}

bool PS8833_SPIMapDisable() {
    bool bStatus;

    // Please check folloing setting according to your hardware path.

#ifdef _USE_I2C1
    // For I2C1 EC->PD->RT
    //
    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xBD, 0x1F);
#endif

#ifdef _USE_I2C2
    // For I2C2 SOC->RT
    //
    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xBD, 0x5F);
#endif

    return bStatus;
}

bool PS8833_SPIResetInterface() {
    bool bStatus;

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x90, 0x04);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x92, 0x00);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x93, 0x05);
    EXIT_FALSE(bStatus);

Exit:

    return bStatus;
}

bool PS8833_SPIWriteEnable() {
    bool bStatus;

    bStatus =
        PS8833_Writeuint8_t(I2C_PAGE2, 0x90, PS8833_SPI_COMMAND_WRITE_ENABLE);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x92, 0x00);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x93, 0x05);
    EXIT_FALSE(bStatus);

Exit:

    return bStatus;
}

bool PS8833_WaitSpiRomReady() {
    bool bStatus;
    uint8_t uint8_tData;
    int pollingCount1;
    int pollingCount2;
    int pollingCount3;

    bStatus = PS8833_Readuint8_t(I2C_PAGE2, 0x9e, &uint8_tData);
    EXIT_FALSE(bStatus);

    pollingCount1 = 0;
    while (uint8_tData & 0x0c) {
        bStatus = PS8833_Readuint8_t(I2C_PAGE2, 0x9e, &uint8_tData);
        EXIT_FALSE(bStatus);

        pollingCount1++;
        if (pollingCount1 > PS8833_WAIT_SPI_ROM_POLLING_MAX) {
            bStatus = FALSE;
            goto Exit;
        }
    }

    uint8_tData = 0x01;
    pollingCount2 = 0;
    while (uint8_tData & 0x01) {
        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x90, 0x05);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x92, 0x00);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x93, 0x01);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Readuint8_t(I2C_PAGE2, 0x93, &uint8_tData);
        EXIT_FALSE(bStatus);

        pollingCount3 = 0;
        while (uint8_tData & 0x01) {
            bStatus = PS8833_Readuint8_t(I2C_PAGE2, 0x93, &uint8_tData);
            EXIT_FALSE(bStatus);

            pollingCount3++;
            if (pollingCount3 > PS8833_WAIT_SPI_ROM_POLLING_MAX) {
                bStatus = FALSE;
                goto Exit;
            }
        }

        bStatus = PS8833_Readuint8_t(I2C_PAGE2, 0x91, &uint8_tData);
        EXIT_FALSE(bStatus);

        pollingCount2++;
        if (pollingCount2 > PS8833_WAIT_SPI_ROM_POLLING_MAX) {
            bStatus = FALSE;
            goto Exit;
        }
    }

Exit:

    return bStatus;
}

bool PS8833_EnableMPU() {
    bool bStatus;

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xd6, 0x00);

    return bStatus;
}

bool PS8833_DisableMPU() {
    bool bStatus;

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xd6, 0xC0);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xd6, 0x40);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_SPIResetInterface();
    EXIT_FALSE(bStatus);

Exit:

    return bStatus;
}

bool PS8833_PageHWriteEnable() {
    bool bStatus;
    int indexOfLoop;
    uint8_t pollingStatus;

    bStatus = FALSE;
    pollingStatus = FALSE;

    pollingStatus = 0;
    indexOfLoop = 0;
    while ((indexOfLoop < PS8833_POLLING_MAX_SPI) && (pollingStatus != 0x01)) {
        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0xaa);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x55);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x50);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x41);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x52);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x44);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Readuint8_t(I2C_PAGE2, 0xda, &pollingStatus);
        EXIT_FALSE(bStatus);

        indexOfLoop++;
    }

Exit:

    return bStatus;
}

bool PS8833_PageHWriteDisable() {
    bool bStatus;

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x00);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xBD, 0x1F);
    EXIT_FALSE(bStatus);

Exit:

    return bStatus;
}

bool PS8833_SPIWriteStatusRegister(uint8_t StatusRegister) {
    bool bStatus;

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x90,
                               PS8833_SPI_COMMAND_WRITE_STATUS_REGISTER_ENABLE);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x90, StatusRegister);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x92, 0x01);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x93, 0x05);
    EXIT_FALSE(bStatus);

Exit:

    return bStatus;
}

bool PS8833_PollingStatus(uint8_t *PollingStatus) {
    bool bStatus;
    uint8_t pollingStatus;
    int indexOfLoop;

    bStatus = FALSE;

    pollingStatus = 0;
    indexOfLoop = 0;
    while ((indexOfLoop < PS8833_POLLING_MAX_SPI) && (pollingStatus != 0x01)) {
        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0xaa);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x55);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x50);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x41);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x52);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x44);
        EXIT_FALSE(bStatus);

        bStatus = PS8833_Readuint8_t(I2C_PAGE2, 0xda, &pollingStatus);
        EXIT_FALSE(bStatus);

        indexOfLoop++;
    }

    *PollingStatus = pollingStatus;

    bStatus = TRUE;

Exit:

    return bStatus;
}

bool PS8833_EnableWrite() {
    bool bStatus;
    uint8_t pollingStatus;
    uint8_t spiRomStatusRegister;

    bStatus = PS8833_DisableMPU();
    EXIT_FALSE(bStatus);

    pollingStatus = 0;
    bStatus = PS8833_PollingStatus(&pollingStatus);
    EXIT_FALSE(bStatus);

    if (0x00 == pollingStatus) {
        bStatus = FALSE;
        goto Exit;
    }

    bStatus = PS8833_SPIWriteEnable();
    EXIT_FALSE(bStatus);

    // Protect bank0.
    //
    spiRomStatusRegister = 0x64;

    bStatus = PS8833_SPIWriteStatusRegister(spiRomStatusRegister);
    EXIT_FALSE(bStatus);

    // Wait until SPI module ready
    //
    bStatus = PS8833_WaitSpiRomReady();
    EXIT_FALSE(bStatus);

    pollingStatus = 0;
    bStatus = PS8833_PollingStatus(&pollingStatus);
    EXIT_FALSE(bStatus);

    if (pollingStatus == 0x00) {
        bStatus = FALSE;
        goto Exit;
    }

    bStatus = TRUE;

Exit:

    return bStatus;
}

bool PS8833_DisableWrite() {
    bool bStatus;
    uint8_t spiRomStatusRegister;

    bStatus = FALSE;

    bStatus = PS8833_DisableMPU();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_SPIWriteEnable();
    EXIT_FALSE(bStatus);

    spiRomStatusRegister = 0xDC;

    bStatus = PS8833_SPIWriteStatusRegister(spiRomStatusRegister);
    EXIT_FALSE(bStatus);

    // Wait until SPI module ready.
    //
    bStatus = PS8833_WaitSpiRomReady();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0xda, 0x00);
    EXIT_FALSE(bStatus);

Exit:

    return bStatus;
}

bool PS8833_GetBootBankID(uint8_t *BootBankID) {
    bool bStatus;
    uint8_t uint8_tData;

    bStatus = PS8833_Readuint8_t(I2C_PAGE9, 0x06, &uint8_tData);
    EXIT_FALSE(bStatus);

    *BootBankID = uint8_tData & 0x0F;

    if ((1 != *BootBankID) && (2 != *BootBankID)) {
        *BootBankID = 1;
    }

Exit:

    return bStatus;
}

bool PS8833_SPIBankErase(uint8_t BankID) {
    bool bStatus;

    bStatus = FALSE;

    if ((1 != BankID) && (2 != BankID)) {
        goto Exit;
    }

    bStatus = PS8833_EnableWrite();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_SPIWriteEnable();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x90, 0xD8);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x90, BankID);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x90, 0x00);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x90, 0x00);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x92, 0x03);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_Writeuint8_t(I2C_PAGE2, 0x93, 0x05);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_WaitSpiRomReady();
    EXIT_FALSE(bStatus);

Exit:

    return bStatus;
}

bool PS8833_SetSpiAddressBank(uint8_t BlockID) {
    bool bStatus;

    bStatus = FALSE;

    // SpiAddress 24
    //
    bStatus = PS8833_Writeuint8_tReadBackCheck(I2C_PAGE2, 0x8F, BlockID);
    EXIT_FALSE(bStatus);

Exit:

    return bStatus;
}

bool PS8833_SetSpiAddress16(uint32_t SpiAddress) {
    bool bStatus;

    bStatus = FALSE;

    // SpiAddress 16
    //
    bStatus =
        PS8833_Writeuint8_t(I2C_PAGE2, 0x8E, uint32_t_GET_uint8_t(SpiAddress, 1));
    EXIT_FALSE(bStatus);

Exit:

    return bStatus;
}

bool PS8833_SetSpiAddressBankRetry(uint8_t BlockID) {
    bool bStatus;
    int indexOfRetry;

    for (indexOfRetry = 0; indexOfRetry < PS8833_SET_SPI_ADDRESS_RETRY_MAX;
         indexOfRetry++) {
        bStatus = PS8833_SetSpiAddressBank(BlockID);
        if (bStatus) {
            break;
        }
    }

    return bStatus;
}

bool PS8833_FirmwareGetVersion(char *Version) {
    bool bStatus;
    uint32_t dwordValue;

    bStatus = PS8833_SafeModeAndEscapeLowPower();
    EXIT_FALSE(bStatus);

    dwordValue = 0;
    bStatus = PS8833_ReadBurstEx(I2C_PAGE9, 0x01, (uint8_t *)&dwordValue, 4,
                                 PS8833_SPI_BURST_SIZE);
    EXIT_FALSE(bStatus);

    sprintf(Version, "%X.%X.%X.%X", uint32_t_GET_uint8_t(dwordValue, 0),
            uint32_t_GET_uint8_t(dwordValue, 1), uint32_t_GET_uint8_t(dwordValue, 2),
            uint32_t_GET_uint8_t(dwordValue, 3));

Exit:

    return bStatus;
}

bool PS8833_FirmwareDump(uint8_t *DataBuffer, int DataBufferSize) {
    bool bStatus;
    int spiSize;
    int numberOfPages;
    int indexOfPage;
    uint8_t *dataBufferTemp;
    uint32_t spiAddressTemp;
    uint8_t bookBankID;

    bStatus = FALSE;

    spiSize = DataBufferSize;

    numberOfPages = DataBufferSize / SIZE_256;

    bStatus = PS8833_SafeModeAndEscapeLowPower();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_DisableMPU();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_SPIMapEnable();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_GetBootBankID(&bookBankID);
    EXIT_FALSE(bStatus);

    spiAddressTemp = bookBankID * PS8833_SPI_BANK_SIZE;
    dataBufferTemp = DataBuffer;

    // We only config spi rom bank once and with read back check.
    //
    bStatus = PS8833_SetSpiAddressBankRetry(bookBankID);
    EXIT_FALSE(bStatus);

    for (indexOfPage = 0; indexOfPage < numberOfPages; indexOfPage++) {
        bStatus = PS8833_SetSpiAddress16(spiAddressTemp);
        EXIT_FALSE(bStatus);

        bStatus =
            PS8833_ReadBurstEx(I2C_PAGE7, 0, dataBufferTemp,
                               PS8833_SPI_PAGE_SIZE, PS8833_SPI_BURST_SIZE);
        EXIT_FALSE(bStatus);

        dataBufferTemp += PS8833_SPI_PAGE_SIZE;
        spiAddressTemp += PS8833_SPI_PAGE_SIZE;
    }

    bStatus = PS8833_SPIMapDisable();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_EnableMPU();
    EXIT_FALSE(bStatus);

Exit:;
    return bStatus;
}

bool PS8833_FirmwareUpdate(uint8_t *DataBuffer, int DataBufferSize) {
    bool bStatus;
    int numberOfPages;
    int indexOfPage;
    uint8_t *dataBufferTemp;
    uint32_t spiAddressTemp;
    uint8_t bookBankID;

    bStatus = FALSE;
    bookBankID = 0xFF;

    numberOfPages = DataBufferSize / PS8833_SPI_PAGE_SIZE;

    bStatus = PS8833_SafeModeAndEscapeLowPower();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_DisableMPU();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_SPIMapEnable();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_EnableWrite();
    EXIT_FALSE(bStatus);

    // Erase Firmware.
    //
    bStatus = PS8833_GetBootBankID(&bookBankID);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_SPIBankErase(bookBankID);
    EXIT_FALSE(bStatus);

    // Update Firmware.
    //
    spiAddressTemp = bookBankID * PS8833_SPI_BANK_SIZE;
    dataBufferTemp = DataBuffer;

    // We only config spi rom bank once and with read back check.
    //
    bStatus = PS8833_SetSpiAddressBankRetry(bookBankID);
    EXIT_FALSE(bStatus);

    for (indexOfPage = 0; indexOfPage < numberOfPages; indexOfPage++) {
        bStatus = PS8833_SetSpiAddress16(spiAddressTemp);
        EXIT_FALSE(bStatus);

        bStatus =
            PS8833_WriteBurstEx(I2C_PAGE7, 0, dataBufferTemp,
                                PS8833_SPI_PAGE_SIZE, PS8833_SPI_BURST_SIZE);
        EXIT_FALSE(bStatus);

        dataBufferTemp += PS8833_SPI_PAGE_SIZE;
        spiAddressTemp += PS8833_SPI_PAGE_SIZE;
    }

    bStatus = PS8833_DisableWrite();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_SPIMapDisable();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_EnableMPU();
    EXIT_FALSE(bStatus);

Exit:

    return bStatus;
}

bool PS8833_FirmwareErase() {
    bool bStatus;
    uint8_t bookBankID;

    bStatus = FALSE;
    bookBankID = 0xFF;

    bStatus = PS8833_SafeModeAndEscapeLowPower();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_DisableMPU();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_SPIMapEnable();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_EnableWrite();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_GetBootBankID(&bookBankID);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_SPIBankErase(bookBankID);
    EXIT_FALSE(bStatus);

    bStatus = PS8833_DisableWrite();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_SPIMapDisable();
    EXIT_FALSE(bStatus);

    bStatus = PS8833_EnableMPU();
    EXIT_FALSE(bStatus);

Exit:;
    return bStatus;
}

int sum (int a, int b) {
    return a + b;
}
