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
/** @file uart_perphl.c
* \brief UART Peripheral Source file
* \author pramans
* 
* This file implements the UART Peripheral functions  
******************************************************************************/

/** @defgroup UART
 *  @{
 */

#include "definitions.h"
#include "uart_api.h"


#ifdef __cplusplus
extern "C" {
#endif
    
   
#undef  UART0_REGS
#define UART0_REGS                       ((uart_registers_t*)0x400F2400)               /* UART0 Registers Address      */
    
#define UART1_REGS                       ((uart_registers_t*)0x400F2800)
/* ------------------------------------------------------------------------------ */
/*  Local Helper Function - Do not use                                            */
/* ------------------------------------------------------------------------------ */
static UART0_Type* p_uart_instance_addr_get( uint8_t uart_id ) 
{
    UART0_Type *ret_addr;
    switch ( uart_id )
    {
        case UART0_ID:
            ret_addr = UART0_REGS;
            break;
        
        case UART1_ID:
            ret_addr = UART1_REGS;
            break;
        default:
            ret_addr = NULL;
            break;
    }
    return ret_addr;
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to enable/disable the uart block                                    */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_enable_disable - Enables/disables the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None.
 */
void p_uart_enable_disable( uint8_t uart_id, uint8_t new_val )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        if(new_val)
        {
            uart_addr->DLAB.UART_ACTIVATE = 1;
        }
        else
        {
            uart_addr->DLAB.UART_ACTIVATE = 0;            
        }
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to write to the configuration select register                       */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_config_sel_reg_set - Writes to the configuration select register.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None
 * @note Bits [7:3] are reserved.
 */
void p_uart_config_sel_reg_set( uint8_t uart_id, uint8_t new_val )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        uart_addr->DLAB.UART_CFG_SEL = ( new_val & UART_CFG_SEL_REG_MASK );
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to read the configuration select register                           */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_config_sel_reg_get - Reads the configuration select register.
 * @param uint8_t 0-based UART ID
 * @return uint8_t current register contents, 0xFF(read failed).
 */
uint8_t p_uart_config_sel_reg_get( uint8_t uart_id )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    uint8_t ret_cfg_sel_reg;
    if ( NULL != uart_addr )
    {
        ret_cfg_sel_reg = uart_addr ->DLAB.UART_CFG_SEL;
    }
    else
    {
        ret_cfg_sel_reg = 0xFF;
    }
    return ret_cfg_sel_reg;
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to configure the baud rate clock source for the uart block          */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_baud_clk_src_set - Configures the clock source for baud rate generation 
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None.
 */
void p_uart_baud_clk_src_set( uint8_t uart_id, uint8_t new_val )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        uint8_t temp;
        uart_addr->DLAB.UART_LCR |= UART_DLAB_LCR_DLAB_Msk;
        
        temp = ( uart_addr->DLAB.UART_BAUDRT_MSB & (~UART_BAUD_CLK_BIT_MASK) );
        uart_addr -> DLAB.UART_BAUDRT_MSB = ( temp | new_val );
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to read the received uart data                                      */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_rx_buff_read - Reads the receive buffer register of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return int8_t contents of the rx buffer register
 * @note The DLAB bit should be set low in order to access the rx buffer.
 */
uint8_t p_uart_rx_buff_read( uint8_t uart_id )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    uint8_t ret_rx_buf_reg = 0xFF;
    
    if ( NULL != uart_addr )
    {
        uart_addr->DLAB.UART_LCR &= (~UART_DLAB_LCR_DLAB_Msk);
        UART0_REGS->DATA.UART_RX_DAT;
        ret_rx_buf_reg = uart_addr->DATA.UART_RX_DAT;
    }

    return ret_rx_buf_reg;
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to write to the transmit buffer                                     */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_tx_buff_write - Writes to the tx buffer of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param int8_t data byte that is to be transmitted
 * @return None
 * @note The DLAB bit should be set low in order to access the tx buffer.
 */
void p_uart_tx_buff_write( uint8_t uart_id, uint8_t new_val )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        uart_addr -> DLAB.UART_LCR &= (~UART_DLAB_LCR_DLAB_Msk);
        uart_addr -> DATA.UART_TX_DAT = new_val;
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to set the baud rate divisor value                                  */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_baud_divisor_set - Function to set the baud rate divisor value of the 
 * specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint16_t desired baud rate value
 * @return None
 * @note The DLAB bit should be set high in order to access the pbrg0 and pbrg1 register.
 */
void p_uart_baud_divisor_set( uint8_t uart_id, uint16_t baud )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        uint8_t temp, baud_lsb;
        baud_lsb = baud & 0x00FF;
        baud = (baud & 0xFF00) >> 8;
        
        uart_addr -> DLAB.UART_LCR |= UART_DLAB_LCR_DLAB_Msk;
        uart_addr -> DLAB.UART_BAUDRT_LSB = baud_lsb;
        
        temp = ( uart_addr -> DLAB.UART_BAUDRT_MSB & (~UART_BAUD_DIVISOR_MSB_MASK) );
        uart_addr -> DLAB.UART_BAUDRT_MSB = ( temp | (baud & UART_BAUD_DIVISOR_MSB_MASK) );
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to write to the interrupt enable register                           */
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
void p_uart_interrupt_enable_reg_set( uint8_t uart_id, uint8_t new_val )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        uart_addr -> DLAB.UART_LCR &= (~UART_DLAB_LCR_DLAB_Msk);
        uart_addr -> DATA.UART_IEN = ( new_val & UART_IER_REG_MASK );
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to read the interrupt enable register                               */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_interrupt_enable_reg_get - Reads the contents of interrupt enable register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return uint8_t interrupt enable register contents, 0xFF(read fail)
 * @note The DLAB bit should be set low in order to access this register.
 * @note The upper four bits of this register are reserved.
 */
uint8_t p_uart_interrupt_enable_reg_get( uint8_t uart_id )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    uint8_t ret_intr_en_reg = 0xFF;
    if ( NULL != uart_addr )
    {
        uart_addr -> DLAB.UART_LCR &= (~UART_DLAB_LCR_DLAB_Msk);
        ret_intr_en_reg = uart_addr -> DATA.UART_IEN;
    }
    else
    {
        ret_intr_en_reg = 0xFF;
    }
    return ret_intr_en_reg;
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to read the interrupt identification register                       */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_iir_reg_get - Reads the contents of iir register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return uint8_t fifo control register contents, 0xFF(read fail).
 */
uint8_t p_uart_iir_reg_get( uint8_t uart_id )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    uint8_t ret_iir_reg = 0xFF;
    if ( NULL != uart_addr )
    {
        ret_iir_reg = uart_addr -> DLAB.UART_INT_ID;
    }
    else
    {
        ret_iir_reg = 0xFF;
    }
    return ret_iir_reg ;
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to write to the fifo control register                               */
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
void p_uart_fifo_control_reg_set( uint8_t uart_id, UART_FIFO config_type, uint8_t new_val )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        switch ( config_type )
        {
            case EN_DIS_FIFO:
                if(new_val)
                {
                    uart_addr -> DLAB.UART_FIFO_CR |= UART_DATA_FIFO_CR_EXRF_Msk;
                }
                else
                {
                    uart_addr -> DLAB.UART_FIFO_CR &= (~UART_DATA_FIFO_CR_EXRF_Msk);
                }
                break;
            
            case CLR_RCV_FIFO:
                uart_addr -> DLAB.UART_FIFO_CR |= UART_DLAB_FIFO_CR_CLR_RECV_FIFO_Msk;
                break;
            
            case CLR_XMIT_FIFO:
                uart_addr -> DLAB.UART_FIFO_CR |= UART_DLAB_FIFO_CR_CLR_XMIT_FIFO_Msk;
                break;
            
            case FIFO_TRGGR_LVL:
                uart_addr -> DLAB.UART_FIFO_CR |= UART_DLAB_FIFO_CR_RECV_FIFO_TRIG_LVL( new_val );
                break;
            
            case FIFO_ALL:
                uart_addr -> DLAB.UART_FIFO_CR = ( new_val & UART_FCR_REG_MASK );
                break;
            
            default:
                break;
        }
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to write to the line control register                               */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_line_control_reg_set - Writes to the line control register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None.
 */
void p_uart_line_control_reg_set( uint8_t uart_id, uint8_t new_val )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        uint8_t temp = ( uart_addr -> DLAB.UART_LCR & (~UART_LCR_REG_MASK) );
        temp = ( temp | (new_val & UART_LCR_REG_MASK) );
        uart_addr -> DLAB.UART_LCR = temp;        
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to read the line control register                                   */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_line_control_reg_get - Reads the contents of line control register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return uint8_t line control register contents.
 */
uint8_t p_uart_line_control_reg_get( uint8_t uart_id )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    uint8_t ret_line_ctrl_reg = 0xFF;
    if (uart_addr!=NULL)
    {   
        ret_line_ctrl_reg = uart_addr ->  DLAB.UART_LCR;
    }    
    return ret_line_ctrl_reg;
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to enable/disable break control                                     */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_break_control_set - Configures the uart to enable/disable break control
 * @param uint8_t 0-based UART ID
 * @param uint8_t new configuration value
 * @return None.
 */
void p_uart_break_control_set( uint8_t uart_id, uint8_t new_val )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        if(new_val)
        {
            uart_addr -> DLAB.UART_LCR |= ( UART_DATA_LCR_BRK_CTRL_Msk );
        }
        else
        {
            uart_addr -> DLAB.UART_LCR &= (~UART_DATA_LCR_BRK_CTRL_Msk );
        }
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to read the line status register                                    */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_line_status_reg_get - Reads the contents of line status register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param LINE_STS_TYPE flag that needs to be checked 
 * @return uint8_t line status register contents.
 */
uint8_t p_uart_line_status_reg_get( uint8_t uart_id, LINE_STS_TYPE flag )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    uint8_t line_status = 0xFFu;
    if ( NULL != uart_addr)
    {
        switch ( flag )
        {
            case DATA_READY:
                if(uart_addr -> DLAB.UART_LSR & UART_DLAB_LSR_DATA_READY_Msk)
                {
                    line_status=0x1;
                }
                else
                {
                    line_status=0x0;
                }
                break;
            
            case OVERRUN_ERROR:
                if(uart_addr -> DLAB.UART_LSR & UART_DLAB_LSR_OVERRUN_Msk)
                {
                    line_status=0x1;
                }
                else
                {
                    line_status=0x0;
                }
                break;
            
            case PARITY_ERROR:
                if(uart_addr -> DLAB.UART_LSR & UART_DLAB_LSR_PE_Msk)
                {
                    line_status=0x1;
                }
                else
                {
                    line_status=0x0;
                }
                break;
            
            case FRAME_ERROR:
                if(uart_addr -> DLAB.UART_LSR & UART_DLAB_LSR_FRAME_ERR_Msk)
                {
                    line_status=0x1;
                }
                else
                {
                    line_status=0x0;
                }
                break;
            
            case BREAK_INTERRUPT:
                if(uart_addr -> DLAB.UART_LSR & UART_DLAB_LSR_BRK_INTR_Msk)
                {
                    line_status=0x1;
                }
                else
                {
                    line_status=0x0;
                }
            break;
        
            case TRANSMIT_HOLDING_REG_EMPTY:
                if(uart_addr -> DLAB.UART_LSR & UART_DLAB_LSR_TRANS_EMPTY_Msk)
                {
                    line_status=0x1;
                }
                else
                {
                    line_status=0x0;
                }
                break;
        
            case TRANSMIT_ERROR:
                if(uart_addr -> DLAB.UART_LSR & UART_DLAB_LSR_TRANS_ERR_Msk)
                {
                    line_status=0x1;
                }
                else
                {
                    line_status=0x0;
                }
                break;
            
            case FIFO_ERROR:
                if(uart_addr -> DLAB.UART_LSR & UART_DLAB_LSR_FIFO_ERR_Msk)
                {
                    line_status=0x1;
                }
                else
                {
                    line_status=0x0;
                }
                break;        
            
            case LINE_STS_ALL:
                line_status = uart_addr -> DLAB.UART_LSR;
                break;
        
            default:
                line_status = 0xFFu;
                break;
        }
    }
    
    return line_status;
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to write to the modem control register                              */
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
void p_uart_modem_control_reg_set( uint8_t uart_id, MODEM_CTRL_TYPE param, uint8_t new_val )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        switch ( param )
        {
            case DTR:

                if(new_val)
                {
                    uart_addr -> DLAB.UART_MCR |= UART_DLAB_MCR_DTR_Msk;
                }
                else
                {
                    uart_addr -> DLAB.UART_MCR &= (~UART_DLAB_MCR_DTR_Msk);
                }
                break;
            
            case RTS:
                if(new_val)
                {
                    uart_addr -> DLAB.UART_MCR |= UART_DLAB_MCR_RTS_Msk;
                }
                else
                {
                    uart_addr -> DLAB.UART_MCR &= (~UART_DLAB_MCR_RTS_Msk);
                }
                break;
            
            case OUT1:
                if(new_val)
                {
                    uart_addr -> DLAB.UART_MCR |= UART_DLAB_MCR_OUT1_Msk;
                }
                else
                {
                    uart_addr -> DLAB.UART_MCR &= (~UART_DLAB_MCR_OUT1_Msk);
                }
                break;
            
            case OUT2:
                if(new_val)
                {
                    uart_addr -> DLAB.UART_MCR |= UART_DLAB_MCR_OUT2_Msk;
                }
                else
                {
                    uart_addr -> DLAB.UART_MCR &= (~UART_DLAB_MCR_OUT2_Msk);
                }
                break;
            
            case LOOPBACK:
                if(new_val)
                {
                    uart_addr -> DLAB.UART_MCR |= UART_DLAB_MCR_LOOPBACK_Msk;
                }
                else
                {
                    uart_addr -> DLAB.UART_MCR &= (~UART_DLAB_MCR_LOOPBACK_Msk);
                }
                break;
            
            case MCR_ALL:
                uart_addr -> DLAB.UART_MCR = ( new_val & UART_MCR_REG_MASK );
                break;
            
            default:
                break;
        }
    }
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to read the modem control register                                  */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_modem_control_reg_get - Reads the modem control register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return modem control register contents, 0xFF(read fail)
 * @note Bits [7:5] are reserved.
 */
uint8_t p_uart_modem_control_reg_get( uint8_t uart_id )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    uint8_t ret_modem_ctrl_reg = 0xFF;
    if ( NULL != uart_addr )
    {
        ret_modem_ctrl_reg = uart_addr ->  DLAB.UART_MCR ;
    }
    else
    {
        ret_modem_ctrl_reg = 0xFF;
    }
    return ret_modem_ctrl_reg;
}

  
/* --------------------------------------------------------------------------------------------- */
/*                  Function to read the modem status register                                   */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_modem_status_reg_get - Reads the contents of modem status register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param MODEM_STS_TYPE flag that needs to be checked
 * @return uint8_t line status register contents.
 */
