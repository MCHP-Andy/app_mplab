/*****************************************************************************
* Copyright (c) 2023 Microchip Technology Inc. and its subsidiaries.
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
*****************************************************************************/

#include "plib_i3c.h"
#include "peripheral/ecia/plib_ecia.h"
#include "zephyr/drivers/i3c.h"

static I3C_OBJECT I3CObj[I3C_MAX_CHAN];
static uint8_t tid = 0;
static uint32_t targets_ibi_enable_sts = 0;

/**
 * @brief configure timing for i2c transfers
 *
 * @param regs Pointer to controller registers
 */
void I3C_Controller_Clk_Cfg_I2C(struct i3c_xec_regs *regs, uint32_t core_clk_rate_mhz)
{
    uint32_t core_clk_freq_ns;

    core_clk_freq_ns = ceiling_fraction(1000000000, core_clk_rate_mhz);

    _i2c_fmp_timing_set(regs, core_clk_freq_ns);

    _i2c_fm_timing_set(regs, core_clk_freq_ns);

    _i2c_slave_present_set(regs);
}

/**
 * @brief configure timing for i3c transfers
 *
 * @param regs Pointer to controller registers
 */
void I3C_Controller_Clk_Cfg(struct i3c_xec_regs *regs, uint32_t core_clk_rate_mhz)
{
    uint32_t core_clk_freq_ns;

    core_clk_freq_ns = ceiling_fraction(1000000000, core_clk_rate_mhz);

    /* Program the I3C Push Pull Timing Register */
    _i3c_push_pull_timing_set(regs, core_clk_freq_ns);

    /* Program the I3C Open Drain Timing Register */
    _i3c_open_drain_timing_set(regs, core_clk_freq_ns);
}

/**
 * @brief Initializes the target related registers
 *
 * @param regs Pointer to controller registers
 */
void I3C_Target_Init(struct i3c_xec_regs *regs, uint32_t core_clk_rate_mhz, uint16_t *max_rd_len, uint16_t *max_wr_len)
{
    uint32_t core_clk_freq_ns;

    core_clk_freq_ns = ceiling_fraction(1000000000, core_clk_rate_mhz);

    /* Program the I3C Bus Free Avail Timing Register */
    _i3c_bus_available_timing_set(regs, core_clk_freq_ns);

    /* Program the I3C Bus Idle Timing Register */
    _i3c_bus_idle_timing_set(regs, core_clk_freq_ns);

    _i3c_bus_free_timing_set(regs, core_clk_freq_ns);
    /* Get default max read and write length */
    _i3c_tgt_MRL_get(regs, max_rd_len);
    _i3c_tgt_MWL_get(regs, max_wr_len);

    _i3c_sda_hld_switch_delay_timing_set(regs, SDA_OD_PP_SWITCH_DLY_0,
                                        SDA_PP_OD_SWITCH_DLY_0, SDA_TX_HOLD_1);

    /* TODO, check how to calculate based on clock frequency?*/
    _i3c_scl_low_mst_tout_set(regs, 0x003567E0);

    _i3c_tgt_max_speed_update(regs, TGT_MAX_RD_DATA_SPEED, TGT_MAX_WR_DATA_SPEED);

    _i3c_tgt_clk_to_data_turn_update(regs, TGT_CLK_TO_DATA_TURN);
    /* Going with default values for SLV_TSX_SYMBL_TIMING register
     * (params MXDS_CLK_DATA_TURN and MXDS_CLK_DATA_TURN)
     * See section 8.1.4 in user guide; revisit later if we need to program
     * these registers */
}

/**
 * @brief Updates the Max read and write lengths if controller updates using CCC
 *
 * @param regs Pointer to controller registers
 */
void I3C_Target_MRL_MWL_update(struct i3c_xec_regs *regs, uint16_t *max_rd_len, uint16_t *max_wr_len)
{
    if (_i3c_tgt_MRL_updated(regs)) {
        LOG_DBG("MRL updated by master!!");
        _i3c_tgt_MRL_get(regs, max_rd_len);
    }

    if (_i3c_tgt_MWL_updated(regs)) {
        LOG_DBG("MWL updated by master!!");
        _i3c_tgt_MRL_get(regs, max_wr_len);
    }
}

/**
 * @brief Sets the Max read and write lengths
 *
 * @param regs Pointer to controller registers
 */
void I3C_Target_MRL_MWL_set(struct i3c_xec_regs *regs, uint16_t max_rd_len, uint16_t max_wr_len)
{
    _i3c_tgt_MRL_MWL_set(regs, max_rd_len, max_wr_len);
}

/**
 * @brief Enable target controller interrupts
 *
 * @param regs Pointer to controller registers
 */
void I3C_Target_Interrupts_Init(struct i3c_xec_regs *regs)
{
    uint32_t mask = 0xFFFFFFFFU;

     /* Clear all interrupt status */
    _i3c_intr_sts_clear(regs, mask);

    /* Enable only necessary interrupts */
    mask = sbit_RESP_READY_STS | sbit_CCC_UPDATED_STS | \
           sbit_DYN_ADDR_ASSIGN_STS | sbit_DEFSLV_STS | \
           sbit_READ_REQ_RECV_STS | sbit_IBI_UPDATED_STS | \
           sbit_BUSOWNER_UPDATED_STS;

    /* Enable required interrupt status */
    _i3c_intr_sts_enable(regs, mask);

    /* Enable required interrupt signals */
    _i3c_intr_sgnl_enable(regs, mask);
}

