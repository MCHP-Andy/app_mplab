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
#include "timers.h"

#define MAX_NUM_IBI_REQ 100

extern int DRV_I3C_target_ibi_raise(const struct device *dev, struct i3c_ibi *request);
uint8_t sir_ibi_payload[4] = {0x2E, 0x01, 0x02, 0x03}; 
struct device *tgt_dev = NULL;
TimerHandle_t tgt_test_sir_ibi_tmr;
TimerHandle_t tgt_test_mr_ibi_tmr;

struct i3c_ibi sir_ibi_mdb_only = {
    .ibi_type = I3C_IBI_TARGET_INTR,
    .payload = &sir_ibi_payload[0],
    .payload_len = 1
};

struct i3c_ibi sir_ibi_mdb_1byte_payload = {
    .ibi_type = I3C_IBI_TARGET_INTR,
    .payload = &sir_ibi_payload[0],
    .payload_len = 2
};

struct i3c_ibi sir_ibi_mdb_2byte_payload = {
    .ibi_type = I3C_IBI_TARGET_INTR,
    .payload = &sir_ibi_payload[0],
    .payload_len = 3
};

struct i3c_ibi sir_ibi_mdb_3byte_payload = {
    .ibi_type = I3C_IBI_TARGET_INTR,
    .payload = &sir_ibi_payload[0],
    .payload_len = 4
};

struct i3c_ibi mr_ibi = {
    .ibi_type = I3C_IBI_CONTROLLER_ROLE_REQUEST,
    .payload = NULL,
};

static uint16_t count = 0;

void tgt_test_sir_ibi_cb(TimerHandle_t xTimer)
{
#if 0
    struct xec_i3c_config *config = (struct xec_i3c_config*)tgt_dev->config;
    
    if(!I3C_TGT_is_dyn_addr_valid(config->regs))
    {
        return;
    }
  
    if (0 != DRV_I3C_target_ibi_raise(tgt_dev, &sir_ibi_mdb_only))
    {
        LOG_DBG("SIR IBI with MDB only failed!!");
    }
    
    if (0 != DRV_I3C_target_ibi_raise(tgt_dev, &sir_ibi_mdb_1byte_payload))
    {
        LOG_DBG("SIR IBI with MDB + 1 byte of payload failed!!");
    }
    
    if (0 != DRV_I3C_target_ibi_raise(tgt_dev, &sir_ibi_mdb_2byte_payload))
    {
        LOG_DBG("SIR IBI with MDB + 2 bytes of payload failed!!");
    }

    xTimerStop(tgt_test_sir_ibi_tmr, 0U);
#endif

    count++;
    if(count==MAX_NUM_IBI_REQ)
	{
        xTimerStop(tgt_test_sir_ibi_tmr, 0U);
		count = 0;
	}

    if (0 != DRV_I3C_target_ibi_raise(tgt_dev, &sir_ibi_mdb_3byte_payload))
    {
        LOG_DBG("SIR IBI with MDB + 3 bytes of payload failed!!");
    }
}

int tgt_test_sir_ibi_init(struct device *dev)
{
    struct xec_i3c_config *config = (struct xec_i3c_config*)dev->config;
    if(NULL == config) {
        return -1;
    }

    if(!I3C_TGT_is_dyn_addr_valid(config->regs))
    {
        return -1;
    }

    LOG_DBG("T: send %d IBI", MAX_NUM_IBI_REQ);
    tgt_test_sir_ibi_tmr = xTimerCreate("TEST_SIR_TMR", pdMS_TO_TICKS(10), pdTRUE, (void*)0, tgt_test_sir_ibi_cb);
    if(tgt_test_sir_ibi_tmr!=NULL)
        xTimerStart(tgt_test_sir_ibi_tmr, 0);

    return 0;    
}

void tgt_test_mr_ibi_cb(TimerHandle_t xTimer)
{
    if (0 != DRV_I3C_target_ibi_raise(tgt_dev, &mr_ibi))
    {
        LOG_DBG("MR IBI failed!!");
    }

    xTimerStop(tgt_test_mr_ibi_tmr, 0U);
}

int tgt_test_mr_ibi_init(struct device *dev)
{
    if(NULL == dev) {
        return -1;
    }

    tgt_test_mr_ibi_tmr = xTimerCreate("TEST_MR_TMR", pdMS_TO_TICKS(10000), pdFALSE, (void*)0, tgt_test_mr_ibi_cb);

    return 0;    
}

int tgt_test_ibis_all(struct device *dev)
{
    int ret = 0;

    tgt_dev = dev;
    tgt_test_sir_ibi_init(dev);
//    tgt_test_mr_ibi_init(dev);

    return ret;
}