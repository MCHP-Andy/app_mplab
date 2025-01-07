/*
 * Copyright 2023 Microchip Technology Inc.
 */
#ifndef DMA_H_
#define DMA_H_

#include <stdint.h>
#include <stdbool.h>
#include "device.h"

/* bit operation MACRO, xvar could be byte, word or dword */
#define mSET_BIT(x, xvar)		( xvar |= x )
#define mCLR_BIT(x, xvar)		( xvar &= ~x )
#define mGET_BIT(x, xvar)		( xvar & x )
#define mCLR_SRC_BIT(x, xvar)	( xvar = x )
#define mTOGGLE_BIT(x, xvar)	{if(mGET_BIT(x, xvar)){mCLR_BIT(x, xvar);}else{mSET_BIT(x, xvar);}}

enum device_names
{
    SMBUS_SLAVE
    ,SMBUS_MASTER
    ,I3C_HOST_TX
    ,I3C_HOST_RX
    ,I3C_SEC_HOST_TX
    ,I3C_SEC_HOST_RX
};

enum main_control_reg_bits
{
    sbit_MAIN_CTRL_ACTIVATE = (1U << 0) // BIT_0_MASK 
};

/* This counter is to ensure that we check for busy condition
* for atleast 100ms */
enum {
    BUSY_TIMEOUT_COUNTER= 8000
};

enum control_reg_bits
{
    sbit_CONTROL_RUN = (1U << 0) // BIT_0_MASK
    ,sbit_CONTROL_DONE = (1U << 2) // BIT_2_MASK
    ,sbit_CONTROL_BUSY = (1U << 5) // BIT_5_MASK
    ,sbit_CONTROL_DIR = (1U << 8) // BIT_8_MASK
    ,sbit_CONTROL_INCR_MEMADDR = (1U << 16) // BIT_16_MASK
    ,sbit_CONTROL_XFER_ONEBYTE = (1U << 20) // BIT_20_MASK
    ,sbit_CONTROL_XFER_DWORD = (1U << 22) // BIT_22_MASK
};

enum dma_activate_reg_bits
{
    sbit_ACTIVATE = (1U << 0) // BIT_0_MASK
};

enum device_ids
{
     DEVICE_ID_I2C_SLAVE_0 = 0
    ,DEVICE_ID_I2C_MASTER_0
    ,DEVICE_ID_I2C_SLAVE_1
    ,DEVICE_ID_I2C_MASTER_1
    ,DEVICE_ID_I2C_SLAVE_2
    ,DEVICE_ID_I2C_MASTER_2
    ,DEVICE_ID_I2C_SLAVE_3
    ,DEVICE_ID_I2C_MASTER_3
    ,DEVICE_ID_I2C_SLAVE_4
    ,DEVICE_ID_I2C_MASTER_4
    ,DEVICE_ID_QMSPI_TX_0 //10
    ,DEVICE_ID_QMSPI_RX_0 //11
    ,DEVICE_ID_SPI_TX_0 
    ,DEVICE_ID_SPI_RX_0
    ,DEVICE_ID_SPI_TX_1 
    ,DEVICE_ID_SPI_RX_1
    ,DEVICE_ID_I3C_HOST_TX_0 //16
    ,DEVICE_ID_I3C_HOST_RX_0 
    ,DEVICE_ID_I3C_SEC_HOST_TX_0
    ,DEVICE_ID_I3C_SEC_HOST_RX_0 
};


struct dma_main_regs {
    
    union
    {
        volatile uint8_t  MAIN_CONTROL;         /*ADDR_DMA_MAIN_CONTROL offset=00h*/
        volatile uint32_t dword_MAIN_CONTROL;
    };
    volatile uint32_t AFIFO_DATA;				/*ADDR_DMA_AFIFO_DATA offset=04h*/
    volatile uint32_t MAIN_DEBUG;				/*ADDR_DMA_MAIN_DEBUG offset=08h*/
    
};

struct dma_regs {
    
    union
    {
       volatile uint8_t  REG8_ACTIVATE;
       volatile uint32_t dword_ACTIVATE;
    };
    volatile uint32_t REG32_MEM_START_ADDR;
    volatile uint32_t REG32_MEM_END_ADDR;
    volatile uint32_t REG32_AHB_ADDR;
    volatile uint32_t REG32_CONTROL;
    volatile uint32_t REG32_INTR_STS;
    volatile uint32_t REG32_INTR_ENBL;
    volatile uint32_t REG32_TEST;    
};

void dma_main_enable(struct dma_main_regs *regs);
void dma_main_disable(struct dma_main_regs *regs);
void dma_activate(struct dma_regs *regs);
void dma_deactivate(struct dma_regs *regs);
void dma_stop(struct dma_regs *regs);
void dma_start(struct dma_regs *regs);
void dma_setup_tx(struct dma_regs *regs, const uint8_t device, const uint32_t dataAHBAddress, uint32_t dma_buffer_tx, 
                     const uint16_t transfer_bytes_count, const bool xferDword);
void dma_setup_rx(struct dma_regs *regs, const uint8_t device,const uint32_t dataAHBAddress, uint32_t dma_buffer_rx,
		              const uint16_t transfer_bytes_count, const bool incrMemAddrFlag, const bool xferDword);
void dma_switch_tx_to_rx(struct dma_regs *regs, const uint8_t device, const uint32_t dataAHBAddress);
uint8_t dma_get_device_id(const uint8_t device_name, const uint8_t device_instance);
bool dma_wait_till_free(struct dma_regs *regs);
void dma_enable_interrupt(struct dma_regs *regs);
void dma_disable_interrupt(struct dma_regs *regs);					  

#endif /* DMA_H_ */
/** @}
*/
