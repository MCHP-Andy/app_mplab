/*
 * Copyright 2023 Microchip Technology Inc.
 */

#include "interrupts.h"
#include "dma.h"
#include <zephyr/drivers/i3c.h>

/******************************************************************************/
/** dma_main_enable function.
 * This function enables the main dma block
 * @param None
 * @return None
*******************************************************************************/
void dma_main_enable(struct dma_main_regs *regs)
{
    mSET_BIT(sbit_MAIN_CTRL_ACTIVATE, regs->MAIN_CONTROL);
}/* dma_main_enable */

/******************************************************************************/
/** dma_main_disable function.
 * This function disables the main dma block
 * @param None
 * @return None
*******************************************************************************/
void dma_main_disable(struct dma_main_regs *regs)
{
    mCLR_BIT(sbit_MAIN_CTRL_ACTIVATE, regs->MAIN_CONTROL);
}/* dma_main_disable */

/******************************************************************************/
/** dma_activate function.
 * This function sets the ACTIVATE bit
 * @param None
 * @return None
*******************************************************************************/
void dma_activate(struct dma_regs *regs)
{
    mSET_BIT(sbit_ACTIVATE, regs->REG8_ACTIVATE);
}/* dma_activate */

/******************************************************************************/
/** dma_deactivate function.
 * This function clears the ACTIVATE bit
 * @param None
 * @return None
*******************************************************************************/
void dma_deactivate(struct dma_regs *regs)
{
    mCLR_BIT(sbit_ACTIVATE, regs->REG8_ACTIVATE);
}/* dma_deactivate */

/******************************************************************************/
/** dma_stop function.
 * This function clears the RUN bit
 * @param None
 * @return None
*******************************************************************************/
void dma_stop(struct dma_regs *regs)
{
    mCLR_BIT(sbit_CONTROL_RUN, regs->REG32_CONTROL);
}/* dma_stop */

/******************************************************************************/
/** dma_start function.
 * This function sets the RUN bit
 * @param None
 * @return None
*******************************************************************************/
void dma_start(struct dma_regs *regs)
{
   regs->REG32_CONTROL |= sbit_CONTROL_RUN;
}/* dma_start */

/******************************************************************************/
/** dma_setup_tx function.
* This function configures the dma for tx
* @param device            		The I/O device to associate with the DMA
* @param dataAHBAddress         Data AHB Address
* @param dma_buffer_tx          DMA transmit buffer
* @param transfer_bytes_count   Number of bytes to trasmit
* @return None
* @see  dma_setup_rx
*******************************************************************************/
void dma_setup_tx(struct dma_regs *regs, const uint8_t device, const uint32_t dataAHBAddress, uint32_t dma_buffer_tx, 
                     const uint16_t transfer_bytes_count, const bool xferDword)
{
    uint32_t xfer_size;
    
    LOG_DBG("[%s]: Enter", __FUNCTION__);

    /* Set the activate bit for the channel to operate */
	/* Activate bit is used to activate the dma device for the particular channel.
	   It is relevant when setup_tx is called for the first time and
	   the channel is not activated */
    dma_activate(regs);
    
    //DMA_MAIN_REGS->DMA_MAIN_ACTRST = 1;
    /* Stop the Tx DMA before configuring it*/
    dma_stop(regs);

    if (false == dma_wait_till_free(regs))
	{
    	/* This should never happen, the trace here
		 * will help to detect this condition during testing */
        LOG_ERR("[%s]: dma busy !!!", __FUNCTION__);
	}

    regs->REG32_AHB_ADDR  = dataAHBAddress;

   	/* Set DMI Start Address Register to beginning of buffer */    
    regs->REG32_MEM_START_ADDR = ((uint32_t)dma_buffer_tx);

   	/* Set DMI End Address Register */
    regs->REG32_MEM_END_ADDR = ((uint32_t)(dma_buffer_tx + transfer_bytes_count));
    
    xfer_size = sbit_CONTROL_XFER_ONEBYTE;
            
    if (xferDword) {
        xfer_size = sbit_CONTROL_XFER_DWORD;
    }

    /* select device,direction */
#if 1
    regs->REG32_CONTROL = (uint32_t)(((uint32_t)device<<9) | sbit_CONTROL_DIR
									 | sbit_CONTROL_INCR_MEMADDR | xfer_size);

#else
    regs->REG32_CONTROL = (uint32_t)(((uint32_t)device<<9) | sbit_CONTROL_DIR | sbit_CONTROL_RUN
									 | sbit_CONTROL_INCR_MEMADDR | xfer_size);
    
    dma_activate(regs);
#endif    
    
    

    LOG_DBG("[%s]: Exit", __FUNCTION__);

}/* End dma_setup_tx() */

