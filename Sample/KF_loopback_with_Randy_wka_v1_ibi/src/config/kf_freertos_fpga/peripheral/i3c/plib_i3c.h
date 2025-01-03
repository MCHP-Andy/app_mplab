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

#ifndef _INCLUDE_PLIB_I3C_H_
#define _INCLUDE_PLIB_I3C_H_

#include "osal/osal_freertos.h"
#include "plib_i3c_private.h"

#define MAX_I3C_MSGS                    32U
#define I3C_HOT_JOIN_ADDR               0x2U
#define IBI_QUEUE_STATUS_IBI_ID(x)      (((x) & GENMASK(15, 8)) >> 8U)
#define IBI_QUEUE_STATUS_DATA_LEN(x)    ((x) & GENMASK(7, 0))
#define IBI_QUEUE_IBI_ADDR(x)           (IBI_QUEUE_STATUS_IBI_ID(x) >> 1U)
#define IBI_QUEUE_IBI_RNW(x)            (IBI_QUEUE_STATUS_IBI_ID(x) & BIT(0))
#define IBI_TYPE_MR(x)                                                         \
    ((IBI_QUEUE_IBI_ADDR(x) != I3C_HOT_JOIN_ADDR) && !IBI_QUEUE_IBI_RNW(x))
#define IBI_TYPE_HJ(x)                                                         \
    ((IBI_QUEUE_IBI_ADDR(x) == I3C_HOT_JOIN_ADDR) && !IBI_QUEUE_IBI_RNW(x))
#define IBI_TYPE_SIRQ(x)                                                        \
    ((IBI_QUEUE_IBI_ADDR(x) != I3C_HOT_JOIN_ADDR) && IBI_QUEUE_IBI_RNW(x))

#define RESPONSE_NO_ERROR               0U
#define RESPONSE_ERROR_CRC              1U
#define RESPONSE_ERROR_PARITY           2U
#define RESPONSE_ERROR_FRAME            3U
#define RESPONSE_ERROR_IBA_NACK         4U
#define RESPONSE_ERROR_ADDRESS_NACK     5U
#define RESPONSE_ERROR_OVER_UNDER_FLOW  6U
#define RESPONSE_ERROR_TRANSF_ABORT     8U
#define RESPONSE_ERROR_I2C_W_NACK_ERR   9U

#define SLV_MIPI_MFG_ID(x)              ((x & GENMASK64(47, 33)) >> 33U)
#define SLV_PROV_ID_SEL(x)              ((x & GENMASK64(32, 32)) >> 32U)

#define SLV_PART_ID(x)                  ((x & GENMASK64(31, 16)) >> 16U)
#define SLV_INST_ID(x)                  ((x & GENMASK64(15, 12)) >> 12U)
#define SLV_PID_DCR(x)                  ((x & GENMASK64(11, 0))  >> 0U)

enum i3c_channels
{
    I3C_PRIM_CTRLR,
    I3C_SEC_CTRLR,
    I3C_CHAN_0 = I3C_PRIM_CTRLR,
    I3C_CHAN_1 = I3C_SEC_CTRLR,
    I3C_MAX_CHAN
};

enum i3c_role_cfg
{
    I3C_ROLE_CFG_PRIM_CTRLR = 1U,
    I3C_ROLE_CFG_SEC_CTRLR = 3U,
    I3C_ROLE_CFG_TGT = 4U,
    I3C_MAX_ROLES
};

/* configuration bit definitions */
enum config_bits
{
     sbit_CONFG_ENABLE                  = (1U << 0) // BIT_0_MASK
    ,sbit_MODE_TARGET                   = (1U << 1) // BIT_1_MASK
    ,sbit_HOTJOIN_DISABLE               = (1U << 2) // BIT_2_MASK
    ,sbit_DMA_MODE                      = (1U << 3) // BIT_3_MASK
};

enum i3c_xfer_speeds {
    XFER_SPEED_SDR0 = 0 /* 12.5 MHz (~12.5Mbps)*/
   ,XFER_SPEED_SDR1     /* 8MHz                */
   ,XFER_SPEED_SDR2     /* 6MHz                */
   ,XFER_SPEED_SDR3     /* 4MHz                */
   ,XFER_SPEED_SDR4     /* 2MHz                */
   ,XFER_SPEED_HDR_TS   /* Not supported on KF */
   ,XFER_SPEED_HDR_DDR  /* 12.5MHz  (~25Mbps)  */
};

enum i2c_xfer_speeds {
    XFER_SPEED_FM    = 0
   ,XFER_SPEED_FMP
};

