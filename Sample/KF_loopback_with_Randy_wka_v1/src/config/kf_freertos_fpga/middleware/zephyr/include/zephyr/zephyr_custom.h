/*
 * Copyright 2022 Intel Corporation
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef ZEPHYR_INCLUDE_ZEPHYR_CUSTOM_H_
#define ZEPHYR_INCLUDE_ZEPHYR_CUSTOM_H_

#include <string.h>

#include "debug/trace.h"

#define __subsystem
#define __syscall
#define ARG_UNUSED(x)
#define device_is_ready(x)  0

#define __fallthrough
#define __ASSERT_NO_MSG(x)
#define LOG_DBG(...) do { tracex(__VA_ARGS__); tracex("\r\n"); } while(0)
#define LOG_ERR(...) do { tracex(__VA_ARGS__); tracex("\r\n"); } while(0)
/**
 * @brief Writes a DEBUG level message to the log.
 *
 * @details It's meant to write developer oriented information.
 *
 * @param _data   Pointer to the data to be logged.
 * @param _length Length of data (in bytes).
 * @param _str    Persistent, raw string.
 */
#define LOG_HEXDUMP_DBG(_data, _length, _str) \
	do { tracex(_str); print_buf(_data, _length); } while(0)

/**
 * @brief Writes an ERROR level hexdump message to the log.
 *
 * @details It's meant to report severe errors, such as those from which it's
 * not possible to recover.
 *
 * @param _data   Pointer to the data to be logged.
 * @param _length Length of data (in bytes).
 * @param _str    Persistent, raw string.
 */
#define LOG_HEXDUMP_ERR(_data, _length, _str) \
	do { tracex(_str); print_buf(_data, _length); } while(0)

/* Use default config values from Zephyr I3C Kconfig */
#define CONFIG_I3C_IBI_WORKQUEUE_LENGTH     8
#define CONFIG_I3C_IBI_WORKQUEUE_STACK_SIZE 1024

struct k_work;

/** @brief The signature for a work item handler function.
 *
 * The function will be invoked by the thread animating a work queue.
 *
 * @param work the work item that provided the handler.
 */
typedef void (*k_work_handler_t)(struct k_work *work);

/** @brief A structure holding optional configuration items for a work
 * queue.
 *
 * This structure, and values it references, are not retained by
 * k_work_queue_start().
 */
struct k_work_queue_config {
	/** The name to be given to the work queue thread.
	 *
	 * If left null the thread will not have a name.
	 */
	const char *name;

	/** Control whether the work queue thread should yield between
	 * items.
	 *
	 * Yielding between items helps guarantee the work queue
	 * thread does not starve other threads, including cooperative
	 * ones released by a work item.  This is the default behavior.
	 *
	 * Set this to @c true to prevent the work queue thread from
	 * yielding between items.  This may be appropriate when a
	 * sequence of items should complete without yielding
	 * control.
	 */
	bool no_yield;
};


/** @brief A structure used to hold work until it can be processed. */
struct k_work_q {
	/* The thread that animates the work. */
	//struct k_thread thread;

	/* All the following fields must be accessed only while the
	 * work module spinlock is held.
	 */

	/* List of k_work items to be worked. */
	sys_slist_t pending;

	/* Wait queue for idle work thread. */
	//_wait_q_t notifyq;

	/* Wait queue for threads waiting for the queue to drain. */
	//_wait_q_t drainq;

	/* Flags describing queue state. */
	uint32_t flags;
};

/** @brief A structure used to submit work. */
struct k_work {
	/* All fields are protected by the work module spinlock.  No fields
	 * are to be accessed except through kernel API.
	 */

	/* Node to link into k_work_q pending list. */
	sys_snode_t node;

	/* The function to be invoked by the work queue thread. */
	k_work_handler_t handler;

	/* The queue on which the work item was last submitted. */
	//struct k_work_q *queue;

	/* State of the work item.
	 *
	 * The item can be DELAYED, QUEUED, and RUNNING simultaneously.
	 *
	 * It can be RUNNING and CANCELING simultaneously.
	 */
	uint32_t flags;
};


#endif /* ZEPHYR_INCLUDE_ZEPHYR_CUSTOM_H_ */