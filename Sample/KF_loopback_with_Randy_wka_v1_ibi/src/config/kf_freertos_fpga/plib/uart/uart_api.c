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
/** @file uart_api.c
* \brief UART API Source file
* \author pramans
* 
* This file implements the UART API functions  
******************************************************************************/

/** @defgroup UART
 *  @{
 */
 

#include "definitions.h"
#include "uart_api.h"

/* ------------------------------------------------------------------------------ */
/*  Local Helper Function - Do not use                                            */

/* ------------------------------------------------------------------------------ */
static uint8_t uart_id_is_valid( uint8_t uart_id ) {
    uint8_t ret_valid;
    if ( uart_id <= UART1_ID ) {
        ret_valid = 1u;
    }
    else
    {
        ret_valid = 0u;
    }

    return ret_valid;
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to initialize the UART pins                                         */
/* --------------------------------------------------------------------------------------------- */

/**
 * uart_pins_init - Initializes the gpio pin that are associated
 * with the specified UART instance for UART functionality.
 * @param uint8_t 0-based UART ID
 * @return None.
 */
void uart_pins_init( uint8_t uart_id ) {
    if ( uart_id_is_valid(uart_id) )
    {
        switch ( uart_id )
        {
                //For Everglades changed pins
            case UART0_ID:

                break;
            case UART1_ID:

                break;
            default:
                break;
        }
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to initialize and enable the UART block                             */
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
                   uint8_t operation_mode, uint8_t fifo_tggr_lvl ) {
    if ( uart_id_is_valid(uart_id) ) {
        uint8_t init_val;

        switch ( clock_sel )    // Configure the polarity, power source and clock settings
        {
            case UART_CLK_INT_1P84MHz:
                init_val = polarity + power + UART_CFG_SEL_CLK_INT;
                p_uart_config_sel_reg_set( uart_id, init_val );
                p_uart_baud_clk_src_set( uart_id, UART_BAUD_CLK_1P84MHz );
                break;

            case UART_CLK_INT_48MHz:
                init_val = polarity + power + UART_CFG_SEL_CLK_INT;
                p_uart_config_sel_reg_set( uart_id, init_val );
                p_uart_baud_clk_src_set( uart_id, UART_BAUD_CLK_48MHz );
                break;

            case UART_CLK_EXT:
                init_val = polarity + power + UART_CFG_SEL_CLK_EXT;
                p_uart_config_sel_reg_set( uart_id, init_val );
                break;

            default:
                break;
        }

        p_uart_baud_divisor_set( uart_id, baud );      // Configure the baud rate divisor

        p_uart_fifo_control_reg_set( uart_id, FIFO_TRGGR_LVL, fifo_tggr_lvl );  // Configure operation mode
        p_uart_fifo_control_reg_set( uart_id, EN_DIS_FIFO, operation_mode );

        p_uart_enable_disable( uart_id, UART_BLOCK_EN );    // Enable the uart block
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to configure the protocol & interrupt parameters                    */
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
                         INT_TYPE interrupt_type ) {
    if ( uart_id_is_valid(uart_id) ) {
        uint8_t temp, line_cntrl_val;

        line_cntrl_val = wrd_len + stp_bit + parity_type;
        temp = ( p_uart_line_control_reg_get(uart_id) & 0xC0 );
        temp |= line_cntrl_val;

        p_uart_line_control_reg_set( uart_id, temp );   // Configure the protocol settings

        switch ( interrupt_type )   // Configure the interrupt setting
        {
            case UART_RX_DATA_AVAILABLE:
                temp = ( p_uart_interrupt_enable_reg_get(uart_id) & (~UART_DATA_IEN_ERDAI_Msk) );
                temp |= UART_IER_ERDAI_EN;
                p_uart_interrupt_enable_reg_set( uart_id, temp );
                break;

            case UART_TX_BUFF_EMPTY:
                temp = ( p_uart_interrupt_enable_reg_get(uart_id) & (~UART_DATA_IEN_ETHREI_Msk) );
                temp |= UART_IER_ETHREI_EN;
                p_uart_interrupt_enable_reg_set( uart_id, temp );
                break;

            case UART_RX_LINE_STS:
                temp = ( p_uart_interrupt_enable_reg_get(uart_id) & (~UART_DATA_IEN_ELSI_Msk) );
                temp |= UART_IER_ELSI_EN;
                p_uart_interrupt_enable_reg_set( uart_id, temp );
                break;

            case UART_MODEM_STS:
                temp = ( p_uart_interrupt_enable_reg_get(uart_id) & (~UART_DATA_IEN_EMSI_Msk) );
                temp |= UART_IER_EMSI_EN;
                p_uart_interrupt_enable_reg_set( uart_id, temp );
                break;

            case UART_RX_TX_BUFF:
                temp = ( p_uart_interrupt_enable_reg_get(uart_id) & 0x0C );
                temp |= UART_IER_RX_TX_BUFF;
                p_uart_interrupt_enable_reg_set( uart_id, temp );
                break;

            case UART_ALL_INT_EN:
                p_uart_interrupt_enable_reg_set( uart_id, 0x0F );
                break;

            case UART_INT_DISABLED:
                p_uart_interrupt_enable_reg_set( uart_id, 0x00 );
                break;

            default:
                break;
        }
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to transmit serial data                                             */
/* --------------------------------------------------------------------------------------------- */

/**
 * uart_transmit - Transmits serial data using the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t data to be transmitted
 * @return None.
 */
void uart_transmit( uint8_t uart_id, uint8_t data ) {
    if ( uart_id_is_valid(uart_id) ) {
        p_uart_tx_buff_write( uart_id, data );
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to receive serial data                                              */
/* --------------------------------------------------------------------------------------------- */

/**
 * uart_transmit - Receives serial data using the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return uint8_t data received through the uart.
 */
uint8_t uart_receive( uint8_t uart_id ) {
    return p_uart_rx_buff_read( uart_id );
}

/* end of uart_api.c */
/**   @}
 */

