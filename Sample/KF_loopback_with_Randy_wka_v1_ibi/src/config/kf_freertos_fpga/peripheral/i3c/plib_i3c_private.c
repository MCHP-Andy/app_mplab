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

#include <string.h>

#include "plib_i3c_private.h"
#include "zephyr/sys/util.h"

/**
 * @brief Get interrupt status
 *
 * @param regs Pointer to controller registers
 */
uint32_t _i3c_intr_sts_get(struct i3c_xec_regs *regs)
{
    return regs->intr_sts;
}

/**
 * @brief clear all interrupt status
 *
 * @param regs Pointer to controller registers
 */
void _i3c_intr_sts_clear(struct i3c_xec_regs *regs, uint32_t mask)
{
    regs->intr_sts = mask;
}

/**
 * @brief Enable interrupt status
 *
 * @param regs Pointer to controller registers
 */
void _i3c_intr_sts_enable(struct i3c_xec_regs *regs, uint32_t mask)
{
    regs->intr_sts_en = mask;
}

/**
 * @brief Enable IBI interrupt
 *
 * @param regs Pointer to controller registers
 */
void _i3c_intr_IBI_enable(struct i3c_xec_regs *regs)
{
    regs->intr_sts_en |= sbit_IBI_THLD_STS;

    regs->intr_sig_en |= sbit_IBI_THLD_STS;
}

/**
 * @brief Disable IBI interrupt
 *
 * @param regs Pointer to controller registers
 */
void _i3c_intr_IBI_disable(struct i3c_xec_regs *regs)
{
    regs->intr_sts_en &= ~sbit_IBI_THLD_STS;

    regs->intr_sig_en &= ~sbit_IBI_THLD_STS;
}

/**
 * @brief Enable the TX Threshold interrupt
 *
 * @param regs Pointer to controller registers
 */
void _i3c_intr_thresholds_tx_enable(struct i3c_xec_regs *regs)
{
    regs->intr_sts_en |= sbit_TX_THLD_STS;

    regs->intr_sig_en |= sbit_TX_THLD_STS;
}

/**
 * @brief Disable the TX Threshold interrupt
 *
 * @param regs Pointer to controller registers
 */
void _i3c_intr_thresholds_tx_disable(struct i3c_xec_regs *regs)
{
    regs->intr_sts_en &= ~sbit_TX_THLD_STS;

    regs->intr_sig_en &= ~sbit_TX_THLD_STS;
}

/**
 * @brief Enable the RX Threshold interrupt
 *
 * @param regs Pointer to controller registers
 */
void _i3c_intr_thresholds_rx_enable(struct i3c_xec_regs *regs)
{
    regs->intr_sts_en |= sbit_RX_THLD_STS;

    regs->intr_sig_en |= sbit_RX_THLD_STS;
}

/**
 * @brief Disable the RX Threshold interrupt
 *
 * @param regs Pointer to controller registers
 */
void _i3c_intr_thresholds_rx_disable(struct i3c_xec_regs *regs)
{
    regs->intr_sts_en &= ~sbit_RX_THLD_STS;

    regs->intr_sig_en &= ~sbit_RX_THLD_STS;
}

/**
 * @brief Enable interrupt signal
 *
 * @param regs Pointer to controller registers
 */
void _i3c_intr_sgnl_enable(struct i3c_xec_regs *regs, uint32_t mask)
{
    regs->intr_sig_en = mask;
}

/**
 * @brief Set Response Buffer Threshold to trigger interrupt
 *
 * @param regs Pointer to controller registers
 */
void _i3c_resp_queue_threshold_set(struct i3c_xec_regs *regs, uint8_t threshold)
{
    if (threshold < I3C_RESPONSE_BUFFER_DEPTH)
    {
        regs->queue_thld_ctrl &= ~(0xFF << QUEUE_THLD_RESP_QUEUE_BITPOS);
        regs->queue_thld_ctrl |= (threshold << QUEUE_THLD_RESP_QUEUE_BITPOS);
    }
}

/**
 * @brief Reads the Response Buffer Level Value
 *
 * @param regs Pointer to controller registers
 */
uint8_t _i3c_resp_buf_level_get(struct i3c_xec_regs *regs)
{
    volatile uint8_t level = 0;

    level = (regs->queue_sts_lvl >> Q_STS_LVL_RESP_BUFFER_BIT_POS) & 0xFF;

    return level;
}

/**
 * @brief Reads the IBI status count
 *
 * @param regs Pointer to controller registers
 */
uint8_t _i3c_ibi_status_count_get(struct i3c_xec_regs *regs)
{
    volatile uint8_t level = 0;

    level = (regs->queue_sts_lvl >> Q_STS_LVL_IBI_STS_CNT_BIT_POS) & 0x1F;

    return level;
}

/**
 * @brief Reads the IBI status queue
 *
 * @param regs Pointer to controller registers
 */
uint32_t _i3c_ibi_queue_status_get(struct i3c_xec_regs *regs)
{
    volatile uint32_t queue_sts = 0;

    queue_sts = regs->ibi_queue_sts_data;

    return queue_sts;
}

/**
 * @brief Reads the Response Buffer Level Value
 *
 * @param regs Pointer to controller registers
 */
uint8_t _i3c_response_sts_get(struct i3c_xec_regs *regs, uint16_t *len, uint8_t *tid)
{
    volatile uint32_t response = 0;
    uint8_t resp_sts;

    response = regs->resp_queue_port;

    *len = response & 0xFFFF;
    *tid = (response & RESPONSE_TID_BITMASK) >> RESPONSE_TID_BITPOS;

    resp_sts = (response & RESPONSE_ERR_STS_BITMASK) >> RESPONSE_ERR_STS_BITPOS;

    return resp_sts;
}

/**
 * @brief Reads the Response Buffer Level Value
 *
 * @param regs Pointer to controller registers
 */
