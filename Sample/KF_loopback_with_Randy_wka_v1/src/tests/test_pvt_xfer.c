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
#define DATA_SIZE 4096
#else
#define DATA_SIZE 512
#endif
#define WRITE_SIZE DATA_SIZE
#define READ_SIZE DATA_SIZE
// static uint8_t buff[WRITE_SIZE];
static uint8_t *txd = NULL;
static uint8_t *rxd1 = NULL;

int test_xfers_all(struct device *dev)
{
    struct xec_i3c_config *dev_cfg = (struct xec_i3c_config*)dev->config;
    uint8_t num_i3c_tgts = dev_cfg->common.dev_list.num_i3c;
    struct i3c_device_desc *target = NULL;
    int i = 0, ret = 0;
    bool pec_en = false;
    //bool hdr_en = true;
    bool hdr_en = false;

    if (txd == NULL) {
        LOG_DBG("txd pvPortMalloc");
        txd = pvPortMalloc(WRITE_SIZE);

        if (txd == NULL) {
            LOG_DBG("txd pvPortMalloc Error!");
            return -1;
        }
    }

    if (rxd1 == NULL) {
        LOG_DBG("rxd1 pvPortMalloc");
        rxd1 = pvPortMalloc(READ_SIZE);

        if (rxd1 == NULL) {
            LOG_DBG("rxd1 pvPortMalloc Error!");
            vPortFree(txd);
            return -1;
        }
    }
    

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
        LOG_DBG("Master: write %d bytes to target", WRITE_SIZE);
        for (size_t i = 0; i < WRITE_SIZE; i++)
            txd[i] = i % 0x100; //fill 0x00-0xff
        ret = test_private_write(target, &txd[0], WRITE_SIZE, pec_en, hdr_en);

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

        memset(rxd1, 0x00, READ_SIZE);

        LOG_DBG("Master: received %d bytes from target", READ_SIZE);
        ret = test_private_read(target, &rxd1[0], READ_SIZE, pec_en, hdr_en);
        print_buf(&rxd1[0], READ_SIZE);
        LOG_DBG("\r\n");
    }

    memset(rxd1, 0x00, READ_SIZE);
    
    // for(i=0; i<num_i3c_tgts; i++)
    // {
    //     target = &dev_cfg->common.dev_list.i3c[i];

    //     if (0x046A00000000 == target->pid) {
    //         LOG_ERR("Not a simulated device!!");
    //         ret = -1;
    //         continue;
    //     }
    //     LOG_DBG("Master write/read to/from target:");
    //     ret = test_private_write_read(target, &txd[i%2][0], 10, &rxd[i%2][0], 10, pec_en, hdr_en);
    //     print_buf(&rxd[i%2][0], 10);
    // }
#endif

    vPortFree(txd);
    vPortFree(rxd1);

    return ret;
}