$(call inherit-product-if-exists, vendor/acer/a700/a700-vendor.mk)

# USB config contains product-specific USB id
PRODUCT_COPY_FILES += \
    device/acer/a700/prebuilt/ramdisk/init.acer.usb.rc:root/init.acer.usb.rc \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# So init files are copied properly in device_base.mk
PRODUCT_BOOTLOADER := picasso_mf

# Inherit t30-common
$(call inherit-product, device/acer/t30-common/device_base.mk)
