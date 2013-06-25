PRODUCT_MAKEFILES := \
	$(LOCAL_DIR)/cottoncandy.mk

ifndef SYSTEM_TARBALL_FORMAT
    SYSTEM_TARBALL_FORMAT := bz2
endif

vendor_tarball_name := vendor.tar
COTTONCANDY_VENDOR_DIR := vendor/fxi/cottoncandy/proprietary/system
INSTALLED_VENDORTARBALL_TARGET := $(vendor_tarball_name).$(SYSTEM_TARBALL_FORMAT)
VENDOR_COTTONCANDY_MK := vendor/fxi/cottoncandy/device-cottoncandy-proprietary-binary.mk

VENDOR_MK_CONTENT = 'LOCAL_PATH := vendor/fxi/cottoncandy\n\nPRODUCT_COPY_FILES += \\\n \
	\t$(COTTONCANDY_VENDOR_DIR)/lib/libMali.so:system/lib/libMali.so \\\n \
	\t$(COTTONCANDY_VENDOR_DIR)/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \\\n \
	\t$(COTTONCANDY_VENDOR_DIR)/lib/egl/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so \\\n \
	\t$(COTTONCANDY_VENDOR_DIR)/lib/egl/libEGL_mali.so:system/lib/egl/libEGL_mali.so \\\n \
	\t$(COTTONCANDY_VENDOR_DIR)/lib/egl/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so'

.PHONY: vendortarball
vendortarball: systemtarball
	@echo "Creating vendor package ..."
	$(hide) mkdir -p $(PRODUCT_OUT)/$(COTTONCANDY_VENDOR_DIR)/lib
	$(hide) mkdir -p $(PRODUCT_OUT)/$(COTTONCANDY_VENDOR_DIR)/lib/egl
	$(hide) cp $(PRODUCT_OUT)/system/lib/libMali.so \
		$(PRODUCT_OUT)/$(COTTONCANDY_VENDOR_DIR)/lib/
	$(hide) cp $(PRODUCT_OUT)/system/lib/egl/libGLES_android.so \
		$(PRODUCT_OUT)/$(COTTONCANDY_VENDOR_DIR)/lib/egl
	$(hide) cp $(PRODUCT_OUT)/system/lib/egl/libGLESv2_mali.so \
		$(PRODUCT_OUT)/$(COTTONCANDY_VENDOR_DIR)/lib/egl
	$(hide) cp $(PRODUCT_OUT)/system/lib/egl/libEGL_mali.so \
		$(PRODUCT_OUT)/$(COTTONCANDY_VENDOR_DIR)/lib/egl
	$(hide) cp $(PRODUCT_OUT)/system/lib/egl/libGLESv1_CM_mali.so \
		$(PRODUCT_OUT)/$(COTTONCANDY_VENDOR_DIR)/lib/egl

	# Create a make file for vendor tarball
	$(hide) echo -e $(VENDOR_MK_CONTENT) > $(PRODUCT_OUT)/$(VENDOR_COTTONCANDY_MK)

	$(call pretty,"Target vendor fs tarball: $(INSTALLED_VENDORTARBALL_TARGET)")
	$(hide) $(MKTARBALL) $(FS_GET_STATS) \
		$(PRODUCT_OUT) vendor $(vendor_tarball_name) \
		$(PRODUCT_OUT)/$(INSTALLED_VENDORTARBALL_TARGET)