enum mxds_max_wr_speed {
     MXDS_MAX_WR_SPEED_12P5MHZ = 0
    ,MXDS_MAX_WR_SPEED_8MHZ
    ,MXDS_MAX_WR_SPEED_6MHZ
    ,MXDS_MAX_WR_SPEED_4MHZ
    ,MXDS_MAX_WR_SPEED_2MHZ
};

enum mxds_max_rd_speed {
     MXDS_MAX_RD_SPEED_12P5MHZ = 0
    ,MXDS_MAX_RD_SPEED_8MHZ
    ,MXDS_MAX_RD_SPEED_6MHZ
    ,MXDS_MAX_RD_SPEED_4MHZ
    ,MXDS_MAX_RD_SPEED_2MHZ
};

enum mxds_tsco {
     MXDS_TSCO_8NS = 0
    ,MXDS_TSCO_9NS
    ,MXDS_TSCO_10NS
    ,MXDS_TSCO_11NS
    ,MXDS_TSCO_12NS
};

/**
 * @brief Structure to use by target to raise slave Interrupt Request (SIR)
 */
struct i3c_raise_IBI_SIR {

    /** Pointer to buffer for SIR Data */
    uint8_t *data_buf;

    /** SIR data length */
    uint8_t data_len;

    /** Mandatory Byte */
    uint8_t mdb;

};

/**
 * @brief Structure to use for DO CCC procedure
 */
struct i3c_DO_CCC {

    /** Pointer to buffer for TX/RX Data */
    uint8_t *data_buf;

    /** Number of bytes to read/write */
    uint16_t data_len;

    /** CCC Id */
    uint8_t ccc_id;

    /** Target index */
    uint8_t tgt_idx;

    /** Defining Byte (optional) */
    uint8_t defining_byte;

    /** Set True for Read */
    bool read;

    /** Set True if defining byte is valid */
    bool defining_byte_valid;
};

/**
 * @brief Structure to use for Enable IBI procedure
 */
struct i3c_IBI_SIR {

    /** DAT start address */
    uint16_t DAT_start;

    /** Target index in DAT */
    uint8_t tgt_dat_idx;

    /** True if target's IBI has payload */
    bool ibi_has_payload;
};

/* Single command/transfer */
struct i3c_dw_cmd {

    uint32_t cmd;

    uint32_t arg;

    /** Pointer to buffer for TX/RX Data */
    uint8_t *data_buf;

    /** Number of bytes to read/write */
    uint16_t data_len;

#if I3C_ENABLE_THRESHOLDS_INTR    
    /** Remaining data length - used with thresholds */
    uint16_t rem_data_len;
#endif

    /** Target index */
    uint8_t tgt_idx;

    /** Set True for Read */
    bool read;

    /** Set True to enable PEC */
    bool pec_en;

    /** Set True for STOP */
    bool stop;

    /** Xfer speed */
    uint8_t xfer_speed;
};

/**
 * @brief Structure to use for DO XFER procedure
 */
struct i3c_XFER {

    struct i3c_dw_cmd cmds[MAX_I3C_MSGS];
};

typedef  void (*I3C_CALLBACK) (uintptr_t context);

typedef struct
{
    I3C_CALLBACK callback;
    uintptr_t      context;
} I3C_OBJECT;

void I3C_Soft_Reset(struct i3c_xec_regs *regs);

void I3C_Controller_Clk_Cfg(struct i3c_xec_regs *regs, uint32_t core_clk_rate_mhz);

void I3C_Controller_Clk_Cfg_I2C(struct i3c_xec_regs *regs, uint32_t core_clk_rate_mhz);

void I3C_Target_Init(struct i3c_xec_regs *regs, uint32_t core_clk_rate_mhz, uint16_t *max_rd_len, uint16_t *max_wr_len);

void I3C_Controller_Interrupts_Init(struct i3c_xec_regs *regs);

void I3C_Thresholds_Init(struct i3c_xec_regs *regs);

void I3C_Thresholds_Response_buf_set(struct i3c_xec_regs *regs, uint8_t threshold);

void I3C_Host_Config(struct i3c_xec_regs *regs);

void I3C_Sec_Host_Config(struct i3c_xec_regs *regs);

void I3C_Enable(struct i3c_xec_regs *regs, uint8_t address, uint8_t config);

void I3C_DO_DAA(struct i3c_xec_regs *regs, uint8_t tgt_idx, uint8_t tgts_count, uint8_t *tid_xfer);

void I3C_DO_CCC(struct i3c_xec_regs *regs, struct i3c_DO_CCC *tgt, uint8_t *tid_xfer);

