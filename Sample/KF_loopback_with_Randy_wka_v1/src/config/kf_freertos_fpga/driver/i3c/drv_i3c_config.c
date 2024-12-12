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

#include "drv_i3c.h"
static const struct i3c_driver_api mchp_i3c_driver_api = {
    .configure = DRV_I3C_configure,
    .attach_i3c_device = DRV_I3C_attach_device,
    .detach_i3c_device = DRV_I3C_detach_device,
    .reattach_i3c_device = DRV_I3C_reattach_device,
    .i3c_device_find = DRV_I3C_device_find,
    .do_ccc = DRV_I3C_do_CCC,
    .do_daa = DRV_I3C_do_DAA,
    .i3c_xfers = DRV_I3C_Xfers,
    .target_tx_write = DRV_I3C_target_tx_write,
    .target_register = DRV_I3C_target_register,
    .target_unregister = DRV_I3C_target_unregister,
#ifdef CONFIG_I3C_USE_IBI
    .ibi_enable = DRV_I3C_IBI_enable,
    .ibi_disable = DRV_I3C_IBI_disable,
    .ibi_raise = DRV_I3C_target_ibi_raise,
#endif
};

//I3C0
struct device I3C0_DEV;
struct i3c_device_desc i3c0_device_list[NUM_TARGETS_ON_I3C0_BUS] = {
    {
        .dev = &I3C0_DEV,
        .bus = &I3C0_DEV,
        .dynamic_addr = 0,
        .static_addr = 0,
        .pid = 0xC0123456789C,
        .init_dynamic_addr = 0x5A,
    },
    /*{
        .dev = &I3C0_DEV,
        .bus = &I3C0_DEV,
        .dynamic_addr = 0,
        .static_addr = 0x69,
        .pid = 0x046A00000000,
        .init_dynamic_addr = 0x5B,
    },
    {
        .dev = &I3C0_DEV,
        .bus = &I3C0_DEV,
        .dynamic_addr = 0,
        .static_addr = 0,
        .pid = 0xA0123456789A,
        .init_dynamic_addr = 0x5C,
    },
    {
        .dev = &I3C0_DEV,
        .bus = &I3C0_DEV,
        .dynamic_addr = 0,
        .static_addr = 0x6B,
        .pid = 0xB0123456789B,
        .init_dynamic_addr = 0x5D,
    }*/
};

//i3c1_device_list used if I3C1 is used as host
struct device I3C1_DEV;
struct i3c_device_desc i3c1_device_list[NUM_TARGETS_ON_I3C1_BUS] = {
    {
        .dev = &I3C1_DEV,
        .bus = &I3C1_DEV,
        .dynamic_addr = 0,
        .static_addr = 0,
        .pid = 0xC0123456789C,
        .init_dynamic_addr = 0x5A,
    },
    {
        .dev = &I3C1_DEV,
        .bus = &I3C1_DEV,
        .dynamic_addr = 0,
        .static_addr = 0x69,
        .pid = 0x046A00000000,
        .init_dynamic_addr = 0x5B,
    },
    {
        .dev = &I3C1_DEV,
        .bus = &I3C1_DEV,
        .dynamic_addr = 0,
        .static_addr = 0x6A,
        .pid = 0xA0123456789A,
        .init_dynamic_addr = 0x5C,
    },
    {
        .dev = &I3C1_DEV,
        .bus = &I3C1_DEV,
        .dynamic_addr = 0,
        .static_addr = 0x6B,
        .pid = 0xB0123456789B,
        .init_dynamic_addr = 0x5D,
    }
};

struct xec_i3c_config I3C0_CFG = {
    .regs = (struct i3c_xec_regs *) I3C0_BASE_ADDRESS,
    .dma_regs_tx = (struct dma_regs *) I3C0_DMA_TX_BASE_ADDRESS,
    .dma_regs_rx = (struct dma_regs *) I3C0_DMA_RX_BASE_ADDRESS,
    .address = I3C0_DYNAMIC_ADDRESS,
    .clock = I3C0_CORE_CLOCK_HZ,
    .common.dev_list.num_i3c = NUM_TARGETS_ON_I3C0_BUS,
    .common.dev_list.i3c = i3c0_device_list,
    .common.dev_list.num_i2c = 0
};

struct xec_i3c_data I3C0_DATA = {
    .common.ctrl_config.is_secondary = false,
    .common.ctrl_config.scl.i3c = 12500000U,
    .common.ctrl_config.scl.i2c = 400000U,
};


