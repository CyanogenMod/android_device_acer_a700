$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device (TODO)
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# TODO: LtoDownloader
# TODO: Figure out of we need NvCPLSvc, if so how do we make it work

$(call inherit-product-if-exists, vendor/acer/a700/a700-vendor.mk)

PRODUCT_AAPT_CONFIG := normal large xlarge hdpi
PRODUCT_AAPT_PREF_CONFIG := xlarge hdpi

DEVICE_PACKAGE_OVERLAYS += device/acer/a700/overlay

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    ro.carrier=wifi-only

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

include frameworks/native/build/tablet-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    device/acer/a700/prebuilt/ramdisk/init.picasso_mf.rc:root/init.picasso_mf.rc \
    device/acer/a700/prebuilt/ramdisk/fstab.picasso_mf:root/fstab.picasso_mf \
    device/acer/a700/prebuilt/ramdisk/ueventd.picasso_mf.rc:root/ueventd.picasso_mf.rc \
    device/acer/a700/prebuilt/ramdisk/init.picasso_mf.usb.rc:root/init.picasso_mf.usb.rc \

# TODO: Find what's needed
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_COPY_FILES += \
    device/acer/a700/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/acer/a700/prebuilt/etc/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    device/acer/a700/prebuilt/usr/idc/acer-touch.idc:system/usr/idc/acer-touch.idc \
    device/acer/a700/prebuilt/usr/keylayout/Acer-AK00LB.kl:system/usr/keylayout/Acer-AK00LB.kl \
    device/acer/a700/prebuilt/usr/keylayout/Acer-ICONIA-TAB-KB01.kl:system/usr/keylayout/Acer-ICONIA-TAB-KB01.kl \
    device/acer/a700/prebuilt/usr/keylayout/acer-dock.kl:system/usr/keylayout/acer-dock.kl \
    device/acer/a700/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# TODO: Find out which is necessary
PRODUCT_PACKAGES := \
    audio.primary.tegra \
    libaudioutils \
    audio.a2dp.default \
    audio.usb.default \
    librs_jni \
    make_ext4fs \
    setup_fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory

PRODUCT_CHARACTERISTICS := tablet

# Audio config
PRODUCT_COPY_FILES += \
    device/acer/a700/tiny_hw.xml:system/etc/sound/picasso_mf \
    device/acer/a700/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf

# media config xml file
PRODUCT_COPY_FILES += \
    device/acer/a700/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/acer/a700/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \

WIFI_BAND := 802_11_BG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

