# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/mobvoi/skipjack/device.mk)

## Inherit from our custom product configuration
#$(call inherit-product, vendor/omni/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := skipjack
PRODUCT_NAME := aosp_skipjack
PRODUCT_BRAND := mobvoi
PRODUCT_MODEL := TicWatch C2
PRODUCT_MANUFACTURER := Mobvoi