struct xec_i3c_config I3C1_CFG = {
    .regs = (struct i3c_xec_regs *) I3C1_BASE_ADDRESS,
    .dma_regs_tx = (struct dma_regs *) I3C1_DMA_TX_BASE_ADDRESS,
    .dma_regs_rx = (struct dma_regs *) I3C1_DMA_RX_BASE_ADDRESS,
    .address = I3C1_DYNAMIC_ADDRESS,
    .clock = I3C1_CORE_CLOCK_HZ,
};

struct xec_i3c_config I3C1_HOST_CFG = {
    .regs = (struct i3c_xec_regs *) I3C1_BASE_ADDRESS,
    .dma_regs_tx = (struct dma_regs *) I3C1_DMA_TX_BASE_ADDRESS,
    .dma_regs_rx = (struct dma_regs *) I3C1_DMA_RX_BASE_ADDRESS,
    .address = I3C1_DYNAMIC_ADDRESS,
    .clock = I3C1_CORE_CLOCK_HZ,
    .common.dev_list.num_i3c = NUM_TARGETS_ON_I3C1_BUS,
    .common.dev_list.i3c = i3c1_device_list,
    .common.dev_list.num_i2c = 0
};

struct xec_i3c_data I3C1_DATA = {
    .common.ctrl_config.is_secondary = true,
    .common.ctrl_config.secondary_mode = I3C_SEC_MODE_SECONDARY,
    .common.ctrl_config.scl.i3c = 12500000U,
    .common.ctrl_config.scl.i2c = 400000U,
};

struct xec_i3c_data I3C1_HOST_DATA = {
    .common.ctrl_config.is_secondary = true,
    .common.ctrl_config.secondary_mode = I3C_SEC_MODE_HOST,
    .common.ctrl_config.scl.i3c = 12500000U,
    .common.ctrl_config.scl.i2c = 400000U,
};

struct i3c_config_target i3c_tgt = {
    .enable = true,
    .static_addr = 0x6C,
    .pid = 0xC0123456789C,
    .pid_random = false,
    .bcr = 0x06,
    .dcr = 0x00,
    .max_read_len = 8,
    .max_write_len = 8,
    .supported_hdr = I3C_MSG_HDR_DDR,
};

/**
 * @brief Initialize I3C0 hardware.
 */
struct device* DRV_I3C0_Initialize()
{
    I3C0_DEV.name = "I3C0_PRIM_CONTROLLER";
    I3C0_DEV.config = (void *) &I3C0_CFG;
    I3C0_DEV.data = (void*) &I3C0_DATA;
    I3C0_DEV.api = &mchp_i3c_driver_api;


    DRV_I3C_Init(&I3C0_DEV);

    return &I3C0_DEV;
}

int DRV_I3C_Bus_Init(struct device * dev)
{//Call only for Controller
    const struct xec_i3c_config *config = dev->config;
    int ret;

        ret = i3c_addr_slots_init(dev);

        if (ret != 0) {
            return ret;
        }
        // Perform bus initialization
        ret = i3c_bus_init(dev, &config->common.dev_list);

    return ret;
}

/**
 * @brief Initialize I3C1 hardware.
 */
struct device* DRV_I3C1_Initialize()
{
    I3C1_DEV.name = "I3C1_TARGET";
    I3C1_DEV.config = (void *) &I3C1_CFG;
    I3C1_DEV.data = (void*) &I3C1_DATA;
    I3C1_DEV.api = &mchp_i3c_driver_api;

    if(DRV_I3C_Init(&I3C1_DEV)) {
    //Init fail
    }
    DRV_I3C_configure(&I3C1_DEV, I3C_CONFIG_TARGET, &i3c_tgt);
    i3c_mec5_tgt_wka_code(&I3C1_DEV);//work around function
    return &I3C1_DEV;
}

/**
 * @brief Initialize I3C1 hardware.
 */
struct device* DRV_I3C1_as_host_Initialize()
{
    I3C1_DEV.name = "I3C1_CONTROLLER";
    I3C1_DEV.config = (void *) &I3C1_HOST_CFG;
    I3C1_DEV.data = (void*) &I3C1_HOST_DATA;
    I3C1_DEV.api = &mchp_i3c_driver_api;

    if(DRV_I3C_Init(&I3C1_DEV)) {
    //Init fail
    }

    return &I3C1_DEV;
}
