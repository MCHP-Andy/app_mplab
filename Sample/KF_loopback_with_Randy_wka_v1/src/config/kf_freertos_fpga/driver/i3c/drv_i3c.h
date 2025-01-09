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

#include "zephyr/drivers/i3c.h"
#include "peripheral/i3c/plib_i3c.h"
#include "drv_i3c_config.h"

#ifndef _INCLUDE_I3C_XEC_H_
#define _INCLUDE_I3C_XEC_H_

#include <dma.h>

/* Max number of target devices on the I3C bus */
//#define MAX_TARGETS             32U
#define MAX_TARGETS             1U

/* Max number of devices that can be assigned address using SETDASA */
#define MAX_TARGETS_SETDASA     16U

#define DRV_RESP_WAIT_MS        1000U

#define MAX_IBI_LIST_COUNT      10U

// #define TGT_RX_DATA_BUF_SIZE    128
#define TGT_RX_DATA_BUF_SIZE    4096
//#define MAX_TGT_RX_LIST_COUNT   10U
#define MAX_TGT_RX_LIST_COUNT   1U

#define MAX_TGT_TX_DATALEN      128

#define DRV_EVENT_BIT_HANDLE_IBI            (0x01U << 1U)
#define DRV_EVENT_BIT_HANDLE_TGT_RX         (0x01U << 2U)
#define DRV_EVENT_BIT_HANDLE_TGT_TX_DONE    (0x01U << 3U)

enum target_states
{
    TGT_STATE_NOT_PRESENT,
    TGT_STATE_ADDR_ASSIGNED,
    TGT_STATE_NEEDS_DAA,
    TGT_STATE_DAA_IN_PROGRESS,
    TGT_STATE_MAX
};

enum ibi_node_states
{
    IBI_NODE_STATE_FREE,
    IBI_NODE_STATE_IN_USE,
    IBI_NODE_ISR_UPDATED,
};

enum tgt_pvt_receive_node_states
{
    TGT_RX_NODE_STATE_FREE,
    TGT_RX_NODE_STATE_IN_USE,
    TGT_RX_NODE_STATE_IN_USE_DMA,
    TGT_RX_NODE_ISR_UPDATED,
    TGT_RX_NODE_ISR_UPDATED_THR,
};

enum pending_xfer_type
{
    XFER_TYPE_INVALID,
    XFER_TYPE_CCC,
    XFER_TYPE_ENTDAA,
    XFER_TYPE_PVT_RW,
    XFER_TYPE_TGT_RAISE_IBI,
    XFER_TYPE_TGT_RAISE_IBI_MR,
    XFER_TYPE_TGT_PVT_RD,
};

struct xec_i3c_config {
    /** Common I3C Driver Config */
    struct i3c_driver_config common;

	/** Pointer to controller registers. */
	struct i3c_xec_regs *regs;
    
    /** Pointer to dma registers. */
	struct dma_regs *dma_regs_tx;
    
    struct dma_regs *dma_regs_rx;

    /** I3C Core Input Clock */
    uint32_t clock;

    /** I3C 7-bit address - dynamic address for controller / static for target */
    uint8_t address;

};

#ifdef CONFIG_I3C_USE_IBI
struct ibi_node {

    struct i3c_ibi_payload payload;

    /** Type of IBI. */
    enum i3c_ibi_type ibi_type;

    /** 7-bit address of the device that initiated the IBI */
    uint8_t addr;

    /* IBI Node state */
    uint8_t state;
};
#endif

struct targets_on_bus {

    /* PID of the target */
    uint64_t pid;

    /* Target address assignment state */
    uint8_t state;

    /* Address of the target */
    uint8_t address;

    /* Index in the Device Address Table */
    uint8_t dat_idx;
};

/**
 * @brief Structure to use for Target Pvt RX
 */
struct i3c_tgt_pvt_receive_node {

    /** Pointer to buffer for RX Data */
    uint8_t data_buf[TGT_RX_DATA_BUF_SIZE];

    /* Data length of the Private Receive xfer */
    uint16_t data_len;

    /** Node Transfer status - 0 success, < 0 fail */
    uint8_t error_status;

    /* Node state */
    uint8_t state;
};

/**
 * @brief Structure to use for DO CCC procedure
 */
struct i3c_pending_xfer_node {

    /* Return data length*/
    uint16_t ret_data_len;

#if I3C_ENABLE_THRESHOLDS_INTR

    /** Number of bytes to read/write */
    uint16_t data_len;

    /** Number of bytes read/write remaining */
    uint16_t rem_data_len;

    /** Number of bytes to read in next iteration */
    uint16_t read_iter_data_len;
#endif

    /** Pointer to buffer for RX Data */
    uint8_t *data_buf;

    /** 4-bit TID for the transfer */
    uint8_t tid;

