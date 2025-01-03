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
#include "test_ccc.h"

int test_ccc_broadcast(struct device *dev, enum bcast_cc_list ccc_id)
{
    struct i3c_ccc_payload payload;
    int ret = 0;
    
    switch(ccc_id)
    {
        case BCAST_CCC_ENEC:
        {
            LOG_DBG("BCAST_CCC_ENEC TEST START");
            struct i3c_ccc_events events = {.events = I3C_CCC_ENEC_EVT_ALL};
            ret = i3c_ccc_do_events_all_set(dev, true, &events);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENEC TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENEC TEST END");
        }
            break;
        case BCAST_CCC_DISEC:
        {
            LOG_DBG("BCAST_CCC_DISEC TEST START");
            struct i3c_ccc_events events = {.events = I3C_CCC_DISEC_EVT_ALL};
            ret = i3c_ccc_do_events_all_set(dev, false, &events);
            if(ret) {
                LOG_ERR("BCAST_CCC_DISEC TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_DISEC TEST END");
        }
            break;
        case BCAST_CCC_ENTAS0:
        {
            LOG_DBG("BCAST_CCC_ENTAS0 TEST START");
            memset(&payload, 0x00, sizeof(payload));
            payload.ccc.id = I3C_CCC_ENTAS0(true);
            payload.ccc.data_len = 0U;
            ret = i3c_do_ccc(dev, &payload);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENTAS0 TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENTAS0 TEST END");                
        }
            break;
        case BCAST_CCC_ENTAS1:
        {
            LOG_DBG("BCAST_CCC_ENTAS1 TEST START");
            memset(&payload, 0x00, sizeof(payload));
            payload.ccc.id = I3C_CCC_ENTAS1(true);
            payload.ccc.data_len = 0U;
            ret = i3c_do_ccc(dev, &payload);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENTAS1 TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENTAS1 TEST END");                
        }
            break;
        case BCAST_CCC_ENTAS2:
        {
            LOG_DBG("BCAST_CCC_ENTAS2 TEST START");
            memset(&payload, 0x00, sizeof(payload));
            payload.ccc.id = I3C_CCC_ENTAS2(true);
            payload.ccc.data_len = 0U;
            ret = i3c_do_ccc(dev, &payload);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENTAS2 TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENTAS2 TEST END");                
        }
            break;
        case BCAST_CCC_ENTAS3:
        {
            LOG_DBG("BCAST_CCC_ENTAS3 TEST START");
            memset(&payload, 0x00, sizeof(payload));
            payload.ccc.id = I3C_CCC_ENTAS3(true);
            payload.ccc.data_len = 0U;
            ret = i3c_do_ccc(dev, &payload);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENTAS3 TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENTAS3 TEST END");                
        }
            break;
        case BCAST_CCC_DEFSLVS:
        case BCAST_CCC_SETMWL:
        {
            LOG_DBG("BCAST_CCC_SETMWL TEST START");
            struct i3c_ccc_mwl mwl = {.len = 24};
            ret = i3c_ccc_do_setmwl_all(dev, &mwl);
            if(ret) {
                LOG_ERR("BCAST_CCC_SETMWL TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_SETMWL TEST END");                
        }
            break;
        case BCAST_CCC_SETMRL:
        {
            LOG_DBG("BCAST_CCC_SETMRL TEST-1 START");
            struct i3c_ccc_mrl mrl = {.len = 24, .ibi_len = 4};
            ret = i3c_ccc_do_setmrl_all(dev, &mrl, true);
            if(ret) {
                LOG_ERR("BCAST_CCC_SETMRL TEST-1 FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_SETMRL TEST-1 END");                
            LOG_DBG("BCAST_CCC_SETMRL TEST-2 START");
            ret = i3c_ccc_do_setmrl_all(dev, &mrl, false);
            if(ret) {
                LOG_ERR("BCAST_CCC_SETMRL TEST-2 FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_SETMRL TEST-2 END");
        }
            break;
        case BCAST_CCC_ENTTM:
        {
            LOG_DBG("BCAST_CCC_ENTTM TEST-1 START");
            ret = i3c_ccc_do_enttm_all(dev, I3C_CCC_ENTTM_TM_VENDOR);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENTTM TEST-1 FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENTTM TEST-1 END");
            LOG_DBG("BCAST_CCC_ENTTM TEST-2 START");
            ret = i3c_ccc_do_enttm_all(dev, I3C_CCC_ENTTM_TM_EXIT);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENTTM TEST-2 FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENTTM TEST-2 END");
        }
            break;
        case BCAST_CCC_ENTHDR0:
        {
            LOG_DBG("BCAST_CCC_ENTHDR0 TEST START");
            ret = i3c_ccc_do_enthdr_all(dev, I3C_CCC_ENTHDR_DDR);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENTHDR0 TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENTHDR0 TEST END");                
        }
            break;
        case BCAST_CCC_ENTHDR1:
        {
            LOG_DBG("BCAST_CCC_ENTHDR1 TEST START");
            ret = i3c_ccc_do_enthdr_all(dev, I3C_CCC_ENTHDR_TSP);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENTHDR1 TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENTHDR1 TEST END");                
        }
            break;
        case BCAST_CCC_ENTHDR2:
        {
            LOG_DBG("BCAST_CCC_ENTHDR2 TEST START");
            ret = i3c_ccc_do_enthdr_all(dev, I3C_CCC_ENTHDR_TSL);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENTHDR2 TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENTHDR2 TEST END");                
        }
            break;
        case BCAST_CCC_ENTHDR3:
        {
            LOG_DBG("BCAST_CCC_ENTHDR3 TEST START");
            ret = i3c_ccc_do_enthdr_all(dev, I3C_CCC_ENTHDR_BT);
            if(ret) {
                LOG_ERR("BCAST_CCC_ENTHDR3 TEST FAILED [%d]!!", ret);    
            }
            LOG_DBG("BCAST_CCC_ENTHDR3 TEST END");                
        }
            break;
        /* We do not test the below CCCs */
        /* as they are reserved for future */
        /* definition by MIPI alliance */
        case BCAST_CCC_ENTHDR4:
            __fallthrough;
        case BCAST_CCC_ENTHDR5:
            __fallthrough;
        case BCAST_CCC_ENTHDR6:
            __fallthrough;
        case BCAST_CCC_ENTHDR7:
            __fallthrough;
        case BCAST_CCC_SETXTIME:
            __fallthrough;
        /* We do not test the below CCCs */
        /* as these are already tested */
        /* in bus init sequence */
        case BCAST_CCC_RSTDAA:
            __fallthrough;
        case BCAST_CCC_ENTDAA:
            __fallthrough;
        default:
            break;
    }
    
    return ret;
}

int test_ccc_direct(struct device *dev, enum direct_cc_list ccc_id)
{
    struct xec_i3c_config *cfg = (struct xec_i3c_config*)dev->config;
    struct i3c_device_desc *target = NULL;
    uint8_t num_i3c_tgts = cfg->common.dev_list.num_i3c;
    int i = 0, ret = 0;
    struct i3c_ccc_payload ccc_payload;
    struct i3c_ccc_target_payload ccc_tgt_payload;
    
    for(i = 0; i < num_i3c_tgts; i++)
    {
        target = &cfg->common.dev_list.i3c[i];
        LOG_DBG("DIRECTED CCC TESTING FOR TARGET 0x%02X", target->dynamic_addr);
        switch(ccc_id)
        {
            case DIRECT_CCC_ENEC:
            {
                LOG_DBG("DIRECT_CCC_ENEC TEST START");
                struct i3c_ccc_events events = {.events = I3C_CCC_ENEC_EVT_ALL};
                ret = i3c_ccc_do_events_set(target, true, &events);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_ENEC TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_ENEC TEST END");
            }
                break;
            case DIRECT_CCC_DISEC:
            {
                LOG_DBG("DIRECT_CCC_DISEC TEST START");
                struct i3c_ccc_events events = {.events = I3C_CCC_DISEC_EVT_ALL};
                ret = i3c_ccc_do_events_set(target, false, &events);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_DISEC TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_DISEC TEST END");
            }
                break;
            case DIRECT_CCC_ENTAS0:
            {
                LOG_DBG("DIRECT_CCC_ENTAS0 TEST START");
                memset(&ccc_tgt_payload, 0, sizeof(ccc_tgt_payload));
                ccc_tgt_payload.addr = target->dynamic_addr;
                ccc_tgt_payload.rnw = 0;
                ccc_tgt_payload.data_len = 0;

                memset(&ccc_payload, 0, sizeof(ccc_payload));
                ccc_payload.ccc.id = I3C_CCC_ENTAS0(false);
                ccc_payload.targets.payloads = &ccc_tgt_payload;
                ccc_payload.targets.num_targets = 1;
                ret = i3c_do_ccc(target->bus, &ccc_payload);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_ENTAS0 TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_ENTAS0 TEST END");                
            }
                break;
            case DIRECT_CCC_ENTAS1:
            {
                LOG_DBG("DIRECT_CCC_ENTAS1 TEST START");
                struct i3c_ccc_payload ccc_payload;
                struct i3c_ccc_target_payload ccc_tgt_payload;
                ccc_tgt_payload.addr = target->dynamic_addr;
                ccc_tgt_payload.rnw = 0;
                ccc_tgt_payload.data_len = 0;

                memset(&ccc_payload, 0, sizeof(ccc_payload));
                ccc_payload.ccc.id = I3C_CCC_ENTAS1(false);
                ccc_payload.targets.payloads = &ccc_tgt_payload;
                ccc_payload.targets.num_targets = 1;
                ret = i3c_do_ccc(target->bus, &ccc_payload);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_ENTAS1 TEST FAILED [%d]!!", ret);
                }
                LOG_DBG("DIRECT_CCC_ENTAS1 TEST END");                
            }
                break;
            case DIRECT_CCC_ENTAS2:
            {
                LOG_DBG("DIRECT_CCC_ENTAS2 TEST START");
                struct i3c_ccc_payload ccc_payload;
                struct i3c_ccc_target_payload ccc_tgt_payload;
                ccc_tgt_payload.addr = target->dynamic_addr;
                ccc_tgt_payload.rnw = 0;
                ccc_tgt_payload.data_len = 0;

                memset(&ccc_payload, 0, sizeof(ccc_payload));
                ccc_payload.ccc.id = I3C_CCC_ENTAS2(false);
                ccc_payload.targets.payloads = &ccc_tgt_payload;
                ccc_payload.targets.num_targets = 1;
                ret = i3c_do_ccc(target->bus, &ccc_payload);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_ENTAS2 TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_ENTAS2 TEST END");                
            }
                break;
            case DIRECT_CCC_ENTAS3:
            {
                LOG_DBG("DIRECT_CCC_ENTAS3 TEST START");
                struct i3c_ccc_payload ccc_payload;
                struct i3c_ccc_target_payload ccc_tgt_payload;
                ccc_tgt_payload.addr = target->dynamic_addr;
                ccc_tgt_payload.rnw = 0;
                ccc_tgt_payload.data_len = 0;

                memset(&ccc_payload, 0, sizeof(ccc_payload));
                ccc_payload.ccc.id = I3C_CCC_ENTAS3(false);
                ccc_payload.targets.payloads = &ccc_tgt_payload;
                ccc_payload.targets.num_targets = 1;
                ret = i3c_do_ccc(target->bus, &ccc_payload);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_ENTAS3 TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_ENTAS3 TEST END");                
            }
                break;
            case DIRECT_CCC_SETNEWDA:
                break;
            case DIRECT_CCC_SETMWL:
            {
                LOG_DBG("DIRECT_CCC_SETMWL TEST START");
                struct i3c_ccc_mwl mwl = {.len = 32};
                ret = i3c_ccc_do_setmwl(target, &mwl);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_SETMWL TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_SETMWL TEST END");                
            }
                break;
            case DIRECT_CCC_SETMRL:
            {
                LOG_DBG("DIRECT_CCC_SETMRL TEST START");
                struct i3c_ccc_mrl mrl = {.len = 32, .ibi_len = 4};
                ret = i3c_ccc_do_setmrl(target, &mrl);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_SETMRL TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_SETMRL TEST END");                
            }
                break;                    
            case DIRECT_CCC_GETMWL:
            {
                LOG_DBG("DIRECT_CCC_GETMWL TEST START");
                struct i3c_ccc_mwl mwl;
                ret = i3c_ccc_do_getmwl(target, &mwl);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_GETMWL TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_GETMWL TEST END");                
            }
                break;
            case DIRECT_CCC_GETMRL:
            {
                LOG_DBG("DIRECT_CCC_GETMRL TEST START");
                struct i3c_ccc_mrl mrl;
                ret = i3c_ccc_do_getmrl(target, &mrl);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_GETMRL TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_GETMRL TEST END");                
            }
                break;
            case DIRECT_CCC_GETPID:
            {
                LOG_DBG("DIRECT_CCC_GETPID TEST START");
                struct i3c_ccc_getpid pid;
                ret = i3c_ccc_do_getpid(target, &pid);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_GETPID TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_GETPID TEST END");                
            }
                break;
            case DIRECT_CCC_GETSTATUS:
            {
                LOG_DBG("DIRECT_CCC_GETSTATUS TEST START");
                union i3c_ccc_getstatus status;
                ret = i3c_ccc_do_getstatus(target, 
                                            &status, 
                                            GETSTATUS_FORMAT_1, 
                                            GETSTATUS_FORMAT_2_INVALID);
                if(ret) {
                    LOG_ERR("DIRECT_CCC_GETSTATUS TEST FAILED [%d]!!", ret);    
                }
                LOG_DBG("DIRECT_CCC_GETSTATUS TEST END");                
            }
                break;
            case DIRECT_CCC_GETACCMST:
                LOG_DBG("DIRECT_CCC_GETACCMST TEST START");
                LOG_DBG("DIRECT_CCC_GETACCMST TEST END");
                break;
            case DIRECT_CCC_GETMXDS:
                LOG_DBG("DIRECT_CCC_GETMXDS TEST START");
                LOG_DBG("DIRECT_CCC_GETMXDS TEST END");
                break;
            case DIRECT_CCC_GETHDRCAP:
                LOG_DBG("DIRECT_CCC_GETHDRCAP TEST START");
                LOG_DBG("DIRECT_CCC_GETHDRCAP TEST END");
                break;
            case DIRECT_CCC_SETXTIME:
                LOG_DBG("DIRECT_CCC_SETXTIME TEST START");
                LOG_DBG("DIRECT_CCC_SETXTIME TEST END");
                break;
            case DIRECT_CCC_GETXTIME:
                LOG_DBG("DIRECT_CCC_GETXTIME TEST START");
                LOG_DBG("DIRECT_CCC_GETXTIME TEST END");
                break;
            /* We do not test the below CCC */
            /* as we do not support bridged */
            /* targets now */
            case DIRECT_CCC_SETBRGTGT:
                __fallthrough;
            /* We do not test the below CCCs */
            /* as these are already tested */
            /* in bus init sequence */
            case DIRECT_CCC_GETBCR:
                __fallthrough;
            case DIRECT_CCC_GETDCR:
                __fallthrough;
            case DIRECT_CCC_RSTDAA:
                __fallthrough;
            case DIRECT_CCC_SETDASA:
                __fallthrough;
            default:
                break;
        }
    }
   
    return ret;
}


void test_bcast_ccc_all(struct device *dev)
{
    if (test_ccc_broadcast(dev, BCAST_CCC_ENEC)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_DISEC)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTAS0)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTAS1)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTAS2)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTAS3)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_RSTDAA)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTDAA)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_DEFSLVS)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_SETMWL)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_SETMRL)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTTM)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTHDR0)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTHDR1)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTHDR2)) {
        LOG_ERR("Test failed!!");
    }    
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTHDR3)) {
        LOG_ERR("Test failed!!");
    }    
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTHDR4)) {
        LOG_ERR("Test failed!!");
    }    
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTHDR5)) {
        LOG_ERR("Test failed!!");
    }    
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTHDR6)) {
        LOG_ERR("Test failed!!");
    }    
    if (test_ccc_broadcast(dev, BCAST_CCC_ENTHDR7)) {
        LOG_ERR("Test failed!!");
    }
    if (test_ccc_broadcast(dev, BCAST_CCC_SETXTIME)) {
        LOG_ERR("Test failed!!");
    }
}

void test_direct_ccc_all(struct device *dev)
{
    if(test_ccc_direct(dev, DIRECT_CCC_ENTAS0)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_ENTAS1)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_ENTAS2)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_ENTAS3)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_SETMWL)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_SETMRL)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_GETMWL)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_GETMRL)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_GETPID)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_GETBCR)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_GETDCR)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_GETSTATUS)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_GETACCMST)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_SETBRGTGT)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_GETMXDS)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_GETHDRCAP)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_SETXTIME)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_GETXTIME)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_RSTDAA)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_SETDASA)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_SETNEWDA)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_ENEC)) {
        LOG_ERR("Test failed!!");
    }
    if(test_ccc_direct(dev, DIRECT_CCC_DISEC)) {
        LOG_ERR("Test failed!!");
    }
}