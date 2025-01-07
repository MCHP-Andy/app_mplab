/*
 * Copyright (c) 2015 Intel Corporation.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef ZEPHYR_INCLUDE_DEVICE_H_
#define ZEPHYR_INCLUDE_DEVICE_H_

#include <stdint.h>


#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Device Model
 * @defgroup device_model Device Model
 * @{
 */

/**
 * @brief Runtime device structure (in ROM) per driver instance
 */
struct device {
    /** Name of the device instance */
    const char *name;
    /** Address of device instance config information */
    const void *config;
    /** Address of the API structure exposed by the device instance */
    const void *api;
    /** Address of the common device state */
    struct device_state *state;
    /** Address of the device instance private data */
    void *data;
};



#ifdef __cplusplus
}
#endif

#endif /* ZEPHYR_INCLUDE_DEVICE_H_ */