    /** Node Transfer status - 0 success, < 0 fail */
    uint8_t error_status;

    /** True if Read expected */
    bool read;
};

/**
 * @brief Structure to use for DO CCC procedure
 */
struct i3c_pending_xfer {

    /* Individual chained transfer details */
    struct i3c_pending_xfer_node node[MAX_I3C_MSGS];

    /* Semaphore used for the transfer */
    OSAL_SEM_HANDLE_TYPE *xfer_sem;

    /** xfer type */
    uint8_t xfer_type;

    /** Transfer status - 0 success, < 0 fail */
    uint8_t xfer_status;

#if I3C_ENABLE_THRESHOLDS_INTR
    uint8_t current_xfer_idx;

    bool use_thresholds;
#endif

};

struct queue_depths {
    /* Depth of tx FIFO */
    uint8_t tx_fifo_depth;

    /* Depth of rx FIFO */
    uint8_t rx_fifo_depth;

    /* Depth of command FIFO */
    uint8_t cmd_fifo_depth;

    /* Depth of response FIFO */
    uint8_t resp_fifo_depth;

    /* Depth of IBI FIFO */
    uint8_t ibi_fifo_depth;
};

struct xec_i3c_data {
    /** Common I3C Driver Data */
    struct i3c_driver_data common;

    /** Target configuration */
    struct i3c_target_config *target_config;

    /* Semaphore to implement blocking functions for CCC and pvt transfers */
    OSAL_SEM_HANDLE_TYPE xfer_sem;

    /* Semaphore to implement thread synchronization */
    OSAL_SEM_HANDLE_TYPE xfer_lock;

    /* List of targets on bus */
    struct targets_on_bus targets[MAX_TARGETS];

#ifdef CONFIG_I3C_USE_IBI
    /* List of IBIs */
    struct ibi_node  ibis[MAX_IBI_LIST_COUNT];

    /* Semaphore to implement event handling */
    OSAL_SEM_HANDLE_TYPE events_sem;
#endif

    struct i3c_tgt_pvt_receive_node tgt_pvt_rx[MAX_TGT_RX_LIST_COUNT];

    /* Maximum depths of HW FIFO */
    struct queue_depths fifo_depths;

     /* Free Positions in the Device Address Table */
    uint32_t DAT_free_positions;

    /* Start address of DAT */
    uint16_t DAT_start_addr;

    /* Maximum number of targets - depth of DAT */
    uint16_t DAT_depth;

    /* Start address of DCT */
    uint16_t DCT_start_addr;

    /* Depth of DCT */
    uint16_t DCT_depth;

    /* Maximum read length when acting as target */
    uint16_t tgt_max_read_len;

    /* Maximum write length when acting as target */
    uint16_t tgt_max_write_len;
    
    /* Remaining data length for Target Pvt TX Xfer */
    uint16_t tgt_pvt_tx_rem_data_len;
    
    /* Status for Target Pvt TX Xfer */
    uint8_t tgt_pvt_tx_sts;
    
    /* Flag to indicate if target TX has been queued */
    bool tgt_tx_queued;


};


int DRV_I3C_Init(const struct device *dev);

int DRV_I3C_attach_device(const struct device *dev, struct i3c_device_desc *desc,
                    uint8_t addr);

int DRV_I3C_detach_device(const struct device *dev, struct i3c_device_desc *desc);

int DRV_I3C_reattach_device(const struct device *dev,
                                struct i3c_device_desc *desc,
                                uint8_t old_dyn_addr);

int DRV_I3C_do_CCC(const struct device *dev, struct i3c_ccc_payload *payload);

int DRV_I3C_Xfers(const struct device *dev,
                                struct i3c_device_desc *target,
                                struct i3c_msg *msgs,
                                uint8_t num_msgs);

int DRV_I3C_do_DAA(const struct device *dev);

struct i3c_device_desc *DRV_I3C_device_find(const struct device *dev,
                            const struct i3c_device_id *id);

int DRV_I3C_target_tx_write(const struct device *dev, uint8_t *buf, uint16_t len);
int DRV_I3C_target_register(const struct device *dev, struct i3c_target_config *cfg);
int DRV_I3C_target_unregister(const struct device *dev, struct i3c_target_config *cfg);

int DRV_I3C_configure(const struct device *dev, enum i3c_config_type type, void *config);
void i3c_mec5_tgt_wka_code(const struct device *dev); //work around function
#ifdef CONFIG_I3C_USE_IBI
int DRV_I3C_IBI_enable(const struct device *dev, struct i3c_device_desc *target);
int DRV_I3C_IBI_disable(const struct device *dev, struct i3c_device_desc *target);
int DRV_I3C_target_ibi_raise(const struct device *dev, struct i3c_ibi *request);
#endif

#endif /* _INCLUDE_I3C_XEC_H_ */
