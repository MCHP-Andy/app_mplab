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

uint8_t buff[1000][4];
volatile uint16_t ibi_cnt = 0;

static int target_5a_ibi_cb(struct i3c_device_desc *target, struct i3c_ibi_payload *payload)
{
    int ret = 0, i = 0;
   
    if(payload == NULL)
    {
      ret = -1;
      goto exit_target_5a_ibi_cb;
    }

//    LOG_DBG("Enter [%s] - RxD %d bytes of payload", __FUNCTION__, payload->payload_len);
    if(payload->payload_len) {

        for(uint8_t indx=0;indx<payload->payload_len;indx++)
            // buff[ibi_cnt][indx] = payload->payload[indx];
            memcpy(buff[ibi_cnt], payload->payload, payload->payload_len);

        ibi_cnt++;
    }

exit_target_5a_ibi_cb:
    return ret;
}

static int target_5b_ibi_cb(struct i3c_device_desc *target, struct i3c_ibi_payload *payload)
{
    int ret = 0, i = 0;
   
    if(payload == NULL)
    {
      ret = -1;
      goto exit_target_5b_ibi_cb;
    }

    LOG_DBG("Enter [%s] - RxD %d bytes of payload", __FUNCTION__, payload->payload_len);
    if(payload->payload_len) {
        print_buf(&payload->payload[0], payload->payload_len);
    }

exit_target_5b_ibi_cb:
    return ret;
}

static int target_5c_ibi_cb (struct i3c_device_desc *target, struct i3c_ibi_payload *payload)
{
    int ret = 0;
    
    if(payload == NULL)
    {
      ret = -1;
      goto exit_target_5c_ibi_cb;
    }

    LOG_DBG("Enter [%s] - RxD %d bytes of payload", __FUNCTION__, payload->payload_len);
    if(payload->payload_len) {
        print_buf(&payload->payload[0], payload->payload_len);
    }

exit_target_5c_ibi_cb:
    return ret;
}

int test_ibis_all(struct device *dev)
{
    struct xec_i3c_config *dev_cfg = (struct xec_i3c_config*)dev->config;
    uint8_t num_i3c_tgts = dev_cfg->common.dev_list.num_i3c;
    struct i3c_device_desc *target = NULL;
    int i = 0, ret = 0;

    for(i=0; i<num_i3c_tgts; i++)
    {
        target = &dev_cfg->common.dev_list.i3c[i];

        // if (0x046A00000000 == target->pid) {
        //     LOG_ERR("Not a simulated device!!");
        //     ret = -1;
        //     continue;
        // }

        if(target->dynamic_addr == 0x5a) {
            target->ibi_cb = target_5a_ibi_cb;
        }
        
        // if(target->dynamic_addr == 0x5b) {
        //     target->ibi_cb = target_5b_ibi_cb;
        // }

        // if(target->dynamic_addr == 0x5c) {
        //     target->ibi_cb = target_5c_ibi_cb;
        // }

        i3c_ibi_enable(target);
    } 
    return ret;
}