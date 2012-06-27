# The Samsung Origen low cost board
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/fxi/cottoncandy/common.mk)
$(call inherit-product, device/fxi/cottoncandy/device.mk)

PRODUCT_BRAND := cStick
PRODUCT_DEVICE := cottoncandy
PRODUCT_NAME := cottoncandy
PRODUCT_MODEL := cottoncandy
PRODUCT_MANUFACTURER := FXI Technologies
