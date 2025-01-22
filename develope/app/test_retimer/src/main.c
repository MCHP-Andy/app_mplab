/*
 * Copyright (c) 2012-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

/* 1000 msec = 1 sec */
#define SLEEP_TIME_MS   1000

/* The devicetree node identifier for the "led0" alias. */
#define LED1_NODE DT_ALIAS(led1)

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>

#if 1
// implement i2c burst write function
//
bool PS8833_WriteBurst(uint8_t I2cSlaveAddress, uint8_t Offset, uint8_t *DataBuffer,
                       int DataBufferSize) {
    bool bStatus;

	printf("PS8833_Write: addr: 0x%02x\n", I2cSlaveAddress);

    bStatus = 1;

    return bStatus;
}

// implement i2c burst read function
//
bool PS8833_ReadBurst(uint8_t I2cSlaveAddress, uint8_t Offset, uint8_t *DataBuffer,
                      int DataBufferSize) {
    bool bStatus;

	printf("PS8833_Read: addr: 0x%02x\n", I2cSlaveAddress);

    bStatus = 1;

    return bStatus;
}

extern int sum (int a, int b);
extern bool PS8833_FirmwareErase();

#endif

/*
 * A build error on this line means your board is unsupported.
 * See the sample documentation for information on how to fix this.
 */
static const struct gpio_dt_spec led1 = GPIO_DT_SPEC_GET(LED1_NODE, gpios);

int main(void)
{
	printf("Hello World! %s\n", CONFIG_BOARD_TARGET);

	if (!gpio_is_ready_dt(&led1)) {
		return 0;
	}

	int ret = gpio_pin_configure_dt(&led1, GPIO_OUTPUT_ACTIVE);
	if (ret < 0) {
		return 0;
	}

	printf("sum(1, 2) = %d\n", sum(1, 2));

	printf("PS8833_FirmwareErase Start\n");
	PS8833_FirmwareErase();
	printf("PS8833_FirmwareErase Finish\n");

	while(1) {
		gpio_pin_set_dt(&led1, 0);
		k_msleep(SLEEP_TIME_MS);

		gpio_pin_set_dt(&led1, 1);
		k_msleep(SLEEP_TIME_MS);
	}

	return 0;
}
