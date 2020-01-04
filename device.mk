LOCAL_PATH := device/mobvoi/skipjack

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay


# Ramdisk
PRODUCT_PACKAGES += \
    fstab.skipjack \
    ueventd.skipjack.rc
