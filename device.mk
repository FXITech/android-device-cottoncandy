# Copyright (C) 2011 Linaro Limited
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
	device/fxi/exynos4/lib/mali_ump/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
	device/fxi/exynos4/lib/mali_ump/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
	device/fxi/exynos4/lib/mali_ump/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so \
	device/fxi/exynos4/lib/mali_ump/libMali.so:system/lib/libMali.so \
	device/fxi/exynos4/lib/mali_ump/libMali.so:obj/lib/libMali.so \
	device/fxi/exynos4/lib/mali_ump/libUMP.so:system/lib/libUMP.so \
	device/fxi/exynos4/lib/mali_ump/libUMP.so:obj/lib/libUMP.so \
	device/fxi/exynos4/lib/mali_ump/libion.so:system/lib/libion.so \
	device/fxi/exynos4/lib/mali_ump/libion.so:obj/lib/libion.so

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
        device/fxi/cottoncandy/wallpaper_info.xml:data/system/wallpaper_info.xml

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
	ro.opengles.version=131072


PRODUCT_PACKAGES += \
        librs_jni \
        com.android.future.usb.accessory \
	camera.origen

# Filesystem management tools
PRODUCT_PACKAGES += \
        make_ext4fs


# Samsung BSP libraries
PRODUCT_PACKAGES += \
	libSEC_OMX_CORE
#	libsecosal \

## audio
#PRODUCT_PACKAGES += \
#	audio_policy.smdkv310 \
#	audio.primary.smdkv310 \
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
#PRODUCT_PACKAGES += \
#	camera.smdkv310

# Libs
PRODUCT_PACKAGES += \
	libcamera \
	libstagefrighthw \
	com.android.future.usb.accessory

## Video Editor
#PRODUCT_PACKAGES += \
#	VideoEditorGoogle

## Misc other modules
#PRODUCT_PACKAGES += \
#	lights.smdkv310 \
#	gralloc.smdkv310

PRODUCT_PACKAGES += \
	hwcomposer.cottoncandy

# OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/smdkv310/media_profiles.xml:system/etc/media_profiles.xml

# OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core \
	libSEC_OMX_Resourcemanager \
	libOMX.SEC.AVC.Decoder \
	libOMX.SEC.M4V.Decoder \
	libOMX.SEC.M4V.Encoder \
	libOMX.SEC.AVC.Encoder

## hwconvertor modules
PRODUCT_PACKAGES += \
	libhwconverter \

# MFC firmware
PRODUCT_COPY_FILES += \
	device/fxi/exynos4/firmware/mfc_fw.bin:system/etc/firmware/mfc_fw.bin

## Input device calibration files
#PRODUCT_COPY_FILES += \
#	device/samsung/smdkv310/S3C24XX_TouchScreen.idc:system/usr/idc/S3C24XX_TouchScreen.idc \
#	device/samsung/smdkv310/s5pc210_ts.idc:system/usr/idc/s5pc210_ts.idc \

PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml


DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

$(call inherit-product-if-exists, vendor/fxi/cottoncandy/device-cottoncandy.mk)
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
