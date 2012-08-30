/*
 * Copyright (C) 2011 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "tiny_hw_a1026"
#define LOG_NDEBUG 0

#include "a1026.h"

#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <cutils/log.h>
#include <sys/ioctl.h>

/* IOCTLs for Audience A1026 */
#define A1026_IOCTL_MAGIC 'u'
#define A1026_SET_CONFIG            _IOW(A1026_IOCTL_MAGIC, 0x05, enum A1026_TableID)
#define A1026_NOISE_LEVEL           _IOW(A1026_IOCTL_MAGIC, 0x06, enum Noise_Level_Value)

void a1026_init() {
    // Initialize A1026 chip required for audio playback
    // TODO: Implement in open-source
    void *lib = dlopen("liba1026.so", RTLD_NOW);
    if (lib == NULL) {
        ALOGE("Unable to load liba1026.so (%d)", errno);
        return errno;
    }

    ((void (*)(void)) dlsym(lib, "_Z10open_a1026v"))();
    ((void (*)(void)) dlsym(lib, "_Z17doA1026_Uart_initv"))();
    ((void (*)(void)) dlsym(lib, "_Z11close_a1026v"))();
}

int a1026_set_config(enum A1026_TableID mode) {
    int fd;
    int ret = 0;

    fd = open("/dev/audience_a1026", O_RDWR | O_NONBLOCK);
    if (fd < 0) {
        ALOGE("Unable to open A1026 chip (%d)", errno);
        return -1;
    }

    if (ioctl(fd, A1026_SET_CONFIG, &mode) < 0) {
        ALOGE("Unable to set mode to %d (%d)", mode, errno);
        ret = -1;
        goto out;
    }
out:
    close(fd);
    return ret;
}