uint8_t p_uart_modem_status_reg_get( uint8_t uart_id, MODEM_STS_TYPE flag )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    uint8_t modem_status = 0u;
    if ( NULL != uart_addr)
    {
        switch ( flag )
        {
            case CTS:
                if(uart_addr -> DLAB.UART_MSR & UART_DLAB_MSR_CTS_Msk)
                {
                    modem_status=0x1;
                }
                else
                {
                    modem_status=0x0;
                }
                break;
        
            case DSR:
                if(uart_addr -> DLAB.UART_MSR & UART_DLAB_MSR_DSR_Msk)
                {
                   modem_status=0x1;
                }
                else
                {
                    modem_status=0x0;
                }
                break;
        
            case RI:
                if(uart_addr -> DLAB.UART_MSR & UART_DLAB_MSR_RI_Msk)
                {
                    modem_status=0x1;
                }
                else
                {
                    modem_status=0x0;
                } 
                break;
        
            case DCD:
                if(uart_addr -> DLAB.UART_MSR & UART_DLAB_MSR_DCD_Msk)
                { 
                    modem_status=0x1;
                }   
                else
                {
                    modem_status=0x0;
                }
                break;
        
            case nCTS:
                if(uart_addr -> DLAB.UART_MSR & UART_DLAB_MSR_nCTS_Msk)
                {
                    modem_status=0x1;
                }
                else
                {
                    modem_status=0x0;
                }
                break;
        
            case nDSR:
                if(uart_addr -> DLAB.UART_MSR & UART_DLAB_MSR_nDSR_Msk)
                {
                    modem_status=0x1;
                }
                else
                {
                    modem_status=0x0;
                }
                break;
        
            case nRI:
                if(uart_addr -> DLAB.UART_MSR & UART_DLAB_MSR_nRI_Msk)
                {
                    modem_status=0x1;
                }
                else
                {
                    modem_status=0x0;
                }
                break;
        
            case nDCD:
                if(uart_addr -> DLAB.UART_MSR & UART_DLAB_MSR_nDCD_Msk)
                {
                    modem_status=0x1;
                }
                else
                {
                    modem_status=0x0;
                }
                break;
        
            case MODEM_STS_ALL:
                modem_status = uart_addr -> DLAB.UART_MSR;
                break;
            
            default:
                modem_status = 0u;
                break;
        }
    }
    return modem_status;
}


