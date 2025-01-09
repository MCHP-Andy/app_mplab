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
#include "crc8.h"

static int tgt0_write_requested_cb(struct i3c_target_config *config);
static int tgt0_write_received_cb(struct i3c_target_config *config, uint8_t *val, uint16_t len);
static int tgt0_read_requested_cb(struct i3c_target_config *config, uint8_t *val);
static int tgt0_read_processed_cb(struct i3c_target_config *config, uint8_t *val);
static int tgt0_stop_cb(struct i3c_target_config *config);
static void tgt0_tx_done_cb(struct i3c_target_config *config,
				 uint8_t status, uint16_t rem_len);

struct i3c_target_callbacks tgt0_cbs= {
    .write_requested_cb   = tgt0_write_requested_cb,
#ifdef USE_MCHP_H3_CHANGES    
    .write_received_cb    = tgt0_write_received_cb,
    .tx_done_cb           = tgt0_tx_done_cb,
#endif    
    .read_requested_cb    = tgt0_read_requested_cb,
    .read_processed_cb    = tgt0_read_processed_cb,
    .stop_cb              = tgt0_stop_cb,
};

struct i3c_target_config tgt0_cfg;

extern int DRV_I3C_target_tx_write(const struct device *dev, uint8_t *buf, uint16_t len);
#define WRITE_SIZE 128
// uint8_t tx_buff[20] = { 0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xf9, 0xfa,
//                         0x0a, 0x09, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01,
//                     };
// uint8_t rx_buff[10];
uint8_t tx_buff[WRITE_SIZE];
uint8_t rx_buff[512];

static int tgt0_write_requested_cb(struct i3c_target_config *config)
{
    LOG_DBG("[%s]", __FUNCTION__);
    return 0;
}
#ifdef USE_MCHP_H3_CHANGES
static int tgt0_write_received_cb(struct i3c_target_config *config, uint8_t *val, uint16_t len)
{
    uint8_t crc8 = 0;
    uint8_t addr_rnw = 0;

    addr_rnw = (config->address << 1);
    if(NULL != val && len > 0)
    {
        LOG_DBG("[%s] DA = 0x%02x received %d bytes", __FUNCTION__, addr_rnw, len);

        memset(&rx_buff[0], 0x00, sizeof(rx_buff));
        // memcpy(&rx_buff[0], val, len);
        // for(int i=0; i<len; i++) {
        //     LOG_DBG("Data => 0x%02x", val[i]);
        // }
        print_buf(val, len);
    }
    
    // crc8 = crc8_init();
    // crc8 = crc8_update(crc8, &addr_rnw, 1);
    // crc8 = crc8_update(crc8, &rx_buff[0], len - 1);
    // if(crc8 == rx_buff[len-1]) {
    //     LOG_DBG("CRC Passed - calc = 0x%02x, rx = 0x%02x!!", crc8, rx_buff[len-1]);
    // } else {
    //     LOG_DBG("CRC Failed - calc = 0x%02x, rx = 0x%02x!!", crc8, rx_buff[len-1]);
    // }

    return 0;
}

static void tgt0_tx_done_cb(struct i3c_target_config *config,
				 uint8_t status, uint16_t rem_len)
{
    LOG_DBG("[%s] tgt0_tx_done_cb sts = 0x%02x not sent %d bytes", __FUNCTION__, status, rem_len);
}
#else
static int tgt0_write_received_cb(struct i3c_target_config *config, uint8_t val)
{
    LOG_DBG("[%s] Data => 0x%02x", __FUNCTION__, val);
    return 0;
}
#endif
static int tgt0_read_requested_cb(struct i3c_target_config *config, uint8_t *val)
{
    LOG_DBG("[%s]", __FUNCTION__);
    return 0;
}

static int tgt0_read_processed_cb(struct i3c_target_config *config, uint8_t *val)
{
    LOG_DBG("[%s]", __FUNCTION__);
    return 0;
}

static int tgt0_stop_cb(struct i3c_target_config *config)
{
    LOG_DBG("[%s]", __FUNCTION__);
    return 0;
}

static int tgt_test_xfer_controller_write(struct device *dev)
{
    int ret = 0;

    if(NULL == dev) {
        goto tgt_test_xfer_controller_write_exit;
    }

    tgt0_cfg.callbacks = &tgt0_cbs;
    i3c_target_register(dev, &tgt0_cfg);

tgt_test_xfer_controller_write_exit:
    return ret;
}

static int tgt_test_xfer_controller_read(struct device *dev)
{
    int ret = 0;

    if(NULL == dev) {
        goto tgt_test_xfer_controller_read_exit;
    }
    memset(tx_buff, 0xFF, sizeof(tx_buff));

    // DRV_I3C_target_tx_write(dev, tx_buff, 2);
    // DRV_I3C_target_tx_write(dev, tx_buff, 3);
    // DRV_I3C_target_tx_write(dev, tx_buff, 4);
    DRV_I3C_target_tx_write(dev, tx_buff, sizeof(tx_buff));

tgt_test_xfer_controller_read_exit:
    return ret;
}

int tgt_test_xfers_all(struct device *dev)
{
    int ret = 0;

    tgt_test_xfer_controller_write(dev);
    tgt_test_xfer_controller_read(dev);

    return ret;
}