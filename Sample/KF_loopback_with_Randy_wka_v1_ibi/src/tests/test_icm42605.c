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
#include "test_icm42605.h"

uint8_t test_icm42605_bank_get(struct i3c_device_desc *target)
{
    uint8_t temp = 0;
    i3c_reg_read_byte(target, ICM42605_REG_BANK_SEL, &temp);
    return temp;
}

uint8_t test_icm42605_bank_change(struct i3c_device_desc *target, uint8_t bank_num)
{
    i3c_reg_write_byte(target, ICM42605_REG_BANK_SEL, bank_num);
}

int test_icm42605_init(struct i3c_device_desc *target, 
                        uint8_t Ascale, 
                        uint8_t Gscale, 
                        uint8_t AODR, 
                        uint8_t GODR)
{
    uint8_t temp = 0;

    i3c_reg_read_byte(target, ICM42605_PWR_MGMT0, &temp);           // make sure not to disturb reserved bit values
    i3c_reg_write_byte(target, ICM42605_PWR_MGMT0, (temp | 0x0FU));          // enable gyro and accel in low noise mode

    i3c_reg_read_byte(target, ICM42605_GYRO_CONFIG0, &temp);
    i3c_reg_write_byte(target, ICM42605_GYRO_CONFIG0, (temp | GODR | Gscale << 5U));       // gyro full scale and data rate

    i3c_reg_read_byte(target, ICM42605_ACCEL_CONFIG0, &temp);
    i3c_reg_write_byte(target, ICM42605_ACCEL_CONFIG0, (temp | AODR | Ascale << 5U));      // set accel full scale and data rate

    i3c_reg_read_byte(target, ICM42605_GYRO_CONFIG1, &temp);
    i3c_reg_write_byte(target, ICM42605_GYRO_CONFIG1, (temp | 0xD0U));       // set temperature sensor low pass filter to 5Hz, use first order gyro filter

    i3c_reg_read_byte(target, ICM42605_INT_CONFIG, &temp);
    i3c_reg_write_byte(target, ICM42605_INT_CONFIG, (temp | 0x18U | 0x03U));         // set both interrupts active high, push-pull, pulsed

    i3c_reg_read_byte(target, ICM42605_INT_CONFIG1, &temp);
    i3c_reg_write_byte(target, ICM42605_INT_CONFIG1, (temp & ~(0x10U)));        // set bit 4 to zero for proper function of INT1 and INT2

    i3c_reg_read_byte(target, ICM42605_INT_SOURCE0, &temp);
    i3c_reg_write_byte(target, ICM42605_INT_SOURCE0, (temp | 0x08U));        // route data ready interrupt to INT1

    i3c_reg_read_byte(target, ICM42605_INT_SOURCE3, &temp);
    i3c_reg_write_byte(target, ICM42605_INT_SOURCE3, (temp | 0x01U));        // route AGC interrupt interrupt to INT2

    // Select Bank 4
    i3c_reg_read_byte(target, ICM42605_REG_BANK_SEL, &temp);
    i3c_reg_write_byte(target, ICM42605_REG_BANK_SEL, (temp | 0x04U));       // select Bank 4

    i3c_reg_read_byte(target, ICM42605_APEX_CONFIG5, &temp);
    i3c_reg_write_byte(target, ICM42605_APEX_CONFIG5, (temp & ~(0x07U)));       // select unitary mounting matrix

    i3c_reg_read_byte(target, ICM42605_INT_SOURCE8, &temp);
    i3c_reg_write_byte(target, ICM42605_INT_SOURCE8, (0x01U << 0x03));       // Enable data ready IBI

    i3c_reg_read_byte(target, ICM42605_REG_BANK_SEL, &temp);
    i3c_reg_write_byte(target, ICM42605_REG_BANK_SEL, (temp & ~(0x07U)));       // select Bank 0

    i3c_reg_write_byte(target, ICM42605_INT_CONFIG0, (0x02U << 4));
}

void test_icm42605_reset(struct i3c_device_desc *target)
{
  // reset device
  uint8_t temp = 0;
  i3c_reg_read_byte(target, ICM42605_DEVICE_CONFIG, &temp);
  temp = (temp | 0x01U);
  i3c_reg_write_byte(target, ICM42605_DEVICE_CONFIG, temp); // Set bit 0 to 1 to reset ICM42605
}

uint8_t test_icm42605_getChipID(struct i3c_device_desc *target)
{
    uint8_t id = 0, temp = 0;
    
    i3c_reg_read_byte(target, ICM42605_REG_BANK_SEL, &temp);
    i3c_reg_write_byte(target, ICM42605_REG_BANK_SEL, (temp & ~(0x07U)));       // select Bank 0
    i3c_reg_read_byte(target, ICM42605_WHO_AM_I, &id);

    return id;
}

uint8_t test_icm42605_status(struct i3c_device_desc *target)
{
  uint8_t temp = 0, old_bank = 0;

  old_bank = test_icm42605_bank_get(target); // save 
  test_icm42605_bank_change(target, 0U); // change to bank 0
  i3c_reg_read_byte(target, ICM42605_INT_STATUS, &temp);
  test_icm42605_bank_change(target, old_bank);

  return temp;
}

void test_icm42605_readTempData(struct i3c_device_desc *target, int16_t *temp)
{
    uint8_t rawData[2];

    i3c_reg_read_byte(target, ICM42605_TEMP_DATA1, &rawData[0]);
    i3c_reg_read_byte(target, ICM42605_TEMP_DATA0, &rawData[1]);

    *temp = ((int16_t)rawData[0] << 8U) | rawData[1] ;  // Turn the MSB and LSB into a signed 16-bit value
}

static int test_icm42605_ibi_cb (struct i3c_device_desc *target, struct i3c_ibi_payload *payload)
{
    int ret = 0;
    int16_t temp_data = 0;
    
    i3c_ibi_disable(target);

    LOG_DBG("Enter [%s]", __FUNCTION__);
    
    if(target == NULL || payload == NULL) {
      ret = -1;
      goto test_icm42605_ibi_cb_exit;
    }

    (void)test_icm42605_status(target); // dummy read the status register
    test_icm42605_readTempData(target, &temp_data);
    temp_data = (int16_t)(((float)temp_data/132.48f)+25u);
    LOG_DBG("[%s] temp_data = %d", __FUNCTION__, temp_data);
    i3c_ibi_enable(target);
    
test_icm42605_ibi_cb_exit:
    return ret;
}

int test_icm42605_all(struct device *dev)
{
    struct xec_i3c_config *dev_cfg = (struct xec_i3c_config*)dev->config;
    uint8_t num_i3c_tgts = dev_cfg->common.dev_list.num_i3c;
    struct i3c_device_desc *target = NULL;
    int i = 0, ret = 0;
    /* Specify sensor parameters (sample rate is twice the bandwidth)*/
    uint8_t Ascale = AFS_2G;
    uint8_t Gscale = GFS_250DPS;
    uint8_t AODR = AODR_1000Hz;
    uint8_t GODR = GODR_1000Hz;

    for(i=0; i<num_i3c_tgts; i++)
    {
        target = &dev_cfg->common.dev_list.i3c[i];

        if (0x046A00000000 != target->pid) {
            LOG_ERR("Not a ICM42605 device!!");
            ret = -1;
            continue;
        }

        target->ibi_cb = test_icm42605_ibi_cb;

        test_icm42605_init(target, Ascale, Gscale, AODR, GODR);
        LOG_DBG("ICM42605 CHIP ID : 0x%02X", test_icm42605_getChipID(target));
        i3c_ibi_enable(target);
    }

    return ret;
}