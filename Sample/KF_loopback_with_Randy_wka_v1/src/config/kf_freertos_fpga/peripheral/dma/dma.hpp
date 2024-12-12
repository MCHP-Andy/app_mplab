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
/** @file dma.hpp
 \brief the dma hpp file
 This file implements the dma functionality. It consists of the
 HW_DMA & HW_DMA_MAIN class
*/

/*******************************************************************************
 $File: //depot_pcs/FWEng/projects/I3C/maincodeline/KF-I3C-FreeRTOS/kf_freertos_base/firmware/src/config/kf_freertos_fpga/peripheral/dma/dma.hpp $

Version Control Information (Perforce)
*******************************************************************************
$Revision: #1 $
$DateTime: 2023/11/14 20:34:59 $
$Author: jvasanth $
  Change Description:
  3. Branched from //depotAE/ReUse_Repository/FW_ARC/driver/smbus/work_bench/source/
  4. Updated file header for MEC1322 test environment
*******************************************************************************/
#ifndef DMA_H_
#define DMA_H_

namespace DMA{

enum device_names
{
	SMBUS_SLAVE
	,SMBUS_MASTER
	,SPI_FLASH
};


class HW_DMA_MAIN{

	enum main_control_reg_bits
	{
		sbit_MAIN_CTRL_ACTIVATE = BIT_0_MASK
	};

	private:
		union
		{
			volatile UINT8  MAIN_CONTROL;		/*ADDR_DMA_MAIN_CONTROL offset=00h*/
			volatile UINT32 dword_MAIN_CONTROL;
		};
		volatile UINT32 AFIFO_DATA;				/*ADDR_DMA_AFIFO_DATA offset=04h*/
		volatile UINT32 MAIN_DEBUG;				/*ADDR_DMA_MAIN_DEBUG offset=08h*/

		HW_DMA_MAIN(const HW_DMA_MAIN& r); //no copy
		HW_DMA_MAIN& operator=(const HW_DMA_MAIN& r);  //no assignment
	public:

		HW_DMA_MAIN(){};

		/******************************************************************************/
		/** HW_DMA_MAIN::enable function.
		 * This function enables the main dma block
		 * @param None
		 * @return None
		*******************************************************************************/
		VOID enable()
		{
			mSET_BIT(sbit_MAIN_CTRL_ACTIVATE, MAIN_CONTROL);
		}/* HW_DMA_MAIN::enable */

		/******************************************************************************/
		/** HW_DMA_MAIN::disable function.
		 * This function disables the main dma block
		 * @param None
		 * @return None
		*******************************************************************************/
		VOID disable()
		{
			mCLR_BIT(sbit_MAIN_CTRL_ACTIVATE, MAIN_CONTROL);
		}/* HW_DMA_MAIN::disable */

	};

class HW_DMA{

	/* This counter is to ensure that we check for busy condition
	 * for atleast 100ms */
	enum {
		BUSY_TIMEOUT_COUNTER= 8000
	};

	enum control_reg_bits
	{
		sbit_CONTROL_RUN = BIT_0_MASK
	   ,sbit_CONTROL_DONE = BIT_2_MASK
	   ,sbit_CONTROL_BUSY = BIT_5_MASK
	   ,sbit_CONTROL_DIR = BIT_8_MASK
	   ,sbit_CONTROL_INCR_MEMADDR = BIT_16_MASK
	   ,sbit_CONTROL_XFER_ONEBYTE = BIT_20_MASK
	};

	enum dma_activate_reg_bits
	{
		sbit_ACTIVATE = BIT_0_MASK
	};

	enum device_ids
	{
		DEVICE_ID_SLAVE_1 = 0
	   ,DEVICE_ID_MASTER_1
	   ,DEVICE_ID_SLAVE_2
	   ,DEVICE_ID_MASTER_2
	   ,DEVICE_ID_SPI_FLASH
	};

	private:

		union
		 {
			VUINT8  REG8_ACTIVATE;
			VUINT32 dword_ACTIVATE;
		 };
		 VUINT32 REG32_MEM_START_ADDR;
		 VUINT32 REG32_MEM_END_ADDR;
		 VUINT32 REG32_AHB_ADDR;
		 VUINT32 REG32_CONTROL;
		 VUINT32 REG32_INTR_STS;
		 VUINT32 REG32_INTR_ENBL;
		 VUINT32 REG32_TEST;

		HW_DMA(const HW_DMA& r); //no copy
		HW_DMA& operator=(const HW_DMA& r);  //no assignment
		UINT8 wait_till_free() const;

	public:

		 HW_DMA(){};

		/******************************************************************************/
		/** HW_DMA::activate function.
		 * This function sets the ACTIVATE bit
		 * @param None
		 * @return None
		*******************************************************************************/
		VOID activate()
		{
			mSET_BIT(sbit_ACTIVATE, REG8_ACTIVATE);
		}/* HW_DMA::activate */

		/******************************************************************************/
		/** HW_DMA::deactivate function.
		 * This function clears the ACTIVATE bit
		 * @param None
		 * @return None
		*******************************************************************************/
		VOID deactivate()
		{
			mCLR_BIT(sbit_ACTIVATE, REG8_ACTIVATE);
		}/* HW_DMA::deactivate */

		/******************************************************************************/
		/** HW_DMA::stop function.
		 * This function clears the RUN bit
		 * @param None
		 * @return None
		*******************************************************************************/
		VOID stop()
		{
			mCLR_BIT(sbit_CONTROL_RUN, REG32_CONTROL);
		}/* HW_DMA::stop */

		/******************************************************************************/
		/** HW_DMA::start function.
		 * This function sets the RUN bit
		 * @param None
		 * @return None
		*******************************************************************************/
		VOID start()
		{
		   REG32_CONTROL |= sbit_CONTROL_RUN;
		}/* HW_DMA::start */


		VOID setup_tx(const UINT8 device,const UINT32 dataAHBAddress, UINT32 dma_buffer_tx,const UINT8 transfer_bytes_count);
		VOID setup_rx(const UINT8 device,const UINT32 dataAHBAddress, UINT32 dma_buffer_rx,
				              const UINT8 transfer_bytes_count,const bool incrMemAddrFlag);
		VOID switch_tx_to_rx(const UINT8 device,const UINT32 dataAHBAddress);
		UINT8 get_device_id(const UINT8 device_name, const UINT8 device_instance) const;
		VOID enable_interrupt();
		VOID disable_interrupt();
	} ;

}
#endif /* DMA_H_ */
/** @}
*/
