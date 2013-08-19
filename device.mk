# Copyright (C) 2012 FXI Technologies AS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/fxi/cottoncandy

include $(LOCAL_PATH)/BoardConfig.mk

PRODUCT_COPY_FILES += \
        device/fxi/cottoncandy/init.partitions-with-kernelpartition.rc:root/init.partitions.rc \
        device/fxi/cottoncandy/vold.fstab:system/etc/vold.fstab \
        device/fxi/cottoncandy/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
        device/fxi/cottoncandy/init.cottoncandy.rc:root/init.cottoncandy.rc \
        device/fxi/cottoncandy/init.cottoncandy.usb.rc:root/init.cottoncandy.usb.rc \
        device/fxi/cottoncandy/ueventd.cottoncandy.rc:root/ueventd.cottoncandy.rc \
        device/fxi/cottoncandy/initlogo.rle:root/initlogo.rle \
        device/fxi/cottoncandy/unidisplay_ts.idc:system/usr/idc/unidisplay_ts.idc \
        device/fxi/cottoncandy/gpio-keys.kcm:system/usr/keychars/gpio-keys.kcm \
        device/fxi/cottoncandy/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
        device/fxi/cottoncandy/wallpaper_info.xml:data/system/wallpaper_info.xml \
        device/fxi/cottoncandy/HDMI_CEC_event.kl:system/usr/keylayout/HDMI_CEC_event.kl

PRODUCT_COPY_FILES += \
        frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        device/fxi/cottoncandy/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
        device/fxi/cottoncandy/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
        device/fxi/cottoncandy/bcm4329.hcd:system/etc/bluetooth/bcm4329.hcd

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
        hwui.render_dirty_regions=false

PRODUCT_CHARACTERISTICS := tablet,nosdcard
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	wifi.interface=wlan0

PRODUCT_PACKAGES += \
        librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
        make_ext4fs

# su to become superuser
PRODUCT_PACKAGES += \
	su

# FXI Config app
PRODUCT_PACKAGES += \
	fxiconfig

#	audio.a2dp.default \
#	libaudioutils
#
## ULP Audio
#ifeq ($(USE_ULP_AUDIO),true)
#PRODUCT_PACKAGES += \
#	libaudiohw \
#	MusicULP \
#	libsa_jni
#endif

# ALP Audio
ifeq ($(BOARD_USE_ALP_AUDIO),true)
PRODUCT_PACKAGES += \
	libOMX.SEC.MP3.Decoder
endif

## Camera
PRODUCT_PACKAGES += \
	camera.cottoncandy

ifeq ($(BOARD_USE_BELLAGIO_OMX),true)
PRODUCT_PACKAGES += \
	omxregister-bellagio \
	libomxil-bellagio_lib
endif

# Add opcontrol and oprofiled for profiling using oprofile
PRODUCT_PACKAGES += \
	opcontrol \
	oprofiled

## Video Editor
#PRODUCT_PACKAGES += \
#	VideoEditorGoogle

## Misc other modules
PRODUCT_PACKAGES += \
	gralloc.cottoncandy

#PRODUCT_PACKAGES += \
#	hwcomposer.cottoncandy

# OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/fxi/cottoncandy/media_profiles.xml:system/etc/media_profiles.xml


PRODUCT_PACKAGES += \
	brcm_patchram_plus

# MFC firmware
PRODUCT_COPY_FILES += \
	device/fxi/cottoncandy/mfc_fw.bin:system/etc/firmware/s5p-mfc.fw

PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

$(call inherit-product-if-exists, vendor/fxi/cottoncandy/device-cottoncandy.mk)
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/fxi/cottoncandy/wlan/device-bcm.mk)