/* --------------------------------------------------------------------------------------------- */
/*                  Function to write to the scratchpad register                                 */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_scratchpad_write - Writes to the scratchpad register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @param uint8_t new data
 * @return None.
 */
void p_uart_scratchpad_write( uint8_t uart_id, uint8_t new_val )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    
    if ( NULL != uart_addr )
    {
        uart_addr -> DLAB.UART_SCR = new_val;
    }
}

  
/* --------------------------------------------------------------------------------------------- */
/*                  Function to read the scratchpad register                                     */
/* --------------------------------------------------------------------------------------------- */
/**
 * p_uart_scratchpad_read - Reads the scratchpad register
 * of the specified uart instance.
 * @param uint8_t 0-based UART ID
 * @return uint8_t contents of the scratchpad register.
 */
uint8_t p_uart_scratchpad_read( uint8_t uart_id )
{
    UART0_Type* uart_addr = p_uart_instance_addr_get( uart_id );
    uint8_t ret_scratchpad_reg = 0xFF;
    if (uart_addr!=NULL)
    {   
        ret_scratchpad_reg = uart_addr -> DLAB.UART_SCR;
    }    
    else
    {
        ret_scratchpad_reg = 0xFF;
    }
    return ret_scratchpad_reg;
}


#ifdef __cplusplus
}
#endif

/* end of uart_perphl.c */
/**   @}
 */
