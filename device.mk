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

PRODUCT_COPY_FILES := \
	device/linaro/common/init.partitions-with-kernelpartition.rc:root/init.partitions.rc \
        device/fxi/cottoncandy/vold.fstab:system/etc/vold.fstab \
        device/fxi/cottoncandy/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
        device/fxi/cottoncandy/init.origen.rc:root/init.origen.rc \
        device/fxi/cottoncandy/init.origen.usb.rc:root/init.origen.usb.rc \
        device/fxi/cottoncandy/ueventd.origen.rc:root/ueventd.origen.rc \
        device/fxi/cottoncandy/initlogo.rle:root/initlogo.rle \
        device/fxi/cottoncandy/unidisplay_ts.idc:system/usr/idc/unidisplay_ts.idc \
        device/fxi/cottoncandy/gpio-keys.kcm:system/usr/keychars/gpio-keys.kcm \
        device/fxi/cottoncandy/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
        device/fxi/cottoncandy/wallpaper_info.xml:data/system/wallpaper_info.xml

PRODUCT_COPY_FILES += \
        frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        device/fxi/cottoncandyandroid.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES := \
        hwui.render_dirty_regions=false

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
        librs_jni \
        com.android.future.usb.accessory \
	camera.origen

# Filesystem management tools
PRODUCT_PACKAGES += \
        make_ext4fs

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

$(call inherit-product-if-exists, vendor/samsung/origen/device-origen.mk)
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
