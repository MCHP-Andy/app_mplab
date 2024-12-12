/*****************************************************************************
* © 2018 Microchip Technology Inc. and its subsidiaries.
* You may use this software and any derivatives exclusively with
* Microchip products.
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".
* NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE,
* INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY,
* AND FITNESS FOR A PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP
* PRODUCTS, COMBINATION WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.
* TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL
* CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF
* FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
* MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE
* OF THESE TERMS.
******************************************************************************

Version Control Information (Perforce)
******************************************************************************
$Revision: #1 $ 
$DateTime: 2023/09/26 02:40:38 $ 
$Author: i64652 $
Last Change:    None
******************************************************************************/
/** @file uart_api.h
* \brief UART Peripheral Header File
* \author pramans
* 
* This file is the header file for UART Peripheral 
******************************************************************************/

/** @defgroup UART
 *  @{
 */
 
#ifndef _UART_H
#define _UART_H


#ifdef __cplusplus
extern "C" {
#endif
    
#define UART0_Type uart_registers_t
// Logical representation of the UART block instances    

#define UART0_ID            0x00u
#define UART1_ID            0x01u
    
#define EVB 1U

//Select UART module; 0 for UART0, 1 for UART1
#define UART_BLOCK_ID (0x00u) 
    
//GIRQ15 bit position; 0 for UART0, 1 for UART1, 4 for UART2
#define UART_GIRQ15_BITPOSITION  (0)

//Modem control register addresses of each UART block    
#define UART0_MODEM_CONTROL_REG_ADDR (0x400F2404ul)
#define UART1_MODEM_CONTROL_REG_ADDR (0x400F2804ul)

//
// Activate Register bit definations
//
#define UART_BLOCK_EN       0x01u
#define UART_BLOCK_DIS      0x00u

//
// Configuration Select Register bits and masks definations
//
#define UART_CFG_SEL_REG_MASK       0x07u
#define UART_CFG_SEL_POL_INV        0x04u
#define UART_CFG_SEL_POL_NON_INV    0x00u
#define UART_CFG_SEL_PWR_VCC        0x02u
#define UART_CFG_SEL_PWR_VTR        0x00u
#define UART_CFG_SEL_CLK_EXT        0x01u
#define UART_CFG_SEL_CLK_INT        0x00u

typedef enum {
    UART_CLK_INT_1P84MHz = 0ul,
    UART_CLK_INT_48MHz,
    UART_CLK_EXT,
} UART_CLK_SRC;

//
// PBRG1 Register bits and masks definations
//
#define UART_BAUD_CLK_SEL_Pos       7u
#define UART_BAUD_CLK_BIT_MASK      0x80u
#define UART_BAUD_CLK_48MHz         0x80u
#define UART_BAUD_CLK_1P84MHz       0x00u
#define UART_BAUD_DIVISOR_MSB_MASK  0x7Fu

//
// Interrupt Enable Register bits and masks definations
//
typedef enum {
    UART_RX_DATA_AVAILABLE = 0ul,
    UART_TX_BUFF_EMPTY,
    UART_RX_LINE_STS,
    UART_MODEM_STS,
    UART_RX_TX_BUFF,
    UART_ALL_INT_EN,
    UART_INT_DISABLED,
} INT_TYPE;

//For selecting interrupt mode for Single wire UART test
//#define SW_UART_INTERRUPT_MODE   SINGLE_WIRE_UART_TX? UART_TX_BUFF_EMPTY : UART_RX_DATA_AVAILABLE

#define UART_IER_REG_MASK       0x0Fu
#define UART_IER_ALL_EN         0x0Fu
#define UART_IER_EMSI_EN        0x08u
#define UART_IER_ELSI_EN        0x04u
#define UART_IER_RX_TX_BUFF     0x03u
#define UART_IER_ETHREI_EN      0x02u
#define UART_IER_ERDAI_EN       0x01u

//
// FIFO Control Register bits and masks definations
//
typedef enum {
    EN_DIS_FIFO = 0u,
    CLR_RCV_FIFO,
    CLR_XMIT_FIFO,
    FIFO_TRGGR_LVL,
    FIFO_ALL,
} UART_FIFO;

#define UART_FCR_REG_MASK       0xC7u
#define UART_FIFO_INT_LVL_1     0x00u
#define UART_FIFO_INT_LVL_4     0x40u
#define UART_FIFO_INT_LVL_8     0x80u
#define UART_FIFO_INT_LVL_14    0xC0u
#define UART_CLR_XMIT_FIFO      0x04u
#define UART_CLR_RECV_FIFO      0x02u
#define UART_FIFO_EN            0x01u
#define UART_FIFO_DIS           0x00u

//
// Interrupt Identification Register bits and masks defination
//
#define UART_IIR_REG_MASK       0xCFu
#define UART_INT_DETECT_MASK    0x0Fu

//
// Line Control Register bits and masks definations
//
#define UART_LCR_REG_MASK           0x3Fu
#define UART_BRK_CNTRL_EN           0x40u
#define UART_BRK_CNTRL_DIS          0x00u
#define UART_PARITY_BIT_AS_SPACE    0x38u
#define UART_PARITY_BIT_AS_MARK     0x28u
#define UART_PARITY_AS_EVEN         0x18u
#define UART_PARITY_AS_ODD          0x08u
#define UART_PARITY_BIT_NONE        0x00u
#define UART_STOP_BIT_1             0x00u
#define UART_STOP_BIT_1P5_OR_2      0x04u
#define UART_WRD_LEN_5_BITS         0x00u
#define UART_WRD_LEN_6_BITS         0x01u
#define UART_WRD_LEN_7_BITS         0x02u
#define UART_WRD_LEN_8_BITS         0x03u

//
// Line Status Register bits and masks definations
//
typedef enum {
    DATA_READY = 0ul,
    OVERRUN_ERROR,
    PARITY_ERROR,
    FRAME_ERROR,
    BREAK_INTERRUPT,
    TRANSMIT_HOLDING_REG_EMPTY,
    TRANSMIT_ERROR,
    FIFO_ERROR,
    LINE_STS_ALL,
} LINE_STS_TYPE;

//
// Modem Control Register bits and masks defination
//
typedef enum {
    DTR = 0ul,
    RTS,
    OUT1,
    OUT2,
    LOOPBACK,
    MCR_ALL,
} MODEM_CTRL_TYPE;

#define UART_MCR_REG_MASK           0x1Fu
#define UART_MCR_LOOPBACK_EN        0x10u
#define UART_MCR_LOOPBACK_DIS       0x00u
#define UART_MCR_OUT2_EN            0x08u
#define UART_MCR_OUT2_DIS           0x00u
#define UART_MCR_OUT1_EN            0x04u
#define UART_MCR_OUT1_DIS           0x00u
#define UART_MCR_RTS_SET            0x02u
#define UART_MCR_RTS_CLR            0x00u
#define UART_MCR_DTR_SET            0x01u
#define UART_MCR_DTR_CLR            0x00u

//
// Modem Status Register bits and masks definations
//
typedef enum {
    CTS = 0ul,
    DSR,
    RI,
    DCD,
    nCTS,
    nDSR,
    nRI,
    nDCD,
    MODEM_STS_ALL,
} MODEM_STS_TYPE;

//
// Baud rate definitions for 1.84MHz clock as the source
//
//For FPGA platform, the baudrate has to be halved for error free UART data transmission
//Divisor is halved if FPGA used instead of EVB for testing
#define BAUD_50             EVB ? 2304 : 1152
#define BAUD_75             EVB ? 1536 : 768
#define BAUD_110            EVB ? 1047 : 523
#define BAUD_134P5          EVB ? 857  : 428
#define BAUD_150            EVB ? 768  : 384
#define BAUD_300            EVB ? 384  : 192
#define BAUD_600            EVB ? 192  : 96
#define BAUD_1200           EVB ? 96   : 48
#define BAUD_1800           EVB ? 64   : 32
#define BAUD_2000           EVB ? 58   : 29
#define BAUD_2400           EVB ? 48   : 24
#define BAUD_3600           EVB ? 32   : 16
#define BAUD_4800           EVB ? 24   : 12
#define BAUD_7200           EVB ? 16   : 8
#define BAUD_9600           EVB ? 12   : 6
#define BAUD_19200          EVB ? 6    : 3
#define BAUD_38400          EVB ? 3    : 1
#define BAUD_57600          EVB ? 2    : 1
#define BAUD_115200         EVB ? 1    : 1
//
// Baud rate definitions for 24MHz clock as the source
//
#define BAUD_125000         EVB ? 24 : 12
#define BAUD_136400         EVB ? 22 : 11
#define BAUD_150000         EVB ? 20 : 10
#define BAUD_166700         EVB ? 18 : 9
#define BAUD_187500         EVB ? 16 : 8
#define BAUD_214300         EVB ? 14 : 7
#define BAUD_250000         EVB ? 12 : 6
#define BAUD_300000         EVB ? 10 : 5
#define BAUD_375000         EVB ? 8  : 4
#define BAUD_500000         EVB ? 6  : 3
#define BAUD_750000         EVB ? 4  : 2
#define BAUD_1500000        EVB ? 2  : 1




/* --------------------------------------------------------------------------------------------- */
/*                  Function to initialize the UART pins                                         */
/* --------------------------------------------------------------------------------------------- */
/**
 * uart_pins_init - Initializes the gpio pins that are associated
 * with the specified UART instance for UART functionality.
 * @param uint8_t 0-based UART ID
 * @return None.
 */
void uart_pins_init( uint8_t uart_id );
    

/* --------------------------------------------------------------------------------------------- */
/*  API Function - Function to initialize and enable the UART block                              */
/* --------------------------------------------------------------------------------------------- */
/**
 * uart_hw_init - Initializes the uart block hardware and enables it.
 * @param uint8_t 0-based UART ID
 * @param uint8_t pin polarity setting
 * @param uint8_t power source configuration for uart block
 * @param UART_CLK_SRC clock source for baud rate generation
 * @param uint16_t desired baud rate value
 * @param uint8_t operating mode configuration : FIFO or non - FIFO mode
 * @param uint8_t FIFO trigger level setting
 * @return None
 * @note While using the non - fifo mode; keep the fifo trigger level setting as
 *       UART_FIFO_INT_LVL_1.
 */
void uart_hw_init( uint8_t uart_id, uint8_t polarity, uint8_t power, UART_CLK_SRC clock_sel, uint16_t baud,\
                   uint8_t operation_mode, uint8_t fifo_tggr_lvl );


/* --------------------------------------------------------------------------------------------- */
/*  API Function - Function to configure the protocol & interrupt parameters                     */
/* --------------------------------------------------------------------------------------------- */
/**
 * uart_protocol_init - Initializes the serial protocol and interrupt parameters.
 * @param uint8_t 0-based UART ID
 * @param uint8_t word length setting
 * @param uint8_t stop bit setting
 * @param uint8_t parity bit setting
 * @param uint8_t interrupt source type that is to be enabled
 * @return None
 * @note In case interrupts are not being used; keep the interrupt source
 *       type parameter value as UART_INT_DISABLED.
 */
void uart_protocol_init( uint8_t uart_id, uint8_t wrd_len, uint8_t stp_bit, uint8_t parity_type, \
                         INT_TYPE interrupt_type );


/* --------------------------------------------------------------------------------------------- */
/*  API Function - Function to transmit serial data                                              */
/* --------------------------------------------------------------------------------------------- */
/**
 * uart_transmit - Transmits serial data using the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t data to be transmitted
 * @return None.
 */
void uart_transmit( uint8_t uart_id, uint8_t data );


/* --------------------------------------------------------------------------------------------- */
/*  API Function - Function to receive serial data                                               */
/* --------------------------------------------------------------------------------------------- */
/**
 * uart_transmit - Receives serial data using the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return uint8_t data received through the uart.
 */
uint8_t uart_receive( uint8_t uart_id );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to enable/disable the uart block                              */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_enable_disable - Enables/disables the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None.
 */
void p_uart_enable_disable( uint8_t uart_id, uint8_t new_val );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to write to the configuration select register                 */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_config_sel_reg_set - Writes to the configuration select register.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None
 * @note Bits [7:3] are reserved.
 */
void p_uart_config_sel_reg_set( uint8_t uart_id, uint8_t new_val );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to read the configuration select register                     */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_config_sel_reg_get - Reads the configuration select register.
 * @param uint8_t 0-based UART ID
 * @return uint8_t current register contents, 0xFF(read failed).
 */
uint8_t p_uart_config_sel_reg_get( uint8_t uart_id );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to configure the baud rate clock source for the uart block    */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_baud_clk_src_set - Configures the clock source for baud rate generation 
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None.
 */
void p_uart_baud_clk_src_set( uint8_t uart_id, uint8_t new_val );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to read the received uart data                                */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_rx_buff_read - Reads the receive buffer register of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return char contents of the rx buffer register
 * @note The DLAB bit should be set low in order to access the rx buffer.
 */
uint8_t p_uart_rx_buff_read( uint8_t uart_id );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to write to the transmit buffer                               */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_tx_buff_write - Writes to the tx buffer of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param int8_t data byte that is to be transmitted
 * @return None
 * @note The DLAB bit should be set low in order to access the tx buffer.
 */
void p_uart_tx_buff_write( uint8_t uart_id, uint8_t new_val );
    

/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to set the baud rate divisor value                            */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_baud_divisor_set - Function to set the baud rate divisor value of the 
 * specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint16_t desired baud rate value
 * @return None
 * @note The DLAB bit should be set high in order to access the pbrg0 and pbrg1 register.
 */
void p_uart_baud_divisor_set( uint8_t uart_id, uint16_t baud );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to write to the interrupt enable register                     */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_interrupt_enable_reg_set - Writes to the interrupt enable register of the 
 * specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None
 * @note The DLAB bit should be set low in order to access this register.
 * @note The upper four bits of this register are reserved.
 */
void p_uart_interrupt_enable_reg_set( uint8_t uart_id, uint8_t new_val );
    

/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to read the interrupt enable register                         */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_interrupt_enable_reg_get - Reads the contents of interrupt enable register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return uint8_t interrupt enable register contents, 0xFF(read fail)
 * @note The DLAB bit should be set low in order to access this register.
 * @note The upper four bits of this register are reserved.
 */
uint8_t p_uart_interrupt_enable_reg_get( uint8_t uart_id );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to read the interrupt identification register                 */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_iir_reg_get - Reads the contents of iir register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return uint8_t fifo control register contents, 0xFF(read fail).
 */
uint8_t p_uart_iir_reg_get( uint8_t uart_id );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to write to the fifo control register                         */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_fifo_control_reg_set - Writes to the fifo control register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param UART_FIFO configuration type that needs to be changed
 * @param uint8_t new configuration value
 * @return None
 * @note DMA is not supported.
 * @note Bits [5:4] are reserved.
 * @note This is a write only register.
 */
void p_uart_fifo_control_reg_set( uint8_t uart_id, UART_FIFO config_type, uint8_t new_val );
   

/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to write to the line control register                         */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_line_control_reg_set - Writes to the line control register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None.
 */
void p_uart_line_control_reg_set( uint8_t uart_id, uint8_t new_val );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to read the line control register                             */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_line_control_reg_get - Reads the contents of line control register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return uint8_t line control register contents.
 */
uint8_t p_uart_line_control_reg_get( uint8_t uart_id );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to enable/disable break control                               */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_break_control_set - Configures the uart to enable/disable break control
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None.
 */
void p_uart_break_control_set( uint8_t uart_id, uint8_t new_val );
    

/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to read the line status register                              */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_line_status_reg_get - Reads the contents of line status register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param LINE_STS_TYPE flag that needs to be checked 
 * @return uint8_t line status register contents.
 */
uint8_t p_uart_line_status_reg_get( uint8_t uart_id, LINE_STS_TYPE flag );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to write to the modem control register                        */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_modem_control_reg_set - Writes to the modem control register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param MODEM_CTRL_TYPE parameter that is to be configured
 * @param uint8_t new configuration value
 * @return None
 * @note Bits [7:5] are reserved.
 */
void p_uart_modem_control_reg_set( uint8_t uart_id, MODEM_CTRL_TYPE param, uint8_t new_val );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to read the modem control register                            */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_modem_control_reg_get - Reads the modem control register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return modem control register contents, 0xFF(read fail)
 * @note Bits [7:5] are reserved.
 */
uint8_t p_uart_modem_control_reg_get( uint8_t uart_id );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to read the modem status register                             */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_modem_status_reg_get - Reads the contents of modem status register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param MODEM_STS_TYPE flag that needs to be checked
 * @return uint8_t line status register contents.
 */
uint8_t p_uart_modem_status_reg_get( uint8_t uart_id, MODEM_STS_TYPE flag );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to write to the scratchpad register                           */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_scratchpad_write - Writes to the scratchpad register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new data
 * @return None.
 */
void p_uart_scratchpad_write( uint8_t uart_id, uint8_t new_val );


/* --------------------------------------------------------------------------------------------- */
/*  Peripheral Function - Function to read the scratchpad register                               */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_scratchpad_read - Reads the scratchpad register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return uint8_t contents of the scratchpad register.
 */
uint8_t p_uart_scratchpad_read( uint8_t uart_id );


#ifdef __cplusplus
}
#endif

#endif

/* end of uart_api.h */
/**   @}
 */