/**
 * @brief Enable required controller interrupts
 *
 * @param regs Pointer to controller registers
 */
void I3C_Controller_Interrupts_Init(struct i3c_xec_regs *regs)
{
    uint32_t mask = 0xFFFFFFFFU;

     /* Clear all interrupt status */
    _i3c_intr_sts_clear(regs, mask);

    /* Enable only necessary interrupts */
    mask = sbit_RESP_READY_STS | sbit_TRANSFER_ABORT_STS | \
           sbit_TRANSFER_ERR_STS | sbit_DEFSLV_STS | \
           sbit_BUSOWNER_UPDATED_STS | sbit_BUS_RESET_DONE_STS;

    /* Enable required interrupt status */
    _i3c_intr_sts_enable(regs, mask);

    /* Enable required interrupt signals */
    _i3c_intr_sgnl_enable(regs, mask);
}

/**
 * @brief Initialize the Queue and Data buffer thresholds
 *
 * @param regs Pointer to controller registers
 */
void I3C_Thresholds_Init(struct i3c_xec_regs *regs)
{

    // Command Buffer Empty Threshold Value.
    // Controls the number of empty locations (or greater)
    // in the Command Queue that trigger CMD_QUEUE_READY_STAT
    // interrupt. The valid range is 0 to IC_CMD_BUF_DEPTH-1. The
    // software programs only valid values. Value of N ranging from
    // 1 to IC_CMD_BUF_DEPTH-1 sets the threshold to N empty
    // locations and a value of 0 sets the threshold to indicate that
    // the queue is completely empty.
    _i3c_cmd_queue_threshold_set(regs, 0x00);

    // Response Buffer Threshold Value.
    // Controls the number of entries (or greater) in the Response
    // Queue that trigger the RESP_READY_STAT_INTR interrupt.
    // The valid range is 0 to IC_RESP_BUF_DEPTH-1. The
    // software programs only valid values. A value of 0 sets the
    // threshold for 1 entry, and a value of N sets the threshold for
    // N+1 entries.
    _i3c_resp_queue_threshold_set(regs, 0x00);

    // IBI Data Threshold Value
    // This field represents the IBI data segment size in Dwords (4
    // bytes). The minimum supported segment size is 1 (4 bytes)
    // and the maximum supported size is
    // IC_IBI_DATA_BUF_DEPTH-1. The IBI_DATA_THLD field
    // enables the slicing of the incoming IBI data and generate
    // individual status and thereby promotes the cut-through
    // operation in reading out the IBI data.
    _i3c_ibi_data_threshold_set(regs, 10);

    // In-Band Interrupt Status Threshold Value.
    // Every In Band Interrupt received (with or without Payload) by
    // I3C controller generates an IBI status. This field controls the
    // number of IBI status entries (or greater) in the IBI queue that
    // trigger the IBI_THLD_STAT interrupt.
    // The valid range is 0 to IC_IBI_BUF_DEPTH-1. The software
    // programs only valid values. A value of 0 sets the threshold
    // for 1 entry, and a value of N sets the threshold for N+1
    // entries.
    // NOTE: The valid value is only 0 if IBI with payload is selected
    // in the configuration.
    // Each IBI status entry can represent the complete (IBI
    // payload byte size <= 4*IBI_DATA_THLD) IBI payload or a
    // segment (IBI payload byte size > 4*IBI_DATA_THLD) of the
    // IBI payload.
    _i3c_ibi_status_threshold_set(regs, 0x00);


#if I3C_ENABLE_DMA
    
    _i3c_tx_buf_threshold_set(regs, DATA_BUF_THLD_TX_FIFO_EMPTY_4);
    
    _i3c_rx_buf_threshold_set(regs, DATA_BUF_THLD_RX_FIFO_4);
    
#elif I3C_ENABLE_THRESHOLDS_INTR

    _i3c_tx_buf_threshold_set(regs, DATA_BUF_THLD_TX_FIFO_EMPTY_8);

    _i3c_rx_buf_threshold_set(regs, DATA_BUF_THLD_RX_FIFO_8); 
    
#else    
    // Transmit Buffer Threshold Value
    // This field controls the number of empty locations (or above)
    // in the Transmit FIFO that trigger the TX_THLD_STAT
    // interrupt.
    _i3c_tx_buf_threshold_set(regs, DATA_BUF_THLD_TX_FIFO_EMPTY_1);

    // Receive Buffer Threshold Value
    // This field controls the number of entries (or above) in the
    // Receive FIFO that trigger the RX_THLD_STAT interrupt.
    _i3c_rx_buf_threshold_set(regs, DATA_BUF_THLD_RX_FIFO_1);

#endif

    // Transfer Start Threshold Value
    // In master mode of operation when the controller is set up to
    // initiate a write transfer, it waits until either one of the following
    // conditions are met before it initiates the write transfer on the
    // I3C Interface.
    // ? Data length (as specified in the command) number of
    // locations are filled in the Transmit FIFO
    // ? Threshold number of entries (or more) are available in the
    // Transmit FIFO
    // In slave mode of operation the slave controller ACK's a read
    // request from Master only if either one of the following
    // conditions are met:
    // ? Data length (as specified in the command) number of
    // locations are filled in the Transmit FIFO
    // ? Threshold number of entries (or more) are available in the
    // Transmit FIFO
    // The supported values
    _i3c_tx_start_threshold_set(regs, DATA_BUF_THLD_TX_FIFO_START_1);

    // Receive Start Threshold Value
    // In master mode of operation when the controller is set up to
    // initiate a read transfer, it waits until either one of the
    // conditions are met before it initiates the read transfer on the
    // I3C Interface.
    // ? Data length (as specified in the command) number of
    // locations are empty in the Receive FIFO.
    // ? Threshold number of locations (or more) are empty in the
    // Receive FIFO.
    // In the slave mode of operation the slave controller ACK's a
    // write request from Master only if threshold number of empty
    // locations(or more) are available in its receive buffer.
    _i3c_rx_start_threshold_set(regs, DATA_BUF_THLD_RX_FIFO_START_1);

    // Notify Rejected Slave Interrupt Request Control.
    // This bit is used to suppress reporting to the application about
    // SIR request rejected.
    // -? 0: Suppress passing the IBI Status to the IBI FIFO (hence
    // not notifying the application) when a Slave Interrupt
    // Request is NACKed and auto-disabled based on the
    // IBI_SIR_REQ_REJECT Register.
    // -? 1: Writes IBI Status to the IBI FIFO (hence notifying the
    // application) when a Slave Interrupt Request is NACKed
    // and auto-disabled
    _i3c_notify_sir_reject(regs, false);

    // Notify Rejected Master Request Control.
    // This bit is used to suppress reporting to the application about
    // Master request rejected.
    // -? 0: Suppress passing the IBI Status to the IBI FIFO (hence
    // not notifying the application) when a MR Request is
    // NACKed and auto-disabled based on the
    // IBI_MR_REQ_REJECT Register.
    // -? 1: Writes IBI Status to the IBI FIFO (hence notifying the
    // application) when a MR Request is NACKed and autodisabled
    // based on the IBI_MR_REQ_REJECT Register.
    _i3c_notify_mr_reject(regs, false);

    // Notify Rejected Hot-Join Control.
    // This bit is used to suppress reporting to the application about
    // Hot-Join request rejected (NACK and Auto Disable).
    // -? 0: Suppress passing the IBI Status to the IBI FIFO (hence
    // not notifying the application) when a HJ Request is
    // NACKed and auto-disabled based on the
    // DEVICE_CTRL.HOT_JOIN_CTRL.
    // -? 1: Writes IBI Status to the IBI FIFO (hence notifying the
    // application) when a HJ Request is NACKed and autodisabled
    // based on the
    // DEVICE_CTRL.HOT_JOIN_CTRL.
    _i3c_notify_hj_reject(regs, false);
}

