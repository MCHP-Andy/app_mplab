
#include <stdio.h>
#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/sys/util.h>


#include <zephyr/logging/log.h>
LOG_MODULE_REGISTER(led, LOG_LEVEL_INF);

#define LED_STACK_SIZE 1024
#define LED_PRIORITY 5

#define SLEEP_TIME_MS   500

#define LED0_NODE DT_ALIAS(led0)
static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(LED0_NODE, gpios);

static void led_thread(void *, void *, void *) {
	int ret;

	if (!gpio_is_ready_dt(&led)) {
		return 0;
	}

	ret = gpio_pin_configure_dt(&led, GPIO_OUTPUT_ACTIVE);
	if (ret < 0) {
		return 0;
	}

	while (1) {
		ret = gpio_pin_toggle_dt(&led);
		if (ret < 0) {
			return 0;
		}

		k_msleep(SLEEP_TIME_MS);
	}

	return 0;
}

K_THREAD_DEFINE(led_tid, LED_STACK_SIZE,
                led_thread, NULL, NULL, NULL,
                LED_PRIORITY, 0, 0);
