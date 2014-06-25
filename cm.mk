## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := A700

# Boot Animation
TARGET_SCREEN_WIDTH := 1920
TARGET_SCREEN_HEIGHT := 1200

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/acer/a700/full_a700.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a700
PRODUCT_NAME := cm_a700
PRODUCT_BRAND := Acer
PRODUCT_MODEL := A700
PRODUCT_MANUFACTURER := Acer

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=a700_emea_fr \
    TARGET_DEVICE=picasso_mf \
    BUILD_FINGERPRINT="acer/a700_emea_fr/picasso_mf:4.1.1/JRO03H/1351003263:user/release-keys" \
    PRIVATE_BUILD_DESC="a700_emea_fr-user 4.1.1 JRO03H 1351003263 release-keys"
