/****************************************************************************
* © 2013 Microchip Technology Inc. and its subsidiaries.
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
*/

/** @defgroup dma dma
 *  @{
 */
/** @file dma.cpp
 \brief the dma cpp file
 This file implements the dma functionality. It defines the functions of the
 HW_DMA & HW_DMA_MAIN class

*/

/*******************************************************************************
 $File: //depot_pcs/FWEng/projects/I3C/maincodeline/KF-I3C-FreeRTOS/kf_freertos_base/firmware/src/config/kf_freertos_fpga/peripheral/dma/dma.cpp $

Version Control Information (Perforce)
*******************************************************************************
$Revision: #1 $
$DateTime: 2023/11/14 20:34:59 $
$Author: jvasanth $
  Change Description:
  3. Branched from //depotAE/ReUse_Repository/FW_ARC/driver/smbus/work_bench/source/
  4. Updated for MEC1322, added	get_aliased_ram_address function
*******************************************************************************/
extern "C"
{
	#include <common.h>
}
#include "dma.hpp"

using namespace DMA;


/******************************************************************************/
/** HW_DMA::setup_tx function.
* This function configures the dma for tx
* @param device            		The I/O device to associate with the DMA
* @param dataAHBAddress         Data AHB Address
* @param dma_buffer_tx          DMA transmit buffer
* @param transfer_bytes_count   Number of bytes to trasmit
* @return None
* @see  HW_DMA::setup_rx
*******************************************************************************/
VOID HW_DMA::setup_tx(const UINT8 device,const UINT32 dataAHBAddress, UINT32 dma_buffer_tx,const UINT8 transfer_bytes_count)
{
	trace0(0, DMA, 0, "setup_tx: Enter ");

    /* Set the activate bit for the channel to operate */
	/* Activate bit is used to activate the dma device for the particular channel.
	   It is relevant when setup_tx is called for the first time and
	   the channel is not activated */
    activate();
	
    DMA_MAIN_REGS->DMA_MAIN_ACTRST = 1;
    /* Stop the Tx DMA before configuring it*/
    stop();

    if (FALSE == wait_till_free())
	{
    	/* This should never happen, the trace here
		 * will help to detect this condition during testing */
		trace0(0, DMA_ERROR, 0, "setup_tx: dma busy !!! ");
	}

    REG32_AHB_ADDR  = dataAHBAddress;

   	/* Set DMI Start Address Register to beginning of buffer */    
    REG32_MEM_START_ADDR = ((UINT32)dma_buffer_tx);

   	/* Set DMI End Address Register */
    REG32_MEM_END_ADDR = ((UINT32)(dma_buffer_tx + transfer_bytes_count));

    /* select device,direction */
    REG32_CONTROL = (UINT32)(((UINT32)device<<9) | sbit_CONTROL_DIR
									 | sbit_CONTROL_INCR_MEMADDR | sbit_CONTROL_XFER_ONEBYTE);

    trace0(0, DMA, 0, "setup_tx: Exit ");

}/* End HW_DMA::setup_tx() */

/******************************************************************************/
/** HW_DMA::setup_rx function
 * This function configures the dma for rx
* @param device            	The I/O device to associate with the DMA
* @param dataAHBAddress 	Data AHB Address
* @param buffer_rx  		DMA receive buffer
* @param transfer_bytes_count      Number of bytes for rx
* @return None
* @see  HW_DMA::setup_tx
*******************************************************************************/
VOID HW_DMA::setup_rx(const UINT8 device,const UINT32 dataAHBAddress, UINT32 dma_buffer_rx,
		              const UINT8 transfer_bytes_count,const bool incrMemAddrFlag)
{
	UINT32 control_reg_value;

	trace0(0, DMA, 0, "setup_rx: Enter ");

    /* Set the activate bit for the channel to operate */
    activate();
    /* Stop the Rx DMA before configuring it*/
    stop();

    if (FALSE == wait_till_free())
	{
    	/* This should never happen, the trace here
    	 * will help to detect this condition during testing */
		trace0(0, DMA_ERROR, 0, "setup_rx: dma busy !!! ");
	}

    /* Assign DMA AHB Address */
    REG32_AHB_ADDR  = dataAHBAddress;

   	/* Set DMI Start Address Register to beginning of receive buffer */    
    REG32_MEM_START_ADDR = ((UINT32)dma_buffer_rx);

   	/* Set DMI End Address Register */
    REG32_MEM_END_ADDR = ((UINT32)(dma_buffer_rx + transfer_bytes_count));

    control_reg_value = (UINT32)(((UINT32)device<<9) | sbit_CONTROL_XFER_ONEBYTE);

    if (incrMemAddrFlag)
    {
    	control_reg_value |= sbit_CONTROL_INCR_MEMADDR;
    }

    /* select device,direction */
    REG32_CONTROL = control_reg_value;

}/* End HW_DMA::setup_rx */

