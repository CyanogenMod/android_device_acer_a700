/*
 * Copyright (C) 2012 The CyanogenMod Project
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

#define LOG_TAG "a1026_init"
#define LOG_NDEBUG 0

#include <cutils/log.h>
#include <dlfcn.h>
#include <errno.h>

int main() {
    // Initialize A1026 chip required for audio playback
    void *lib = dlopen("liba1026.so", RTLD_NOW);
    if (lib == NULL) {
        ALOGE("Unable to load liba1026.so (%d)", errno);
        return errno;
    }

    ((void (*)(void)) dlsym(lib, "_Z10open_a1026v"))();
    ((void (*)(void)) dlsym(lib, "_Z17doA1026_Uart_initv"))();
    ((void (*)(void)) dlsym(lib, "_Z16doA1026_I2C_initv"))();
    ((void (*)(void)) dlsym(lib, "_Z11close_a1026v"))();
    return 0;
}