uint8_t _i3c_tgt_response_sts_get(struct i3c_xec_regs *regs, uint16_t *len, uint8_t *tid, bool *rx_response)
{
    volatile uint32_t response = 0;
    uint8_t resp_sts, rx_rsp_bit;

    response = regs->resp_queue_port;

    *len = response & 0xFFFF;
    *tid = (response & RESPONSE_TID_TGT_BITMASK) >> RESPONSE_TID_BITPOS;

    resp_sts = (response & RESPONSE_ERR_STS_BITMASK) >> RESPONSE_ERR_STS_BITPOS;

    rx_rsp_bit = (response & RESPONSE_RX_RESP_BITMASK) >> RESPONSE_RX_RESP_BITPOS;

    if (rx_rsp_bit) {
        *rx_response = true;
    }

    return resp_sts;
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_cmd_queue_threshold_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->queue_thld_ctrl &= ~(0xFF << QUEUE_THLD_CMD_QUEUE_BITPOS);
    regs->queue_thld_ctrl |= (val << QUEUE_THLD_CMD_QUEUE_BITPOS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_ibi_data_threshold_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->queue_thld_ctrl &= ~(0xFF << QUEUE_THLD_IBI_DATA_BITPOS);
    regs->queue_thld_ctrl |= (val << QUEUE_THLD_IBI_DATA_BITPOS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_ibi_status_threshold_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->queue_thld_ctrl &= ~(0xFF << QUEUE_THLD_IBI_STATUS_BITPOS);
    regs->queue_thld_ctrl |= (val << QUEUE_THLD_IBI_STATUS_BITPOS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_tx_buf_threshold_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->data_buf_thld_ctrl &= ~(0xFF << DATA_BUF_THLD_TX_FIFO_EMPTY_BITPOS);
    regs->data_buf_thld_ctrl |= (val << DATA_BUF_THLD_TX_FIFO_EMPTY_BITPOS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_rx_buf_threshold_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->data_buf_thld_ctrl &= ~(0xFF << DATA_BUF_THLD_RX_FIFO_BITPOS);
    regs->data_buf_thld_ctrl |= (val << DATA_BUF_THLD_RX_FIFO_BITPOS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_tx_start_threshold_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->data_buf_thld_ctrl &= ~(0xFF << DATA_BUF_THLD_TX_FIFO_START_BITPOS);
    regs->data_buf_thld_ctrl |= (val << DATA_BUF_THLD_TX_FIFO_START_BITPOS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_rx_start_threshold_set(struct i3c_xec_regs *regs, uint32_t val)
{
     regs->data_buf_thld_ctrl &= ~(0xFF << DATA_BUF_THLD_RX_FIFO_START_BITPOS);
     regs->data_buf_thld_ctrl |= (val << DATA_BUF_THLD_RX_FIFO_START_BITPOS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_notify_sir_reject(struct i3c_xec_regs *regs, bool opt)
{
    regs->ibi_queue_ctrl = (opt << IBI_QUEUE_CTRL_SIR_REJ_BITPOS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_notify_mr_reject(struct i3c_xec_regs *regs, bool opt)
{
    regs->ibi_queue_ctrl = (opt << IBI_QUEUE_CTRL_MR_REJ_BITPOS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_notify_hj_reject(struct i3c_xec_regs *regs, bool opt)
{
    regs->ibi_queue_ctrl = (opt << IBI_QUEUE_CTRL_HJ_REJ_BITPOS);
}

/**
 * @brief Set the dynamic address of the controller
 *
 * @param regs Pointer to controller registers
 * @param address 7-bit dynamic address
 */
void _i3c_dynamic_addr_set(struct i3c_xec_regs *regs, uint8_t address)
{
    regs->dev_addr = ((address & 0x7F) << DEVICE_ADDR_DYNAMIC_ADDR_BITPOS) |
                     sbit_DEVICE_ADDR_DYNAMIC_ADDR_VALID;
}

/**
 * @brief Set the static address of the controller
 *
 * @param regs Pointer to controller registers
 * @param address 7-bit static address
 */
void _i3c_static_addr_set(struct i3c_xec_regs *regs, uint8_t address)
{
    volatile uint32_t reg_val;

    reg_val = regs->dev_addr;

    reg_val |= ((address & 0x7F) | sbit_DEVICE_ADDR_STATIC_ADDR_VALID);

    regs->dev_addr = reg_val;
}

/**
 * @brief Set the operation mode of the controller
 *
 * @param regs Pointer to controller registers
 * @param mode device mode - 0-Master, 1-Slave
 */
void _i3c_operation_mode_set(struct i3c_xec_regs *regs, uint8_t mode)
{
    regs->dev_ctrl_ext = mode & 0x1;
}

/**
 * @brief Set the Symbol time (in multiples of hdr_tx_clk) used when a device
 * is sending data in TSP/TSL mode. Used in slave mode of operation
 *
 * @param regs Pointer to controller registers
 * @param counts TSP/TSL Symbol count value
 */
void _i3c_slave_symbl_timing_set(struct i3c_xec_regs *regs, uint8_t counts)
{
    regs->slv_tsx_symbl_timing = counts & 0x3F;
}

/**
 * @brief Enable the controller
 *
 * @param regs Pointer to controller registers
 * @param mode device mode - 0-Master, 1-Slave
 */
void _i3c_enable(struct i3c_xec_regs *regs, uint8_t mode, bool enable_dma)
{
    uint32_t val;

    /* Read the control register */
    val = regs->dev_ctrl;

    val |= sbit_ENABLE;

    if (DEV_OPERATION_MODE_MASTER == mode)
    {
        /* I3C Broadcast Address is included for private transfers */
        val |= sbit_IBA_INCLUDE;
    }
    
    if (enable_dma) {
        val |= sbit_DMA_ENABLE;
    }
    
    regs->dev_ctrl = val;    
}

/**
 * @brief Disable the controller
 *
 * @param regs Pointer to controller registers
 */
void _i3c_disable(struct i3c_xec_regs *regs)
{
    volatile uint32_t val = 0;

    /* Read the control register */
    val = regs->dev_ctrl;

    val &= ~sbit_ENABLE;

    regs->dev_ctrl = val;
}

/**
 * @brief Resume the controller
 *
 * @param regs Pointer to controller registers
 */
void _i3c_resume(struct i3c_xec_regs *regs)
{
    regs->dev_ctrl |= sbit_RESUME;
}

/**
 * @brief Clears transfer error status in Interrupt Status
 *
 * @param regs Pointer to controller registers
 */
void _i3c_xfer_err_sts_clr(struct i3c_xec_regs *regs)
{
    volatile uint32_t sts = 0;

    sts = regs->intr_sts;

    if (sts & sbit_TRANSFER_ERR_STS) {
        /* W1C */
        regs->intr_sts = sbit_TRANSFER_ERR_STS;
    }
}

/**
 * @brief Disable hot join
 * used in master mode of operation
 *
 * @param regs Pointer to controller registers
 */
void _i3c_hot_join_disable(struct i3c_xec_regs *regs)
{
    volatile uint32_t val = 0;

    /* Read the control register */
    val = regs->dev_ctrl;

    /* sbit_HOT_JOIN_CTRL = 1 for NACK and send broadcast CCC
     * to disable Hot-join */
    val |= sbit_HOT_JOIN_CTRL;

    regs->dev_ctrl = val;
}

/**
 * @brief Disable hot join
 * used in slave mode of operation
 *
 * @param regs Pointer to secondary controller registers
 */
void _i3c_tgt_hot_join_disable(struct i3c_xec_regs *regs)
{
    volatile uint32_t val = 0;

    /* Read the slave event status register */
    val = regs->slave_evt_sts;

    val &= ~sbit_HJ_ENABLE;

    //regs->dev_ctrl = val;
    regs->slave_evt_sts = val;
}

/**
 * @brief Enable hot join
 * used in master mode of operation
 *
 * @param regs Pointer to controller registers
 */
void _i3c_hot_join_enable(struct i3c_xec_regs *regs)
{
    volatile uint32_t val = 0;

    /* Read the control register */
    val = regs->dev_ctrl;

    /* sbit_HOT_JOIN_CTRL = 0 ACK Hot-Join requests */
    val &= ~sbit_HOT_JOIN_CTRL;

    regs->dev_ctrl = val;
}

/**
 * @brief Program I2C Fast Mode Timing Register
 *
 * @param regs Pointer to controller registers
 * @param core_clk_freq_ns Core clock frequency in nanoseconds
 */
void _i2c_fm_timing_set(struct i3c_xec_regs *regs, uint32_t core_clk_freq_ns)
{
    uint16_t low_count, high_count;
    uint32_t timing_val;

    high_count = ceiling_fraction(I2C_FM_SCL_MIN_HIGH_PERIOD_NS, core_clk_freq_ns);
    if(high_count < I3C_SCL_TIMING_COUNT_MIN) {
        high_count = I3C_SCL_TIMING_COUNT_MIN;
    }

    low_count = ceiling_fraction(I2C_FM_SCL_MIN_LOW_PERIOD_NS, core_clk_freq_ns);
    if(low_count < I3C_SCL_TIMING_COUNT_MIN) {
        low_count = I3C_SCL_TIMING_COUNT_MIN;
    }

    /* Program the I3C Push Pull Timing Register */
    timing_val = (high_count << 16) | low_count;
    regs->scl_i2c_fm_timing = timing_val;

    /* This is a Mixed Bus system
     * Hence program the Bus Free Time (Master Mode) to tLOW of I2C Timing
     */
    regs->bus_free_avail_timing = low_count;
}

/**
 * @brief Program the I3C Bus Free Timing Register
 *
 * @param regs Pointer to controller registers
 * @param core_clk_freq_ns Core clock frequency in nanoseconds
 */
void _i3c_bus_free_timing_set(struct i3c_xec_regs *regs, uint32_t core_clk_freq_ns)
{
    uint16_t bus_free_timing_count;

    /* To review */
    bus_free_timing_count = ceiling_fraction(TGT_BUS_FREE_DURATION_ns, core_clk_freq_ns);
    if(bus_free_timing_count < I3C_SCL_TIMING_COUNT_MIN) {
        bus_free_timing_count = I3C_SCL_TIMING_COUNT_MIN;
    }

    regs->bus_free_avail_timing |= bus_free_timing_count;
}

/**
 * @brief Program the I3C Bus Free Timing Register
 *
 * @param regs Pointer to controller registers
 * @param core_clk_freq_ns Core clock frequency in nanoseconds
 */
void _i3c_bus_available_timing_set(struct i3c_xec_regs *regs, uint32_t core_clk_freq_ns)
{
    uint16_t bus_avail_timing_count;

    bus_avail_timing_count = ceiling_fraction(TGT_BUS_AVAIL_COND_ns, core_clk_freq_ns);
    if(bus_avail_timing_count < I3C_SCL_TIMING_COUNT_MIN) {
        bus_avail_timing_count = I3C_SCL_TIMING_COUNT_MIN;
    }

    regs->bus_free_avail_timing = (bus_avail_timing_count << 16);
}

/**
 * @brief Program the I3C Bus Free Timing Register
 *
 * @param regs Pointer to controller registers
 * @param core_clk_freq_ns Core clock frequency in nanoseconds
 */
void _i3c_bus_idle_timing_set(struct i3c_xec_regs *regs, uint32_t core_clk_freq_ns)
{
    uint16_t idle_count;

    idle_count = ceiling_fraction(TGT_BUS_IDLE_COND_ns, core_clk_freq_ns);
    if(idle_count < I3C_SCL_TIMING_COUNT_MIN) {
        idle_count = I3C_SCL_TIMING_COUNT_MIN;
    }

    regs->bus_idle_timing = idle_count;
}

/**
 * @brief Program the I3C SDA Hold Switch Timing Register
 *
 * @param regs Pointer to controller registers
 * @param core_clk_freq_ns Core clock frequency in nanoseconds
 */
void _i3c_sda_hld_switch_delay_timing_set(struct i3c_xec_regs *regs,
                                            uint8_t sda_od_pp_switch_dly,
                                            uint8_t sda_pp_od_switch_dly,
                                            uint8_t sda_tx_hold)
{
    regs->sda_hld_switch_dly_timing = (sda_od_pp_switch_dly << SDA_OD_PP_SWITCH_DLY_BITPOS);
    regs->sda_hld_switch_dly_timing |= (sda_pp_od_switch_dly << SDA_PP_OD_SWITCH_DLY_BITPOS);
    regs->sda_hld_switch_dly_timing |= (sda_tx_hold << SDA_TX_HOLD_BITPOS);
}

/**
 * @brief Program the I3C SCL Low Master Extended Timeout register
 *
 * @param regs Pointer to controller registers
 * @param core_clk_freq_ns Core clock frequency in nanoseconds
 */
void _i3c_scl_low_mst_tout_set(struct i3c_xec_regs *regs, uint32_t tout_val)
{
    regs->scl_low_mst_ext_timeout = tout_val;
}

/**
 * @brief Inform the core that I2C slaves are present on the bus
 *
 * @param regs Pointer to controller registers
 */
void _i2c_slave_present_set(struct i3c_xec_regs *regs)
{
    regs->dev_ctrl |= sbit_I2C_SLAVE_PRESENT;
}

/**
 * @brief Inform the core that I2C slaves are not present on the bus
 *
 * @param regs Pointer to controller registers
 */
void _i2c_slave_present_reset(struct i3c_xec_regs *regs)
{
    regs->dev_ctrl &= ~sbit_I2C_SLAVE_PRESENT;
}

/**
 * @brief Program I2C Fast Mode Plus Timing Register
 *
 * @param regs Pointer to controller registers
 * @param core_clk_freq_ns Core clock frequency in nanoseconds
 */
void _i2c_fmp_timing_set(struct i3c_xec_regs *regs, uint32_t core_clk_freq_ns)
{
    uint16_t low_count, high_count;
    uint32_t timing_val;

    high_count = ceiling_fraction(I2C_FMP_SCL_MIN_HIGH_PERIOD_NS, core_clk_freq_ns);
    if(high_count < I3C_SCL_TIMING_COUNT_MIN) {
        high_count = I3C_SCL_TIMING_COUNT_MIN;
    }

    low_count = ceiling_fraction(I2C_FMP_SCL_MIN_LOW_PERIOD_NS, core_clk_freq_ns);
    if(low_count < I3C_SCL_TIMING_COUNT_MIN) {
        low_count = I3C_SCL_TIMING_COUNT_MIN;
    }

    /* Program the I3C Push Pull Timing Register */
    timing_val = (high_count << 16) | low_count;
    regs->scl_i2c_fmp_timing = timing_val;
}

/**
 * @brief Program I3C Push Pull Timing Register
 *
 * @param regs Pointer to controller registers
 * @param core_clk_freq_ns Core clock frequency in nanoseconds
 */
void _i3c_push_pull_timing_set(struct i3c_xec_regs *regs, uint32_t core_clk_freq_ns)
{
    uint16_t low_count = 0, high_count = 0;
    uint32_t timing_val = 0, sdr_ext_lcount = 0;

    high_count = ceiling_fraction(I3C_PUSH_PULL_SCL_MIN_HIGH_PERIOD_NS, core_clk_freq_ns) - 1;
    if(high_count < I3C_SCL_TIMING_COUNT_MIN) {
        high_count = I3C_SCL_TIMING_COUNT_MIN;
    }

    low_count = ceiling_fraction(I3C_PUSH_PULL_SCL_MIN_LOW_PERIOD_NS, core_clk_freq_ns) - high_count;
    if(low_count < I3C_SCL_TIMING_COUNT_MIN) {
        low_count = I3C_SCL_TIMING_COUNT_MIN;
    }

    /* Program the I3C Push Pull Timing Register */
high_count = 0x30;
low_count = 0x30;
    timing_val = (high_count << 16) | low_count;
    regs->scl_i3c_pp_timing = timing_val;
//    regs->scl_i3c_pp_timing = 0x0006000C;

    /* If this is a PURE I3C bus
     * Program the Bus Free Time (Master Mode) to tCAS parameter
     */
    if (!(regs->dev_ctrl & sbit_I2C_SLAVE_PRESENT))
    {
        regs->bus_free_avail_timing = low_count;
    }

    sdr_ext_lcount = ceiling_fraction(I3C_BUS_SDR4_SCL_PERIOD_NS, core_clk_freq_ns) - high_count;
    sdr_ext_lcount = sdr_ext_lcount << 8;
    sdr_ext_lcount |= ceiling_fraction(I3C_BUS_SDR3_SCL_PERIOD_NS, core_clk_freq_ns) - high_count;
    sdr_ext_lcount = sdr_ext_lcount << 8;
    sdr_ext_lcount |= ceiling_fraction(I3C_BUS_SDR2_SCL_PERIOD_NS, core_clk_freq_ns) - high_count;
    sdr_ext_lcount = sdr_ext_lcount << 8;
    sdr_ext_lcount |= ceiling_fraction(I3C_BUS_SDR1_SCL_PERIOD_NS, core_clk_freq_ns) - high_count;
    sdr_ext_lcount = sdr_ext_lcount << 8;

    regs->scl_ext_lcnt_timing = sdr_ext_lcount;
//    regs->scl_ext_lcnt_timing = 0x100C0804;
}

/**
 * @brief Program I3C Open Drain Timing Register
 *
 * @param regs Pointer to controller registers
 * @param core_clk_freq_ns Core clock frequency in nanoseconds
 */
void _i3c_open_drain_timing_set(struct i3c_xec_regs *regs, uint32_t core_clk_freq_ns)
{
    uint16_t low_count, high_count;
    uint32_t timing_val;

    high_count = ceiling_fraction(I3C_OPEN_DRAIN_SCL_MIN_HIGH_PERIOD_NS, core_clk_freq_ns);
    if(high_count < I3C_SCL_TIMING_COUNT_MIN) {
        high_count = I3C_SCL_TIMING_COUNT_MIN;
    }
    low_count = ceiling_fraction(I3C_OPEN_DRAIN_SCL_MIN_LOW_PERIOD_NS, core_clk_freq_ns);
    if(low_count < I3C_SCL_TIMING_COUNT_MIN) {
        low_count = I3C_SCL_TIMING_COUNT_MIN;
    }
high_count = 0x30;
low_count = 0x30;
    /* Program the I3C Push Pull Timing Register */
    timing_val = (high_count << 16) | low_count;
    regs->scl_i3c_od_timing = timing_val;
//    regs->scl_i3c_od_timing = 0x000A0014;
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_host_dma_tx_burst_length_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->host_config &= ~(0x03 << HOST_CFG_DMA_TX_BURST_LENGTH_BIT_POS);
    regs->host_config |= (val << HOST_CFG_DMA_TX_BURST_LENGTH_BIT_POS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_host_dma_rx_burst_length_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->host_config &= ~(0x03 << HOST_CFG_DMA_RX_BURST_LENGTH_BIT_POS);
    regs->host_config |= (val << HOST_CFG_DMA_RX_BURST_LENGTH_BIT_POS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_host_port_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->host_config &= ~(0x0F << HOST_CFG_PORT_SEL_BIT_POS);
    regs->host_config |= (val << HOST_CFG_PORT_SEL_BIT_POS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_host_stuck_sda_config(struct i3c_xec_regs *regs, uint32_t en, uint32_t tout_val)
{
    regs->host_config &= ~(0x01 << HOST_CFG_STUCK_SDA_EN_BIT_POS);
    regs->host_config |= (en << HOST_CFG_STUCK_SDA_EN_BIT_POS);
    if(en) {
        regs->host_stuck_sda_timeout = tout_val;
    } else {
        regs->host_stuck_sda_timeout = 0U;
    }
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_host_tx_dma_tout_config(struct i3c_xec_regs *regs, uint32_t en, uint32_t tout_val)
{
    regs->host_config &= ~(0x01 << HOST_CFG_TX_DMA_TOUT_BITPOS);
    regs->host_config |= (en << HOST_CFG_TX_DMA_TOUT_BITPOS);
    if(en) {
        regs->host_dma_tx_timeout = tout_val;
    } else {
        regs->host_dma_tx_timeout = 0U;
    }
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_host_rx_dma_tout_config(struct i3c_xec_regs *regs, uint32_t en, uint32_t tout_val)
{
    regs->host_config &= ~(0x01 << HOST_CFG_TX_DMA_TOUT_BITPOS);
    regs->host_config |= (en << HOST_CFG_TX_DMA_TOUT_BITPOS);
    if(en) {
        regs->host_dma_rx_timeout = tout_val;
    } else {
        regs->host_dma_rx_timeout = 0U;
    }
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_sec_host_dma_tx_burst_length_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->sec_host_config0 &= ~(0x03 << SEC_HOST_CFG_DMA_TX_BURST_LENGTH_BIT_POS);
    regs->sec_host_config0 |= (val << SEC_HOST_CFG_DMA_TX_BURST_LENGTH_BIT_POS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_sec_host_dma_rx_burst_length_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->sec_host_config0 &= ~(0x03 << SEC_HOST_CFG_DMA_RX_BURST_LENGTH_BIT_POS);
    regs->sec_host_config0 |= (val << SEC_HOST_CFG_DMA_RX_BURST_LENGTH_BIT_POS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_sec_host_port_set(struct i3c_xec_regs *regs, uint32_t val)
{
    regs->sec_host_config0 &= ~(0x0F << SEC_HOST_CFG_PORT_SEL_BIT_POS);
    regs->sec_host_config0 |= (val << SEC_HOST_CFG_PORT_SEL_BIT_POS);
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_sec_host_stuck_sda_scl_config(struct i3c_xec_regs *regs, uint32_t en, uint32_t sda_tout_val, uint32_t scl_tout_val)
{
    regs->sec_host_config0 &= ~(0x01 << SEC_HOST_CFG_STUCK_SDA_EN_BIT_POS);
    regs->sec_host_config0 |= (en << SEC_HOST_CFG_STUCK_SDA_EN_BIT_POS);
    if(en) {
        regs->sec_host_stuck_sda_timeout = ((sda_tout_val & GENMASK(9 , 0)) << SEC_HOST_CFG_STUCK_SDA_TOUT_BITPOS);
        regs->sec_host_stuck_sda_timeout = ((scl_tout_val & GENMASK(9 , 0)) << SEC_HOST_CFG_STUCK_SCL_TOUT_BITPOS);
    } else {
        regs->sec_host_stuck_sda_timeout = 0U;
    }
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_sec_host_tx_dma_tout_config(struct i3c_xec_regs *regs, uint32_t en, uint32_t tout_val)
{
    //regs->sec_host_config0 &= ~(0x01 << SEC_HOST_CFG_TX_DMA_TOUT_BITPOS);
    //regs->sec_host_config0 |= (en << SEC_HOST_CFG_TX_DMA_TOUT_BITPOS);
    if(en) {
        regs->sec_host_dma_tx_timeout = tout_val;
    } else {
        regs->sec_host_dma_tx_timeout = 0U;
    }
}

/**
 * @brief
 *
 * @param regs Pointer to controller registers
 */
void _i3c_sec_host_rx_dma_tout_config(struct i3c_xec_regs *regs, uint32_t en, uint32_t tout_val)
{
    //regs->sec_host_config0 &= ~(0x01 << SEC_HOST_CFG_RX_DMA_TOUT_BITPOS);
    //regs->sec_host_config0 |= (en << SEC_HOST_CFG_RX_DMA_TOUT_BITPOS);
    if(en) {
        regs->sec_host_dma_rx_timeout = tout_val;
    } else {
        regs->sec_host_dma_rx_timeout = 0U;
    }
}

/**
 * @brief 
 *
 * @param regs Pointer to controller registers
 */
void _i3c_sec_host_dma_fsm_enable(struct i3c_xec_regs *regs)
{
    uint32_t bitmask;
    
    bitmask = (SEC_HOST_CFG_TX_DMA_FSM_ENABLE << SEC_HOST_CFG_TX_DMA_FSM_BITPOS) | \
              (SEC_HOST_CFG_RX_DMA_FSM_ENABLE << SEC_HOST_CFG_RX_DMA_FSM_BITPOS);
    
    regs->sec_host_config0 |= bitmask;
}

/**
 * @brief Read the Device Address Table Pointer Register
 *
 * @param regs Pointer to controller registers
 * @param start_addr return the start address of device address table
 * @param depth return the depth of device address table
 */
void _i3c_dev_addr_table_ptr_get(struct i3c_xec_regs *regs, uint16_t *start_addr, uint16_t *depth)
{
    uint32_t val;

    val = regs->dev_addr_tbl_ptr;

    *start_addr = val & 0xFFFF;
    *depth = (val >> 16) & 0xFFFF;
}

/**
 * @brief Read the Device Characteristics Table Pointer Register
 *
 * @param regs Pointer to controller registers
 * @param start_addr return the start address of device characteristics table
 * @param depth return the depth of device characteristics table
 */
void _i3c_dev_char_table_ptr_get(struct i3c_xec_regs *regs, uint16_t *start_addr, uint16_t *depth)
{
    uint32_t val;

    val = regs->dev_char_tbl_ptr;

    *start_addr = val & 0xFFF; /* Bits 0 to 11 */
    *depth = (val >> 12) & 0x7F; /* Bits 12 to 18 */
}

/**
 * @brief Retrieve the current operation of the the device
 *
 * @param regs Pointer to controller registers
 */
uint8_t _i3c_dev_operation_mode_get(struct i3c_xec_regs *regs)
{
    return (uint8_t)(regs->dev_ctrl_ext & 0x03U);
}

/**
 * @brief Retrieve the current operation mode of the controller
 * (active or secondary)
 *
 * @param regs Pointer to controller registers
 */
uint8_t _i3c_dev_controller_role_get(struct i3c_xec_regs *regs)
{
    return (uint8_t)(regs->present_state & 0x04U);
}

/**
 * @brief Retrieve the HW configured role of the core
 * (master only or secondary master or slave only)
 *
 * @param regs Pointer to controller registers
 */
uint8_t _i3c_dev_role_config_get(struct i3c_xec_regs *regs)
{
    return (uint8_t)(regs->hw_capability & 0x07U);
}

/**
 * @brief Writes the DAT entry
 *
 * @param regs Pointer to controller registers
 * @param DAT_start Start location of DAT
 * @param DAT_idx Position in the Device Address table
 * @param val 32-bit value to program
 */
void _i3c_DAT_write(struct i3c_xec_regs *regs, uint16_t DAT_start, uint8_t DAT_idx, uint32_t val)
{
     uint32_t *entry_addr;

     entry_addr = (uint32_t *)((uint32_t)regs + (DAT_start +  (DAT_idx*4)));

     *entry_addr = val;
}

/**
 * @brief Reads the DAT entry
 *
 * @param regs Pointer to controller registers
 * @param DAT_start Start location of DAT
 * @param DAT_idx Position in the Device Address table
 * @return val 32-bit DAT value
 */
uint32_t _i3c_DAT_read(struct i3c_xec_regs *regs, uint16_t DAT_start, uint8_t DAT_idx)
{
     uint32_t *entry_addr;
     uint32_t val;

     entry_addr = (uint32_t *)((uint32_t)regs + (DAT_start +  (DAT_idx*4)));

     val = *entry_addr;

     return val;
}

/**
 * @brief Read the DCT
 *
 * @param regs Pointer to controller registers
 * @param DAT_start Start location of DCT
 * @param DAT_idx Position in the Device Characteristics table
 * @param info DCT information read
 */
void _i3c_DCT_read(struct i3c_xec_regs *regs, uint16_t DCT_start, uint8_t DCT_idx, struct i3c_DCT_info *info)
{
     uint32_t *entry_addr;
     uint64_t prov_id = 0;

     entry_addr = (uint32_t *)((uint32_t)regs + (DCT_start +  (DCT_idx*4*4)));

     prov_id = *entry_addr;

     entry_addr++;
     info->pid = (prov_id << 16) | (*entry_addr & 0xFFFF);

     entry_addr++;
     info->dcr = *entry_addr & 0xFF;
     info->bcr = (*entry_addr >> 8) & 0xFF;

     entry_addr++;
     info->dynamic_addr = *entry_addr & 0x7F;
}

/**
 * @brief Read the Secondary DCT
 *
 * @param regs Pointer to controller registers
 * @param DAT_start Start location of DCT
 * @param DAT_idx Position in the Device Characteristics table
 * @param info SDCT information read
 */
void _i3c_SDCT_read(struct i3c_xec_regs *regs, uint16_t DCT_start, uint8_t idx, struct i3c_SDCT_info *info)
{
     uint32_t *entry_addr;
     uint32_t sdct_val = 0;

     entry_addr = (uint32_t *)((uint32_t)regs + (DCT_start +  (idx*4)));

     sdct_val = *entry_addr;

     info->dynamic_addr = sdct_val & 0xFF;
     info->dcr = (sdct_val >> 8) & 0xFF;
     info->bcr = (sdct_val >> 16) & 0xFF;
     info->static_addr = (sdct_val >> 24) & 0xFF;
}

/**
 * @brief Write the FIFO with data
 *
 * @param regs Pointer to controller registers
 * @param buffer  buffer with data
 * @param len Length of data in the buffer
 */
void _i3c_fifo_write(struct i3c_xec_regs *regs, uint8_t *buffer, uint16_t len)
{
    uint32_t *dword_ptr;
    uint32_t last_dword = 0;
    uint16_t i, remaining_bytes;

    if (len >= 4) {

        dword_ptr = (uint32_t *)buffer;

        for (i = 0; i < len / 4; i++) {
            regs->rx_tx_port = dword_ptr[i];
        }
    }

    remaining_bytes = len % 4;

    if (remaining_bytes) {
        memcpy(&last_dword, buffer + (len & ~0x3), remaining_bytes);
        regs->rx_tx_port = last_dword;
    }
}

/**
 * @brief Read from FIFO
 *
 * @param regs Pointer to controller registers
 * @param buffer  buffer to copy data
 * @param len Length of data to read
 */
void _i3c_fifo_read(struct i3c_xec_regs *regs, uint8_t *buffer, uint16_t len)
{
    uint32_t *dword_ptr;
    uint32_t last_dword = 0;
    uint16_t i =0, remaining_bytes = 0;

    if (len >= 4) {

        dword_ptr = (uint32_t *)buffer;

        for (i = 0; i < len / 4; i++) {
            dword_ptr[i] = regs->rx_tx_port;
        }
    }

    remaining_bytes = len % 4;

    if (remaining_bytes) {
        last_dword = regs->rx_tx_port;
        memcpy(buffer + (len & ~0x3), &last_dword, remaining_bytes);
    }
}

/**
 * @brief Read from IBI Queue
 *
 * @param regs Pointer to controller registers
 * @param buffer  buffer to copy data
 * @param len Length of data to read
 */
void _i3c_ibi_data_read(struct i3c_xec_regs *regs, uint8_t *buffer, uint16_t len)
{
    uint32_t *dword_ptr;
    uint32_t last_dword = 0;
    uint16_t i =0, remaining_bytes = 0;
    volatile uint32_t drain_dword;
    bool drain_flag = false;

    if (NULL == buffer) {
        drain_flag = true;
    }

    if (len >= 4) {

        if (drain_flag) {
            for (i = 0; i < len / 4; i++) {
                drain_dword = regs->ibi_queue_sts_data;
            }
        } else {
            dword_ptr = (uint32_t *)buffer;

            for (i = 0; i < len / 4; i++) {
                dword_ptr[i] = regs->ibi_queue_sts_data;
            }
        }
    }

    remaining_bytes = len % 4;

    if (remaining_bytes) {
        last_dword = regs->ibi_queue_sts_data;
        if (!drain_flag) {
            memcpy(buffer + (len & ~0x3), &last_dword, remaining_bytes);
        }
    }
}

/**
 * @brief Reset all transfers
 *
 * @param regs Pointer to controller registers
 */
void _i3c_xfers_reset(struct i3c_xec_regs *regs)
{
    volatile uint32_t reg_val = 1;

    regs->reset_ctrl = RESET_CTRL_RX_FIFO_RST | RESET_CTRL_TX_FIFO_RST |
                        RESET_CTRL_RES_Q_RST | RESET_CTRL_CMD_Q_RST;

    while (reg_val) {
        reg_val = regs->reset_ctrl;
        /* TODO: Add delay for each iteration and overall timeout to break */
    }
}

/**
 * @brief clears residual data by flushing transmit fifo
 *
 * @param regs Pointer to controller registers
 */
void _i3c_tx_fifo_rst(struct i3c_xec_regs *regs)
{
    regs->reset_ctrl = RESET_CTRL_TX_FIFO_RST;
}

/**
 * @brief resets RX Fifo
 *
 * @param regs Pointer to controller registers
 */
void _i3c_rx_fifo_rst(struct i3c_xec_regs *regs)
{
    regs->reset_ctrl = RESET_CTRL_RX_FIFO_RST;
}

/**
 * @brief Resets Command Queue
 *
 * @param regs Pointer to controller registers
 */
void _i3c_cmd_queue_rst(struct i3c_xec_regs *regs)
{
    regs->reset_ctrl = RESET_CTRL_CMD_Q_RST;
}

/**
 * @brief I3C core software reset
 *
 * @param regs Pointer to controller registers
 */
void _i3c_soft_reset(struct i3c_xec_regs *regs)
{
    volatile uint32_t reg_val = 1;

    regs->reset_ctrl = RESET_CTRL_SOFT_RST;

    while (reg_val & RESET_CTRL_SOFT_RST) {
        reg_val = regs->reset_ctrl;
        /* TODO: Add delay for each iteration and overall timeout to break */
    }
}
/**
 * @brief Write the command in the Command Queue Port
 *
 * @param regs Pointer to controller registers
 * @param cmd  The Command
  */
void _i3c_command_write(struct i3c_xec_regs *regs, uint32_t cmd)
{
    regs->cmd_queue_port = cmd;
}

/**
 * @brief Retrieve the depth of the TX FIFO
 * in bytes
 */
uint8_t _i3c_tx_fifo_depth_get(struct i3c_xec_regs *regs)
{
    return ((FIFO_DEPTH_MIN_DWORD << ((regs->queue_size_capability & GENMASK(3, 0)) >> Q_CAP_TX_FIFO_DEPTH_BITPOS)) * 4);
}

/**
 * @brief Retrieve the depth of the RX FIFO
 * in bytes
 */
uint8_t _i3c_rx_fifo_depth_get(struct i3c_xec_regs *regs)
{
    return ((FIFO_DEPTH_MIN_DWORD << ((regs->queue_size_capability & GENMASK(7, 4)) >> Q_CAP_RX_FIFO_DEPTH_BITPOS)) * 4);
}

/**
 * @brief Retrieve the depth of the command FIFO
 * in bytes
 */
uint8_t _i3c_cmd_fifo_depth_get(struct i3c_xec_regs *regs)
{
    return (FIFO_DEPTH_MIN_DWORD << ((regs->queue_size_capability & GENMASK(11, 8)) >> Q_CAP_CMD_FIFO_DEPTH_BITPOS));
}

/**
 * @brief Retrieve the depth of the response FIFO
 * in bytes
 */
uint8_t _i3c_resp_fifo_depth_get(struct i3c_xec_regs *regs)
{
    return (FIFO_DEPTH_MIN_DWORD << ((regs->queue_size_capability & GENMASK(15, 12)) >> Q_CAP_RESP_FIFO_DEPTH_BITPOS));
}

/**
 * @brief Retrieve the depth of the IBI FIFO
 * in bytes
 */
uint8_t _i3c_ibi_fifo_depth_get(struct i3c_xec_regs *regs)
{
    return (FIFO_DEPTH_MIN_DWORD << ((regs->queue_size_capability & GENMASK(19, 16)) >> Q_CAP_IBI_FIFO_DEPTH_BITPOS));
}

/**
 * @brief Set the PID of secondary controller (in target mode)
 */
void _i3c_tgt_pid_set(struct i3c_xec_regs *regs,
                        uint16_t slv_mipi_mfg_id,
                        bool is_random_prov_id,
                        uint16_t slv_part_id,
                        uint8_t slv_inst_id,
                        uint16_t slv_pid_dcr)
{
    regs->slv_mipi_id_val = (slv_mipi_mfg_id << SLV_MIPI_MFG_ID_BITPOS);

    if(false == is_random_prov_id) {
        regs->slv_pid_val = (slv_part_id << SLV_PART_ID_BITPOS) |
                            (slv_inst_id << SLV_INST_ID_BITPOS) |
                            (slv_pid_dcr << SLV_PID_DCR_BITPOS);
    }
}

/**
 * @brief Get the Dynamic address valid bit
 * of secondary controller (in target mode)
 */
bool _i3c_tgt_dyn_addr_valid_get(struct i3c_xec_regs *regs)
{
    return (bool)(regs->dev_addr & sbit_DEVICE_ADDR_DYNAMIC_ADDR_VALID);
}

/**
 * @brief Get the Dynamic address
 * of secondary controller (in target mode)
 */
uint8_t _i3c_tgt_dyn_addr_get(struct i3c_xec_regs *regs)
{
    return (uint8_t)((regs->dev_addr & GENMASK(22, 16)) >> DEVICE_ADDR_DYNAMIC_ADDR_BITPOS);
}

/**
 * @brief Set the MRL of secondary controller (in target mode)
 */
void _i3c_tgt_mrl_set(struct i3c_xec_regs *regs, uint16_t mrl)
{
    regs->slv_max_len = (regs->slv_max_len & ~(GENMASK(31, 16))) | (mrl << MRL_BITPOS);
}

/**
 * @brief Set the MWL of secondary controller (in target mode)
 */
void _i3c_tgt_mwl_set(struct i3c_xec_regs *regs, uint16_t mwl)
{
    regs->slv_max_len = (regs->slv_max_len & ~(GENMASK(15, 0))) | (mwl << MWL_BITPOS);
}

/**
 * @brief Set the MXDS value of secondary controller (in target mode)
 */
void _i3c_tgt_mxds_set(struct i3c_xec_regs *regs,
                        uint8_t wr_speed,
                        uint8_t rd_speed,
                        uint8_t tsco,
                        uint32_t rd_trnd_us)
{
    regs->max_data_speed = (wr_speed << MXDS_MAX_WR_SPEED_BITPOS) |
                            (rd_speed << MXDS_MAX_RD_SPEED_BITPOS) |
                            (tsco << MXDS_TSCO_BITPOS);
    regs->max_rd_turnaround = MXDS_MAX_RD_TURN_MASK(rd_trnd_us);
}

/**
 * @brief Check if SIR is enabled by the controller
 */
bool _i3c_tgt_SIR_enabled(struct i3c_xec_regs *regs)
{
    bool ret = false;
    if (regs->slave_evt_sts & SLAVE_EVT_STS_SIR_EN) {
        ret = true;
    }

    return ret;
}

/**
 * @brief Check if SIR is enabled by the controller
 */
bool _i3c_tgt_MR_enabled(struct i3c_xec_regs *regs)
{
    bool ret = false;
    if (regs->slave_evt_sts & SLAVE_EVT_STS_MIR_EN) {
        ret = true;
    }

    return ret;
}

/**
 * @brief Raise IBI Slave Interrupt Request (SIR)
 */
void _i3c_tgt_raise_ibi_SIR(struct i3c_xec_regs *regs, uint8_t *sir_data, uint8_t sir_datalen, uint8_t mdb)
{
    uint32_t sir_data_dword = 0;

    regs->slv_intr_req = (mdb << SLAVE_INTR_REQ_MDB_BITPOS) |
                        (sir_datalen << SLAVE_INTR_REQ_SIR_DATALEN_BITPOS);

    if (sir_datalen ) {
        for (int i = 0; i < sir_datalen; i++) {
            sir_data_dword <<= 8;
            sir_data_dword |= sir_data[i];
        }
        regs->slv_intr_req_data = sir_data_dword;
    }
    regs->slv_intr_req |= SLAVE_INTR_REQ_SIR;
}

/**
 * @brief Raise IBI Master Request (MR)
 */
void _i3c_tgt_raise_ibi_MR(struct i3c_xec_regs *regs)
{
    regs->slv_intr_req = SLAVE_INTR_REQ_MR;

    /* Enable ACK for GETACCMST CCC from master */
    regs->dev_ctrl_ext &= ~(DEV_REQMST_ACK_CTRL_NACK);
}

/**
 * @brief Retrieve the IBI response from IBI Response register
 */
bool _i3c_tgt_ibi_resp_get(struct i3c_xec_regs *regs, uint8_t *sir_rem_datalen)
{
    bool ret = false;
    /* Databook mentions SIR RESP DATA LENGTH as bits 8 t0 23, but we are using only
     * 8 bits because IBI Datalen is not supposed to be more than 4
     */
    *sir_rem_datalen = (regs->slv_ibi_resp >>  SLAVE_IBI_RESP_DATALEN_BITPOS) & 0xFF;

    if (SLAVE_IBI_RESP_SUCCESS == (regs->slv_ibi_resp & 0x3)) {
            ret = true;
    }

    return ret;
}

/**
 * @brief Retrieve target max read length
 */
void _i3c_tgt_MRL_get(struct i3c_xec_regs *regs, uint16_t *max_rd_len)
{
    *max_rd_len = regs->slv_max_len >> 16;
}

/**
 * @brief Retrieve target max write length
 */
void _i3c_tgt_MWL_get(struct i3c_xec_regs *regs, uint16_t *max_wr_len)
{
    *max_wr_len = regs->slv_max_len & 0xFFFF;
}

/**
 * @brief Set target max read and write length
 */
void _i3c_tgt_MRL_MWL_set(struct i3c_xec_regs *regs, uint16_t max_rd_len, uint16_t max_wr_len)
{
    regs->slv_max_len  = (max_rd_len << 16) | max_wr_len;
}

/**
 * @brief Returns true if controller updated MRL
 */
bool _i3c_tgt_MRL_updated(struct i3c_xec_regs *regs)
{
    bool ret = false;

    if (regs->slave_evt_sts & SLAVE_EVT_STS_MRL_UPDATED)    {
        ret = true;
        /* Write 1 to clear */
        regs->slave_evt_sts = SLAVE_EVT_STS_MRL_UPDATED;
    }

    return ret;
}

/**
 * @brief Returns true if controller updated MWL
 */
bool _i3c_tgt_MWL_updated(struct i3c_xec_regs *regs)
{
    bool ret = false;

    if (regs->slave_evt_sts & SLAVE_EVT_STS_MWL_UPDATED)    {
        ret = true;
        /* Write 1 to clear */
        regs->slave_evt_sts = SLAVE_EVT_STS_MWL_UPDATED;
    }

    return ret;
}

/**
 * @brief Set target max read and write speed
 */
void _i3c_tgt_max_speed_update(struct i3c_xec_regs *regs, uint8_t max_rd_speed, uint8_t max_wr_speed)
{
    regs->max_data_speed &= ~(TGT_MAX_WR_DATA_SPEED_MASK << TGT_MAX_WR_DATA_SPEED_POS);
    regs->max_data_speed &= ~(TGT_MAX_RD_DATA_SPEED_MASK << TGT_MAX_RD_DATA_SPEED_POS);

    regs->max_data_speed |= (max_wr_speed << TGT_MAX_WR_DATA_SPEED_POS);
    regs->max_data_speed |= (max_rd_speed << TGT_MAX_RD_DATA_SPEED_POS);
}

/**
 * @brief Set target max read and write speed
 */
void _i3c_tgt_clk_to_data_turn_update(struct i3c_xec_regs *regs, uint8_t clk_data_turn_time)
{
    regs->max_data_speed &= ~(TGT_CLK_TO_DATA_TURN_MASK << TGT_CLK_TO_DATA_TURN_POS);

    regs->max_data_speed |= (clk_data_turn_time << TGT_CLK_TO_DATA_TURN_POS);
}