/******************************************************************************/
/** HW_DMA::switch_tx_to_rx function.
* This function configures DMA from Tx to Rx
* @param device    		The I/O device to associate with the DMA
* @param dataAHBAddress Data AHB Address
* @return None
*******************************************************************************/
VOID HW_DMA::switch_tx_to_rx(const UINT8 device, const UINT32 dataAHBAddress)
{
	trace0(0, DMA, 0, "switch_tx_to_rx: Enter ");

    /* Stop the Rx DMA before configuring it*/
    stop();

    if (FALSE == wait_till_free())
    {
    	/* This should never happen, the trace here
		 * will help to detect this condition during testing */
    	trace0(0, DMA_ERROR, 0, "switch_tx_to_rx: dma busy !!! ");
    }

    /* Assign DMA AHB Address */
    REG32_AHB_ADDR  = dataAHBAddress;

    /* Reset the control reg to ensure that subsequent OR operations are
	 * reflected correctly. Most relevant when DMA switches over from Tx to Rx
	 * with DIR changing from 1 to 0*/
    REG32_CONTROL = 0;

   	/* select device,direction */
    REG32_CONTROL = (UINT32)(((UINT32)device<<9) |
					  sbit_CONTROL_INCR_MEMADDR | sbit_CONTROL_XFER_ONEBYTE);

}/* End HW_DMA::switch_tx_to_rx */

/******************************************************************************/
/** HW_DMA::get_device_id function.
 * This function retrieves the device id based on device name and instance
 * @param device_name - The device name - smb slave / smb master / spi flash
 * @return the device id
*******************************************************************************/
UINT8 HW_DMA::get_device_id(const UINT8 device_name, const UINT8 device_instance) const
{
	UINT8 device_id = 0;

	trace0(0, DMA, 0, "get_device_id: Enter ");

	switch (device_name)
	{
	case SMBUS_SLAVE:
		device_id = DEVICE_ID_SLAVE_1 + (UINT8)(2*device_instance);
		break;

	case SMBUS_MASTER:
		device_id = DEVICE_ID_MASTER_1 + (UINT8)(2*device_instance);
		break;

	case SPI_FLASH:
		device_id = DEVICE_ID_SPI_FLASH;
		break;

	default:
		trace0(0, DMA, 0, "get_device_id: invalid device name ");
		break;
	}

	return device_id;

}/* HW_DMA::get_device_id */

/******************************************************************************/
/** HW_DMA::wait_till_free function.
 * This function waits until dma is busy or timeout
 * @param None
 * @return TRUE if dma is not busy, FALSE if dma is still busy
*******************************************************************************/
UINT8 HW_DMA::wait_till_free() const
{
	UINT32 timeoutCounter=0;
	UINT8 retVal = TRUE;

	while(mGET_BIT(sbit_CONTROL_BUSY, REG32_CONTROL))
	{
		if (timeoutCounter++ >= BUSY_TIMEOUT_COUNTER)
		{
			trace0(0, DMA_ERROR, 0, "wait_till_free: dma busy !!! ");
			retVal = FALSE;
			break;
		}
	}
	return retVal;
}/* HW_DMA::wait_till_free */

/******************************************************************************/
/** HW_DMA::enable_interrupt.
 * This function enables the dma status done interrupt
 * @param None
 * @return None
*******************************************************************************/
VOID HW_DMA::enable_interrupt()
{
	REG32_INTR_STS = BIT_n_MASK(2); //dma interrupt status done clear		
	REG32_INTR_ENBL = BIT_n_MASK(2); //dma interrupt status done enable
	
}

/******************************************************************************/
/** HW_DMA::disable_interrupt
 * This function disables the dma status done interrupt 
 * @param None
 * @return None
*******************************************************************************/
VOID HW_DMA::disable_interrupt()
{
	REG32_INTR_STS = BIT_n_MASK(2); //dma interrupt status done clear		
	REG32_INTR_ENBL = 0; //dma interrupt status done disable	
}

/** @}
*/
