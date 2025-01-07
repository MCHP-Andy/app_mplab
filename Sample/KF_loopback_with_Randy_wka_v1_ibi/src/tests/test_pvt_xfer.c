/*******************************************************************************
 * Copyright (C) 2020 Microchip Technology Inc. and its subsidiaries.
 *
 * Subject to your compliance with these terms, you may use Microchip software
 * and any derivatives exclusively with Microchip products. It is your
 * responsibility to comply with third party license terms applicable to your
 * use of third party software (including open source software) that may
 * accompany Microchip software.
 *
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
 * PARTICULAR PURPOSE.
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
 * ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
 * THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *******************************************************************************/
#include <string.h>
#include "definitions.h"
#include "debug/trace.h"

int test_private_write(struct i3c_device_desc *target, uint8_t *data, uint32_t len, bool pec_en, bool hdr_en)
{
    int ret = 0;
    
    if((target == NULL) || (data == NULL) || (len <= 0)) {
        LOG_ERR("Invalid inputs!!");
        goto exit_test_private_write;
    }
    
    if(target->dynamic_addr == 0) {
        LOG_ERR("Invalid Target!!");
        goto exit_test_private_write;
    }
    
    ret = i3c_write(target, data, len, pec_en, hdr_en);
    
exit_test_private_write:

    return ret;
}

int test_private_read(struct i3c_device_desc *target, uint8_t *data, uint32_t len, bool pec_en, bool hdr_en)
{
    int ret = 0;
    
    if((target == NULL) || (data == NULL) || (len <= 0)) {
        LOG_ERR("Invalid inputs!!");
        goto exit_test_private_read;
    }
    
    if(target->dynamic_addr == 0) {
        LOG_ERR("Invalid Target!!");
        goto exit_test_private_read;
    }
    
    ret = i3c_read(target, data, len, pec_en, hdr_en);
    
exit_test_private_read:

    return ret;
}

int test_private_write_read(struct i3c_device_desc *target, uint8_t *wr, uint32_t wr_len, uint8_t *rd, uint32_t rd_len, bool pec_en, bool hdr_en)
{
    int ret = 0;
    
    if((target == NULL) || 
        (wr == NULL)    || 
        (wr_len <= 0)   ||
        (rd == NULL)    ||
        (rd_len <= 0)) {
        LOG_ERR("Invalid inputs!!");
        goto exit_test_private_write_read;
    }
    
    if(target->dynamic_addr == 0) {
        LOG_ERR("Invalid Target!!");
        goto exit_test_private_write_read;
    }
    
    ret = i3c_write_read(target, wr, wr_len, rd, rd_len, pec_en, hdr_en);
    
exit_test_private_write_read:

    return ret;
}


// #define TEST_THRESHOLD_INTR

#define TEST_LEN    232

#ifdef TEST_THRESHOLD_INTR
uint8_t txd_cust[TEST_LEN];
uint8_t rxd_cust[TEST_LEN];
#endif

#if I3C_ENABLE_DMA
uint8_t tx_max[4096] = {0};
#else
uint8_t tx_max[128] = {0};
#endif

int test_xfers_all(struct device *dev)
{
    struct xec_i3c_config *dev_cfg = (struct xec_i3c_config*)dev->config;
    uint8_t num_i3c_tgts = dev_cfg->common.dev_list.num_i3c;
    struct i3c_device_desc *target = NULL;
    int i = 0, ret = 0;
    uint8_t txd[MAX_TARGETS][10] = {
        {0x8b, 0x23, 0x49, 0xec, 0x09, 0x64, 0x18, 0xeb, 0x84, 0x4f},
    };
    uint8_t rxd[MAX_TARGETS][10];
    bool pec_en = false;
    //bool hdr_en = true;
    bool hdr_en = false;

#ifdef TEST_THRESHOLD_INTR
    for (i=0; i<TEST_LEN; i++) {
        txd_cust[i] = 1 + i;
        rxd_cust[0] = 0x0;
    }    
    num_i3c_tgts = 2;
    
#endif    
    
    for(i=0; i<num_i3c_tgts; i++)
    {
        target = &dev_cfg->common.dev_list.i3c[i];

        if (0x046A00000000 == target->pid) {
            LOG_ERR("Not a simulated device!!");
            ret = -1;
            continue;
        }

#ifdef TEST_THRESHOLD_INTR  
        ret = test_private_write(target, &txd_cust[0], TEST_LEN, pec_en, hdr_en);
        ret = test_private_read(target, &rxd_cust[0], TEST_LEN, pec_en, hdr_en);
        print_buf(&rxd_cust[0], TEST_LEN);        
        // while(1);
#else
        LOG_DBG("Master write to target:");
        // ret = test_private_write(target, &txd[i%2][0], 10, pec_en, hdr_en);

        for (size_t i = 0; i < sizeof(tx_max); i++)
            tx_max[i] = i/16;
        ret = test_private_write(target, tx_max, sizeof(tx_max), pec_en, hdr_en);

        if (ret < 0) {
            LOG_ERR("test_private_write error: %d", ret);
        }
        
        
        LOG_DBG("\r\n");
#endif
    } 
    
#ifndef TEST_THRESHOLD_INTR  
    
    LOG_DBG("[TEST_THRESHOLD_INTR] num_i3c_tgts:%d", num_i3c_tgts);
    for(i=0; i<num_i3c_tgts; i++)
    {
        target = &dev_cfg->common.dev_list.i3c[i];

        if (0x046A00000000 == target->pid) {
            LOG_ERR("Not a simulated device!!");
            ret = -1;
            continue;
        }

        LOG_DBG("Master read from target:");
        ret = test_private_read(target, &rxd[i%2][0], 10, pec_en, hdr_en);
        print_buf(&rxd[i%2][0], 10);
        LOG_DBG("\r\n");
    }

    for(i=0; i<num_i3c_tgts; i++) {
        memset(&rxd[i%2][0], 0x00, 10);
    }
    
    for(i=0; i<num_i3c_tgts; i++)
    {
        target = &dev_cfg->common.dev_list.i3c[i];

        if (0x046A00000000 == target->pid) {
            LOG_ERR("Not a simulated device!!");
            ret = -1;
            continue;
        }
        LOG_DBG("Master write/read to/from target:");
        ret = test_private_write_read(target, &txd[i%2][0], 10, &rxd[i%2][0], 10, pec_en, hdr_en);
        print_buf(&rxd[i%2][0], 10);
    }
#endif    

    return ret;
}