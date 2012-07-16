# config.mk
# 
# Product-specific compile-time definitions.
#

TARGET_BOARD_PLATFORM := cottoncandy
TARGET_SOC := exynos4210
TARGET_NO_BOOTLOADER := true # Uses u-boot instead 
TARGET_NO_KERNEL := false
KERNEL_CONFIG := android_origen_defconfig
TARGET_USE_UBOOT := true
UBOOT_CONFIG := cottoncandy_config
TARGET_USE_XLOADER := false
XLOADER_BINARY := out/target/product/cottoncandy/obj/u-boot/mmc_spl/u-boot-mmc-spl.bin
TARGET_NO_RECOVERY := true
TARGET_NO_RADIOIMAGE := true
TARGET_CPU_SMP := true
BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := true
OMAP_ENHANCEMENT := false
HARDWARE_OMX := true
USE_CAMERA_STUB := true
BOARD_USES_HGL := true
BOARD_USES_I2S_AUDIO := true
BOARD_USE_V4L2 := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := false
BOARD_HAVE_BLUETOOTH_CSR := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# TODO(havardk): This causes libhardware_legacy to load the kernel module.
# Tuna does not use this, so should be unnecessary.  Figure it out.
WIFI_DRIVER_MODULE_PATH := "/system/modules/bcmdhd.ko"
WIFI_DRIVER_MODULE_NAME := "bcmdhd"


# Set build properties
#ADDITIONAL_BUILD_PROPERTIES += ro.opengles.version=131072


TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

# Enable NEON feature
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

EXTRA_PACKAGE_MANAGEMENT := false

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

USE_OPENGL_RENDERER := true

# bootargs
BOARD_KERNEL_CMDLINE := console=ttySAC2 root=/dev/mmcblk0p2

# Origen uses an Exynos4 -- Cortex A9
TARGET_EXTRA_CFLAGS += $(call cc-option,-mtune=cortex-a9,$(call cc-option,-mtune=cortex-a8)) $(call cc-option,-mcpu=cortex-a9,$(call cc-option,-mcpu=cortex-a8))

# ARMs gator (DS-5)
TARGET_USE_GATOR := true

BOARD_HAVE_CODEC_SUPPORT := SAMSUNG_CODEC_SUPPORT
#BOARD_HAVE_HDMI_SUPPORT := SAMSUNG_HDMI_SUPPORT