/**
 * @brief Set Response Buffer Threshold to trigger interrupt
 *
 * @param regs Pointer to controller registers
 * @param threshold Threshold value
 */
void I3C_Thresholds_Response_buf_set(struct i3c_xec_regs *regs, uint8_t threshold)
{
    _i3c_resp_queue_threshold_set(regs, threshold);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void I3C_Host_Config(struct i3c_xec_regs *regs)
{
    _i3c_host_dma_tx_burst_length_set(regs, HOST_CFG_DMA_TX_BURST_LENGTH_4);

    _i3c_host_dma_rx_burst_length_set(regs, HOST_CFG_DMA_RX_BURST_LENGTH_4);

    _i3c_host_port_set(regs, HOST_CFG_PORT_SEL_I3C1);

    _i3c_host_stuck_sda_config(regs, HOST_CFG_STUCK_SDA_DISABLE, 0xFFFFU);

    _i3c_host_tx_dma_tout_config(regs, HOST_CFG_TX_DMA_TOUT_DISABLE, 0xFFFFU);

    _i3c_host_rx_dma_tout_config(regs, HOST_CFG_RX_DMA_TOUT_DISABLE, 0xFFFFU);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void I3C_Sec_Host_Config(struct i3c_xec_regs *regs)
{
    _i3c_sec_host_dma_tx_burst_length_set(regs, SEC_HOST_CFG_DMA_TX_BURST_LENGTH_4);
    
    _i3c_sec_host_dma_rx_burst_length_set(regs, SEC_HOST_CFG_DMA_RX_BURST_LENGTH_4);

#if (I3C_ENABLE_DMA)
    _i3c_sec_host_dma_fsm_enable(regs);
#endif            

    _i3c_sec_host_port_set(regs, SEC_HOST_CFG_PORT_SEL_I3C0);

    _i3c_sec_host_stuck_sda_scl_config(regs, SEC_HOST_CFG_STUCK_SDA_SCL_DISABLE, 0xFFFFU, 0xFFFFU);

    _i3c_sec_host_tx_dma_tout_config(regs, HOST_CFG_TX_DMA_TOUT_DISABLE, 0xFFFFU);

    _i3c_sec_host_rx_dma_tout_config(regs, HOST_CFG_RX_DMA_TOUT_DISABLE, 0xFFFFU);
}

/**
 * @brief configure timing for i3c transfers
 *
 * @param regs Pointer to controller registers
 */
void I3C_Soft_Reset(struct i3c_xec_regs *regs)
{
    _i3c_soft_reset(regs);
}

/**
 * @brief Retrieve Device Address Table Information
 *
 * @param regs Pointer to controller registers
 * @param start_addr Start Address of DAT
 * @param depth Depth of DAT
 */
void I3C_DAT_info_get(struct i3c_xec_regs *regs, uint16_t *start_addr, uint16_t *depth)
{
    _i3c_dev_addr_table_ptr_get(regs, start_addr, depth);
}

/**
 * @brief Retrieve Device Characteristic Table Information
 *
 * @param regs Pointer to controller registers
 * @param start_addr Start Address of DCT
 * @param depth Depth of DCT
 */
void I3C_DCT_info_get(struct i3c_xec_regs *regs, uint16_t *start_addr, uint16_t *depth)
{
    _i3c_dev_char_table_ptr_get(regs, start_addr, depth);
}

/**
 * @brief Check if the core is configured as a primary
 * or a secondary controller
 *
 * @param regs Pointer to controller registers
 */
bool I3C_Is_Current_Role_Primary(struct i3c_xec_regs *regs)
{
    if (_i3c_dev_role_config_get(regs) != I3C_ROLE_CFG_PRIM_CTRLR) {
        return false;
    }
    return true;
}

/**
 * @brief Check if the core is operating in controller
 * or target mode
 * (applicable only to secondary controller)
 *
 * @param regs Pointer to controller registers
 */
bool I3C_Is_Current_Role_Master(struct i3c_xec_regs *regs)
{
    if (((_i3c_dev_role_config_get(regs) == I3C_ROLE_CFG_SEC_CTRLR) &&
        (_i3c_dev_operation_mode_get(regs) != 0)) ||
        _i3c_dev_role_config_get(regs) == I3C_ROLE_CFG_TGT) {
        return false;
    }
    return true;
}

/**
 * @brief Check if the core is the current bus master
 * or not (applicable only to secondary controller)
 *
 * @param regs Pointer to controller registers
 */
bool I3C_Is_Current_Role_BusMaster(struct i3c_xec_regs *regs)
{
    if ((_i3c_dev_role_config_get(regs) == I3C_ROLE_CFG_SEC_CTRLR) &&
        (_i3c_dev_controller_role_get(regs) != 1U)) {
        return false;
    }
    return true;
}

/**
 * @brief Retrieve the depth of all queues
 *
 * @param regs Pointer to controller registers
 */
void I3C_queue_depths_get(struct i3c_xec_regs *regs,
                            uint8_t *tx_depth,
                            uint8_t *rx_depth,
                            uint8_t *cmd_depth,
                            uint8_t *resp_depth,
                            uint8_t *ibi_depth)
{
    *tx_depth = _i3c_tx_fifo_depth_get(regs);
    *rx_depth = _i3c_rx_fifo_depth_get(regs);
    *cmd_depth = _i3c_cmd_fifo_depth_get(regs);
    *resp_depth = _i3c_resp_fifo_depth_get(regs);
    *ibi_depth = _i3c_ibi_fifo_depth_get(regs);
}

/**
 * @brief Enables the I3C Controller
 *
 * @param regs Pointer to controller registers
 * @param address 7-bit dynamic address for controller or
 *                7-bit static address for target
 * @param config configuration flags
 */
void I3C_Enable(struct i3c_xec_regs *regs, uint8_t address, uint8_t config)
{
    uint8_t mode;
    bool enable_dma = false;
    
    mode = DEV_OPERATION_MODE_MASTER;

    if (sbit_MODE_TARGET & config) {
        mode = DEV_OPERATION_MODE_SLAVE;
        _i3c_static_addr_set(regs, address);
    } else {
        _i3c_dynamic_addr_set(regs, address);
    }

	if (sbit_HOTJOIN_DISABLE & config)  {
        if (sbit_MODE_TARGET & config) {
       		/* Disable Hot-Join */
	       _i3c_tgt_hot_join_disable(regs);	
		} else {
       /* Disable Hot-Join */
       _i3c_hot_join_disable(regs);
		}	
		}

    if (sbit_CONFG_ENABLE & config) {
        
        /* Set Operation Mode */
        _i3c_operation_mode_set(regs, mode);

        if (sbit_DMA_MODE & config) {
            enable_dma = true;
        }

        /* Enable the Controller */
        _i3c_enable(regs, mode, enable_dma);

        /* For the target mode of operation, we are not programming
         * the IDLE_CNT_MULTIPLIER and ADAPTIVE_I2C_I3C. Mostly likely
         * the default values should be fine; Revisit later if we need to update
         * them. Reference section 8.1.4 in user guide */

    }
    else {
        /* Disable the Controller */
        _i3c_disable(regs);
    }
}

/**
 * @brief Reads the DCT entry
 *
 * @param regs Pointer to controller registers
 * @param DCT_start Start address of DCT
 * @param DCT_idx Index for the DAT entry
 * @param address 7-bit dynamic address
 */
void I3C_DCT_read(struct i3c_xec_regs *regs, uint16_t DCT_start, uint16_t DCT_idx, struct i3c_DCT_info *info)
{
    _i3c_DCT_read(regs, DCT_start, DCT_idx, info);
}

/**
 * @brief Read the entries from SDCT and program DAT
 *
 * @param regs Pointer to controller registers
 * @param DCT_start Start address of DCT
 * @param targets_count Number of entries in the SDCT
 */
void I3C_TGT_DEFSLVS_DAT_write(struct i3c_xec_regs *regs, uint16_t DCT_start, uint16_t DAT_start, uint8_t targets_count)
{
    struct i3c_SDCT_info sdct_info;
    uint32_t val = 0;
    int i;

    for (i=0; i< targets_count; i++) {

        I3C_SDCT_read(regs, DCT_start, i, &sdct_info);

        val = DEV_ADDR_TABLE1_LOC1_DYNAMIC_ADDR(sdct_info.dynamic_addr);

        if (sdct_info.static_addr) {
            val |= DEV_ADDR_TABLE1_LOC1_STATIC_ADDR(sdct_info.static_addr);
        }

        _i3c_DAT_write(regs, DAT_start, i, val);
    }
}

/**
 * @brief Reads the Secondary DCT entry
 *
   _i3c_SDCT_read(regs, DCT_start, DCT_idx, info);
}* @param regs Pointer to controller registers
 * @param DCT_start Start address of DCT
 * @param DCT_idx Index for the DAT entry
 * @param address 7-bit dynamic address
 */
void I3C_SDCT_read(struct i3c_xec_regs *regs, uint16_t DCT_start, uint16_t idx, struct i3c_SDCT_info *info)
{
    _i3c_SDCT_read(regs, DCT_start, idx, info);
}

/**
 * @brief Writes the DAT entry with a dynamic address
 *
 * @param regs Pointer to controller registers
 * @param DAT_loc Start address of DAT
 * @param DAT_idx Index for the DAT entry
 * @param address 7-bit dynamic address
 */
void I3C_DAT_DynamicAddr_write(struct i3c_xec_regs *regs, uint16_t DAT_start, uint16_t DAT_idx, uint8_t address)
{
    uint32_t val;

    val = DEV_ADDR_TABLE1_LOC1_DYNAMIC_ADDR(address);

    _i3c_DAT_write(regs, DAT_start, DAT_idx, val);
}

/**
 * @brief Writes the DAT entry with a dynamic address for DAA
 *
 * @param regs Pointer to controller registers
 * @param DAT_loc Start address of DAT
 * @param DAT_idx Index for the DAT entry
 * @param address 7-bit dynamic address
 */
void I3C_DAT_DynamicAddrAssign_write(struct i3c_xec_regs *regs, uint16_t DAT_start, uint16_t DAT_idx, uint8_t address)
{
    uint32_t val;

    val = DEV_ADDR_TABLE1_LOC1_DYNAMIC_ADDR(address);

    /* Set the odd parity for the dynamic address */
    if (!__builtin_parity(address)) {
        val |= DEV_ADDR_TABLE1_LOC1_PARITY;
    }

    _i3c_DAT_write(regs, DAT_start, DAT_idx, val);
}

/**
 * @brief Starts the DAA process using ENTDAA
 *
 * @param regs Pointer to controller registers
 * @param tgt_idx Device index of the first device in DAT that needs DAA
 * @param tgts_count Number of devices (from tgt_idx) that needs DAA process
 * @param tid_xfer Tid used for the transfer
  */
void I3C_DO_DAA(struct i3c_xec_regs *regs, uint8_t tgt_idx, uint8_t tgts_count, uint8_t *tid_xfer)
{
    uint32_t command = 0;

    tid++; if (tid > 0) tid = 0; *tid_xfer = tid;

    command = (tid << COMMAND_AA_TID_BITPOS) |
            (tgt_idx << COMMAND_AA_DEV_IDX_BITPOS) |
            (I3C_CCC_ENTDAA << COMMAND_AA_CMD_BITPOS) |
            (tgts_count << COMMAND_AA_DEV_CNT_BITPOS) |
            COMMAND_STOP_ON_COMPLETION |
            COMMAND_RESPONSE_ON_COMPLETION |
            COMMAND_ATTR_ADDR_ASSGN_CMD;

    /* Set Response Buffer Threshold as 1 entry */
    _i3c_resp_queue_threshold_set(regs, 0);

    /* All required interrupts are already enabled? */

    /* Write the Command */
    _i3c_command_write(regs, command);
}

/**
 * @brief Sends the CCC on the I3C bus
 *
 * @param regs Pointer to controller registers
 * @param target Target that need to be sent CCC
 * @param tid_xfer Tid used for the transfer
  */
void I3C_DO_CCC(struct i3c_xec_regs *regs, struct i3c_DO_CCC *tgt, uint8_t *tid_xfer)
{
    uint32_t command = 0, argument = 0;

    argument = COMMAND_ATTR_XFER_ARG;
    argument |= (tgt->data_len << COMMAND_XFER_ARG_DATA_LEN_BITPOS);
    if (tgt->defining_byte_valid) {
        argument |= (tgt->defining_byte << COMMAND_XFER_DEF_BYTE_BITPOS);
    }

    tid++; if (tid > 0) tid = 0; *tid_xfer = tid;

    command = (tid << COMMAND_TID_BITPOS) |
            (tgt->tgt_idx << COMMAND_DEV_IDX_BITPOS) |
            (tgt->ccc_id << COMMAND_CMD_BITPOS) |
            COMMAND_STOP_ON_COMPLETION |
            COMMAND_RESPONSE_ON_COMPLETION |
            COMMAND_CMD_PRESENT |
            COMMAND_ATTR_XFER_CMD;
    /* Note:
     * Response Buffer Threshold is already set to 1 (in initialization)
     */

    if (tgt->defining_byte_valid) {
        command |= COMMAND_DEF_BYTE_PRESENT;
    }

    if (tgt->read) { //CCC Get

        command |= COMMAND_READ_XFER;

    } else { // CCC Set

        if (tgt->data_len) {

            /* fill the TX FIFO with the data
            * Note: We are not using Short Data Argument
            */
            _i3c_fifo_write(regs, tgt->data_buf, tgt->data_len);
        }

    }

    /* Set Response Buffer Threshold as 1 entry */
    _i3c_resp_queue_threshold_set(regs, 0);

    if (tgt->data_len || tgt->defining_byte_valid)
    {
        /* Write the transfer argument */
        _i3c_command_write(regs, argument);
    }

    /* All required interrupts are already enabled? */
    /* Write the Command */
    _i3c_command_write(regs, command);
}

/**
 * @brief Prepare for private transfer
 * This function will form the command and argument DS
 * and write data to the tx FIFO in case of private
 * write
 *
 * @param regs Pointer to controller registers
 * @param target Target that need to be sent CCC
 * @param tid_xfer Tid used for the transfer
  */
void I3C_DO_Xfer_Prep(struct i3c_xec_regs *regs, struct i3c_dw_cmd *cmd, uint8_t *tid_xfer)
{
    uint32_t command = 0, argument = 0;

    argument = (cmd->data_len << COMMAND_XFER_ARG_DATA_LEN_BITPOS) |
                COMMAND_ATTR_XFER_ARG;

    tid++; if (tid > 0) tid = 0; *tid_xfer = tid;

    command = (tid << COMMAND_TID_BITPOS) |
            (cmd->tgt_idx << COMMAND_DEV_IDX_BITPOS) |
            (cmd->xfer_speed << COMMAND_SPEED_BITPOS) |
            COMMAND_RESPONSE_ON_COMPLETION |
            COMMAND_ATTR_XFER_CMD;

    if(true == cmd->stop) {
        /* Send STOP */
        command |= COMMAND_STOP_ON_COMPLETION;
    } else {
        // Send REPEATED START
    }

    if(true == cmd->pec_en) {
        /* Calculate PEC */
        command |= COMMAND_PACKET_ERROR_CHECK;
    } else {
        /* Do not calculate PEC */
    }
    /* Note:
     * Response Buffer Threshold is already set to 1 (in initialization)
     */

    if (cmd->read) { // Read data
        
        command |= COMMAND_READ_XFER;
        
         if (XFER_SPEED_HDR_DDR == cmd->xfer_speed) {
            command |= (COMMAND_CMD_PRESENT | COMMAND_HDR_DDR_READ_BITPOS); 
         }
                    
#if I3C_ENABLE_THRESHOLDS_INTR
         if (cmd->rem_data_len) {
            _i3c_intr_thresholds_rx_enable(regs);
        }
#endif

    } else { // Write data

        /* fill the TX FIFO with the data
        * Note: We are not using Short Data Argument
        */

        if (XFER_SPEED_HDR_DDR == cmd->xfer_speed) {            
            command |= (COMMAND_CMD_PRESENT | COMMAND_HDR_DDR_WRITE_BITPOS);
        }
        
#if I3C_ENABLE_THRESHOLDS_INTR
        if (cmd->rem_data_len) {
            _i3c_fifo_write(regs, cmd->data_buf, cmd->data_len - cmd->rem_data_len);
            _i3c_intr_thresholds_tx_enable(regs);
        } else {
            _i3c_fifo_write(regs, cmd->data_buf, cmd->data_len);
        }
#elif  (!I3C_ENABLE_DMA)      
        _i3c_fifo_write(regs, cmd->data_buf, cmd->data_len);
#endif
    }
    
    cmd->cmd = command;
    cmd->arg = argument;
    
    LOG_DBG("[%s] - Command = 0x%08x", __FUNCTION__, command);
    LOG_DBG("[%s] - Argument = 0x%08x", __FUNCTION__, argument);
}

void I3C_DO_Xfer(struct i3c_xec_regs *regs, struct i3c_dw_cmd *tgt)
{
    /* Write the transfer argument */
    _i3c_command_write(regs, tgt->arg);

    _i3c_command_write(regs, tgt->cmd);
}

#if I3C_ENABLE_THRESHOLDS_INTR
void I3C_DO_TGT_Xfer(struct i3c_xec_regs *regs, uint8_t *data_buf, uint16_t data_len, uint16_t rem_data_len)
#else
void I3C_DO_TGT_Xfer(struct i3c_xec_regs *regs, uint8_t *data_buf, uint16_t data_len)
#endif
{
    uint32_t command = 0;

     tid++; if (tid > 0) tid = 0;

#if I3C_ENABLE_THRESHOLDS_INTR
        if (rem_data_len) {
            _i3c_fifo_write(regs, data_buf, data_len - rem_data_len);
            _i3c_intr_thresholds_tx_enable(regs);
        } else {
            _i3c_fifo_write(regs, data_buf, data_len);
        }
#elif (!I3C_ENABLE_DMA)        
        /* fill the TX FIFO with the data */
        _i3c_fifo_write(regs, data_buf, data_len);
#endif

    command = ((data_len << COMMAND_XFER_ARG_DATA_LEN_BITPOS) |
              (tid << COMMAND_TID_BITPOS));
    /*Note: Command Attribute is 0 - Transmit Command without IBI */

    /* Write the transfer command */
    _i3c_command_write(regs, command);

}

/**
 * @brief Enables the IBI SIR for the target
 *
 * @param regs Pointer to controller registers
 * @param ibi_sir_info Information required to enable IBI SIR on a target
  */
void I3C_IBI_SIR_Enable(struct i3c_xec_regs *regs, struct i3c_IBI_SIR *ibi_sir_info)
{
    uint32_t dat_value;

    /* Following sequence is for Controller only configuration
     * For secondary controller need to program 32-bit vector control
     * register (IBI_SIR_REQ_REJECT).
     * See section 2.6.3.3.1 1 in Databook
     */

    /* Get the Dat entry */
    dat_value = _i3c_DAT_read(regs, ibi_sir_info->DAT_start, ibi_sir_info->tgt_dat_idx);

    /* Enable IBI SIR */
    dat_value &= ~DEV_ADDR_TABLE1_LOC1_SIR_REJECT;

    if (ibi_sir_info->ibi_has_payload) {
        /* IBI with one or more mandatory bytes */
        dat_value |= DEV_ADDR_TABLE1_LOC1_IBI_WITH_DATA;
    }

    _i3c_DAT_write(regs, ibi_sir_info->DAT_start, ibi_sir_info->tgt_dat_idx, dat_value);

    if (0 == targets_ibi_enable_sts) {

        /* IBI Data and Status thresholds are already set in initialization */
        _i3c_intr_IBI_enable(regs);
    }

    targets_ibi_enable_sts |= (1 << ibi_sir_info->tgt_dat_idx);
}

/**
 * @brief Enables the IBI SIR for the target
 *
 * @param regs Pointer to controller registers
 * @param ibi_sir_info Information required to disable IBI SIR on a target
  */
void I3C_IBI_SIR_Disable(struct i3c_xec_regs *regs, struct i3c_IBI_SIR *ibi_sir_info)
{
    uint32_t dat_value;

    /* Get the Dat entry */
    dat_value = _i3c_DAT_read(regs, ibi_sir_info->DAT_start, ibi_sir_info->tgt_dat_idx);

    /* Disable IBI SIR */
    dat_value |= DEV_ADDR_TABLE1_LOC1_SIR_REJECT;

    _i3c_DAT_write(regs, ibi_sir_info->DAT_start, ibi_sir_info->tgt_dat_idx, dat_value);

    targets_ibi_enable_sts &= ~(1 << ibi_sir_info->tgt_dat_idx);

    if (0 == targets_ibi_enable_sts) {

        _i3c_intr_IBI_disable(regs);
    }
}

/**
 * @brief Set the MIPI PID value for target
 *
 * @param regs Pointer to controller registers
 * @param pid 48-bit PID value
 */
void I3C_TGT_PID_set(struct i3c_xec_regs *regs, uint64_t pid, bool pid_random)
{
    _i3c_tgt_pid_set(regs, SLV_MIPI_MFG_ID(pid), pid_random,
                            SLV_PART_ID(pid), SLV_INST_ID(pid),
                            SLV_PID_DCR(pid));
}

/**
 * @brief Check if the dynamic address is valid (in target mode)
 *
 * @param regs Pointer to controller registers
 */
bool I3C_TGT_is_dyn_addr_valid(struct i3c_xec_regs *regs)
{
    return _i3c_tgt_dyn_addr_valid_get(regs);
}

/**
 * @brief Get the dynamic address assinged (in target mode)
 *
 * @param regs Pointer to controller registers
 */
uint8_t I3C_TGT_dyn_addr_get(struct i3c_xec_regs *regs)
{
    return _i3c_tgt_dyn_addr_get(regs);;
}

/**
 * @brief Set the MWL value for target
 *
 * @param regs Pointer to controller registers
 * @param uint8_t wr_speed maximum write speed, refer enum mxds_max_wr_speed
 * @param uint8_t rd_speed maximum read speed, refer enum mxds_max_rd_speed
 * @param uint8_t tsco clock to data turnaround time, refer enum mxds_tsco
 */
void I3C_TGT_MXDS_set(struct i3c_xec_regs *regs,
                        uint8_t wr_speed,
                        uint8_t rd_speed,
                        uint8_t tsco,
                        uint32_t rd_trnd_us)
{
    _i3c_tgt_mxds_set(regs, wr_speed, rd_speed, tsco, rd_trnd_us);
}

/**
 * @brief Issues the IBI SIR for the target
 *
 * @param regs Pointer to controller registers
 * @param ibi_sir_info Information required to enable IBI SIR on a target
  */
int I3C_TGT_IBI_SIR_Raise(struct i3c_xec_regs *regs, struct i3c_raise_IBI_SIR *ibi_sir_request)
{
    uint8_t ret = 0;

    /* Ensure Controller has enabled SIR for the target (us) */
    if (_i3c_tgt_SIR_enabled(regs)) {

        /* Raise IBI SIR*/
        _i3c_tgt_raise_ibi_SIR(regs, ibi_sir_request->data_buf, ibi_sir_request->data_len, ibi_sir_request->mdb);

    } else {
        ret = 1;
    }

    return ret;
}

/**
 * @brief Issues the IBI Master Request for the target
 *
 * @param regs Pointer to controller registers
 */
int I3C_TGT_IBI_MR_Raise(struct i3c_xec_regs *regs)
{
    uint8_t ret = 0;

    /* Ensure Controller has enabled MR for the target (us) */
    if (_i3c_tgt_MR_enabled(regs)) {

        /* Raise IBI SIR*/
        _i3c_tgt_raise_ibi_MR(regs);

    } else {
        ret = 1;
    }

    return ret;
}

/**
 * @brief Handles Target Raise IBI SIR Residual data
 *
 * @param regs Pointer to controller registers
 */
void I3C_TGT_IBI_SIR_Residual_handle(struct i3c_xec_regs *regs)
{
    /* Clear SIR residual data by resettig TX Fifo */
    _i3c_tx_fifo_rst(regs);

    /* Hit Resume */
    _i3c_resume(regs);
}

/**
 * @brief Handles Target Raise IBI SIR Residual data
 *
 * @param regs Pointer to controller registers
 */
void I3C_TGT_Error_Recovery(struct i3c_xec_regs *regs, uint8_t err_sts)
{
     if ((err_sts == TARGET_RESP_ERR_CRC) ||
        (err_sts == TARGET_RESP_ERR_PARITY) ||
        (err_sts == TARGET_RESP_ERR_UNDERFLOW_OVERFLOW)) {

        /* Reset RX Fifo */
        _i3c_rx_fifo_rst(regs);

    } else {

         /* Reset TX FIFO and Command Queue */
         _i3c_tx_fifo_rst(regs);
         _i3c_cmd_queue_rst(regs);
    }
    /* Hit Resume */
    _i3c_resume(regs);
}

/**
 * @brief Handles switching of target to controller for role switch IBI
 *
 * @param regs Pointer to controller registers
 */
void I3C_TGT_RoleSwitch_Resume(struct i3c_xec_regs *regs)
{
    /* Reset TX and RX Fifos */
    _i3c_rx_fifo_rst(regs);
    _i3c_tx_fifo_rst(regs);

    /* Reset command queues */
    _i3c_cmd_queue_rst(regs);

    /* Hit Resume */
    _i3c_resume(regs);

}



/**
 * @brief Resumes the controller and clears transfer error
 *
 * @param regs Pointer to controller registers
 */
void I3C_Xfer_Error_Resume(struct i3c_xec_regs *regs)
{
    /* Hit Resume */
    _i3c_resume(regs);

    /* Clear transfer error status */
    _i3c_xfer_err_sts_clr(regs);
}

/**
 * @brief Resets the transfer fifos and queues
 *
 * @param regs Pointer to controller registers
 */
void I3C_Xfer_Reset(struct i3c_xec_regs *regs)
{
    /* Reset the TX/RX Fifos & Cmd/Res Queues */
    _i3c_xfers_reset(regs);
}

void I3C_CallbackRegister(uint32_t channel, I3C_CALLBACK callback, uintptr_t context)
{
    if(channel < I3C_MAX_CHAN)
    {
        I3CObj[channel].callback = callback;
        I3CObj[channel].context = context;
    }
}

void I3C_GRP_InterruptHandler(void)
{
    if (ECIA_GIRQResultGet(ECIA_AGG_INT_SRC_I3C0))
    {
        if(I3CObj[I3C_CHAN_0].callback != NULL)
        {
            I3CObj[I3C_CHAN_0].callback(I3CObj[I3C_CHAN_0].context);
        }
        ECIA_GIRQSourceClear(ECIA_AGG_INT_SRC_I3C0);
    }

    if (ECIA_GIRQResultGet(ECIA_AGG_INT_SRC_I3C1))
    {
        if(I3CObj[I3C_CHAN_1].callback != NULL)
        {
            I3CObj[I3C_CHAN_1].callback(I3CObj[I3C_CHAN_1].context);
        }
        ECIA_GIRQSourceClear(ECIA_AGG_INT_SRC_I3C1);
    }
}