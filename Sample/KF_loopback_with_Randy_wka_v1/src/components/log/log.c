#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>

#include "log.h"

static const char *log_level_name[] = {
    "none", "error", "warn", "info", "debug", "verbose",
};
static log_system_ms log_system_cb;
static log_level_t g_log_level = LOG_DEBUG;

void log_route(log_system_ms system_ms) { log_system_cb = system_ms; }

uint32_t log_timestamp() {
    if (log_system_cb != NULL)
        return log_system_cb();
    else
        return 0;
}

extern int sendchar (char c);
static char buff[1024] = {0};
void log_write(log_level_t level, const char *tag, const char *format,
                  ...) {
    if (g_log_level >= level) {
        uint16_t len = 0;
        va_list arg;
        va_start(arg, format);
        len = vsprintf(buff, format, arg);
        va_end(arg);

        for (size_t i = 0; i < len; i++)
            sendchar(buff[i]);
    }
}

void log_set_level(log_level_t level) { g_log_level = level; }

log_level_t log_get_level(void) { return g_log_level; }

const char *log_get_log_level_name(log_level_t level) {
    return log_level_name[level];
}