/******************************************************************************/
/** dma_setup_rx function
 * This function configures the dma for rx
* @param device            	The I/O device to associate with the DMA
* @param dataAHBAddress 	Data AHB Address
* @param buffer_rx  		DMA receive buffer
* @param transfer_bytes_count      Number of bytes for rx
* @return None
* @see  dma_setup_tx
*******************************************************************************/
void dma_setup_rx(struct dma_regs *regs, const uint8_t device,const uint32_t dataAHBAddress, uint32_t dma_buffer_rx,
		              const uint16_t transfer_bytes_count, const bool incrMemAddrFlag, const bool xferDword)
{
	uint32_t control_reg_value;
    uint32_t xfer_size;

    LOG_DBG("[%s]: Enter", __FUNCTION__);

    /* Set the activate bit for the channel to operate */
    dma_activate(regs);
    /* Stop the Rx DMA before configuring it*/
    dma_stop(regs);

    if (false == dma_wait_till_free(regs))
	{
    	/* This should never happen, the trace here
    	 * will help to detect this condition during testing */
        LOG_ERR("[%s]: dma busy !!!", __FUNCTION__);
	}

    /* Assign DMA AHB Address */
    regs->REG32_AHB_ADDR  = dataAHBAddress;

   	/* Set DMI Start Address Register to beginning of receive buffer */    
    regs->REG32_MEM_START_ADDR = ((uint32_t)dma_buffer_rx);

   	/* Set DMI End Address Register */
    regs->REG32_MEM_END_ADDR = ((uint32_t)(dma_buffer_rx + transfer_bytes_count));
    
    xfer_size = sbit_CONTROL_XFER_ONEBYTE;
            
    if (xferDword) {
        xfer_size = sbit_CONTROL_XFER_DWORD;
    }

    control_reg_value = (uint32_t)(((uint32_t)device<<9) | xfer_size);

    if (incrMemAddrFlag)
    {
    	control_reg_value |= sbit_CONTROL_INCR_MEMADDR;
    }

    /* select device,direction */
    regs->REG32_CONTROL = control_reg_value;

}/* End dma_setup_rx */

/******************************************************************************/
/** dma_switch_tx_to_rx function.
* This function configures DMA from Tx to Rx
* @param device    		The I/O device to associate with the DMA
* @param dataAHBAddress Data AHB Address
* @return None
*******************************************************************************/
void dma_switch_tx_to_rx(struct dma_regs *regs, const uint8_t device, const uint32_t dataAHBAddress)
{
    LOG_DBG("[%s]: Enter", __FUNCTION__);

    /* Stop the Rx DMA before configuring it*/
    dma_stop(regs);

    if (false == dma_wait_till_free(regs))
    {
    	/* This should never happen, the trace here
		 * will help to detect this condition during testing */
        LOG_ERR("[%s] dma busy !!!", __FUNCTION__);
    }

    /* Assign DMA AHB Address */
    regs->REG32_AHB_ADDR  = dataAHBAddress;

    /* Reset the control reg to ensure that subsequent OR operations are
	 * reflected correctly. Most relevant when DMA switches over from Tx to Rx
	 * with DIR changing from 1 to 0*/
    regs->REG32_CONTROL = 0;

   	/* select device,direction */
    regs->REG32_CONTROL = (uint32_t)(((uint32_t)device<<9) |
					  sbit_CONTROL_INCR_MEMADDR | sbit_CONTROL_XFER_ONEBYTE);

}/* End dma_switch_tx_to_rx */

/******************************************************************************/
/** dma_get_device_id function.
 * This function retrieves the device id based on device name and instance
 * @param device_name - The device name - smb slave / smb master / spi flash
 * @return the device id
*******************************************************************************/
uint8_t dma_get_device_id(const uint8_t device_name, const uint8_t device_instance)
{
	uint8_t device_id = 0;

    LOG_DBG("[%s]: Enter", __FUNCTION__);

	switch (device_name)
	{
	case SMBUS_SLAVE:
		device_id = DEVICE_ID_I2C_SLAVE_0 + (uint8_t)(2*device_instance);
		break;

	case SMBUS_MASTER:
		device_id = DEVICE_ID_I2C_MASTER_0 + (uint8_t)(2*device_instance);
		break;

    case I3C_HOST_TX:
		device_id = DEVICE_ID_I3C_HOST_TX_0 + (uint8_t)(2*device_instance);
		break;
        
    case I3C_HOST_RX:
		device_id = DEVICE_ID_I3C_HOST_RX_0 + (uint8_t)(2*device_instance);
		break;
        
    case I3C_SEC_HOST_TX:
		device_id = DEVICE_ID_I3C_SEC_HOST_TX_0 + (uint8_t)(2*device_instance);
		break;
        
    case I3C_SEC_HOST_RX:
		device_id = DEVICE_ID_I3C_SEC_HOST_RX_0 + (uint8_t)(2*device_instance);
		break;

	default:
        LOG_DBG("[%s]: invalid device name", __FUNCTION__);
		break;
	}

	return device_id;

}/* dma_get_device_id */

/******************************************************************************/
/** dma_wait_till_free function.
 * This function waits until dma is busy or timeout
 * @param None
 * @return TRUE if dma is not busy, FALSE if dma is still busy
*******************************************************************************/
bool dma_wait_till_free(struct dma_regs *regs)
{
	uint32_t timeoutCounter=0;
	bool retVal = true;

	while(mGET_BIT(sbit_CONTROL_BUSY, regs->REG32_CONTROL))
	{
		if (timeoutCounter++ >= BUSY_TIMEOUT_COUNTER)
		{
            LOG_ERR("[%s]: dma busy !!!", __FUNCTION__);
			retVal = false;
			break;
		}
	}
	return retVal;
}/* dma_wait_till_free */

/******************************************************************************/
/** dma_enable_interrupt.
 * This function enables the dma status done interrupt
 * @param None
 * @return None
*******************************************************************************/
void dma_enable_interrupt(struct dma_regs *regs)
{
	regs->REG32_INTR_STS = (1U << 2); // BIT_n_MASK(2); //dma interrupt status done clear		
	regs->REG32_INTR_ENBL = (1U << 2); // BIT_n_MASK(2); //dma interrupt status done enable
	
}

/******************************************************************************/
/** dma_disable_interrupt
 * This function disables the dma status done interrupt 
 * @param None
 * @return None
*******************************************************************************/
void dma_disable_interrupt(struct dma_regs *regs)
{
	regs->REG32_INTR_STS = (1U << 2); // BIT_n_MASK(2); //dma interrupt status done clear		
	regs->REG32_INTR_ENBL = 0; //dma interrupt status done disable	
}

/** @}
*/
