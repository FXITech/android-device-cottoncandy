
$(PRODUCT_OUT)/u-boot.bin:
	ln -sf ../../../../device/fxi/cottoncandy/u-boot.bin $(PRODUCT_OUT)/u-boot.bin

$(PRODUCT_OUT)/u-boot-bl1.bin:
	ln -sf ../../../../device/fxi/cottoncandy/u-boot-bl1.bin $(PRODUCT_OUT)/u-boot-bl1.bin

.PHONY: u-boot-bl1
u-boot-bl1: $(PRODUCT_OUT)/u-boot-bl1.bin
	cp $(PRODUCT_OUT)/u-boot-bl1.bin $(PRODUCT_OUT)/boot

BOOTLOADER_TARGETS += u-boot-bl1