void I3C_CallbackRegister(uint32_t channel, I3C_CALLBACK callback, uintptr_t context);

void I3C_Xfer_Error_Resume(struct i3c_xec_regs *regs);

void I3C_Xfer_Reset(struct i3c_xec_regs *regs);

void I3C_DAT_info_get(struct i3c_xec_regs *regs, uint16_t *start_addr, uint16_t *depth);

void I3C_DCT_info_get(struct i3c_xec_regs *regs, uint16_t *start_addr, uint16_t *depth);

void I3C_DCT_read(struct i3c_xec_regs *regs, uint16_t DCT_start, uint16_t DCT_idx, struct i3c_DCT_info *info);

bool I3C_Is_Current_Role_Primary(struct i3c_xec_regs *regs);

bool I3C_Is_Current_Role_Master(struct i3c_xec_regs *regs);

bool I3C_Is_Current_Role_BusMaster(struct i3c_xec_regs *regs);

void I3C_DAT_DynamicAddrAssign_write(struct i3c_xec_regs *regs, uint16_t DAT_start, uint16_t DAT_idx, uint8_t address);

void I3C_DAT_DynamicAddr_write(struct i3c_xec_regs *regs, uint16_t DAT_start, uint16_t DAT_idx, uint8_t address);

void I3C_queue_depths_get(struct i3c_xec_regs *regs, uint8_t *tx_depth, uint8_t *rx_depth, uint8_t *cmd_depth, uint8_t *resp_depth, uint8_t *ibi_depth);

void I3C_DO_Xfer_Prep(struct i3c_xec_regs *regs, struct i3c_dw_cmd *cmd, uint8_t *tid_xfer);

void I3C_DO_Xfer(struct i3c_xec_regs *regs, struct i3c_dw_cmd *tgt);

void I3C_IBI_SIR_Enable(struct i3c_xec_regs *regs, struct i3c_IBI_SIR *ibi_sir_info);

void I3C_IBI_SIR_Disable(struct i3c_xec_regs *regs, struct i3c_IBI_SIR *ibi_sir_info);

void I3C_TGT_PID_set(struct i3c_xec_regs *regs, uint64_t pid, bool pid_random);

bool I3C_TGT_is_dyn_addr_valid(struct i3c_xec_regs *regs);

uint8_t I3C_TGT_dyn_addr_get(struct i3c_xec_regs *regs);

void I3C_TGT_MRL_set(struct i3c_xec_regs *regs, uint16_t mrl);

void I3C_TGT_MWL_set(struct i3c_xec_regs *regs, uint16_t mwl);

void I3C_TGT_MXDS_set(struct i3c_xec_regs *regs,
                        uint8_t wr_speed,
                        uint8_t rd_speed,
                        uint8_t tsco,
                        uint32_t rd_trnd_us);

int I3C_TGT_IBI_SIR_Raise(struct i3c_xec_regs *regs, struct i3c_raise_IBI_SIR *ibi_sir_request);

int I3C_TGT_IBI_MR_Raise(struct i3c_xec_regs *regs);

void I3C_Target_Interrupts_Init(struct i3c_xec_regs *regs);

void I3C_TGT_IBI_SIR_Residual_handle(struct i3c_xec_regs *regs);

void I3C_TGT_Error_Recovery(struct i3c_xec_regs *regs, uint8_t err_sts);

#if I3C_ENABLE_THRESHOLDS_INTR
void I3C_DO_TGT_Xfer(struct i3c_xec_regs *regs, uint8_t *data_buf, uint16_t data_len, uint16_t rem_data_len);
#else
void I3C_DO_TGT_Xfer(struct i3c_xec_regs *regs, uint8_t *data_buf, uint16_t data_len);
#endif

void I3C_Target_MRL_MWL_update(struct i3c_xec_regs *regs, uint16_t *max_rd_len, uint16_t *max_wr_len);

void I3C_Target_MRL_MWL_set(struct i3c_xec_regs *regs, uint16_t max_rd_len, uint16_t max_wr_len);

void I3C_SDCT_read(struct i3c_xec_regs *regs, uint16_t DCT_start, uint16_t idx, struct i3c_SDCT_info *info);

void I3C_TGT_DEFSLVS_DAT_write(struct i3c_xec_regs *regs, uint16_t DCT_start, uint16_t DAT_start, uint8_t targets_count);

void I3C_TGT_RoleSwitch_Resume(struct i3c_xec_regs *regs);

#endif /* _INCLUDE_PLIB_I3C_H_ */