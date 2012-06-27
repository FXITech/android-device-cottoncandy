# stuff common to all Linaro LEB
include $(LOCAL_PATH)/ZeroXBenchmark.mk

PRODUCT_PACKAGES := \
    AccountAndSyncSettings \
    AlarmClock \
    AlarmProvider \
    Bluetooth \
    Calculator \
    Calendar \
    Camera \
    CertInstaller \
    DrmProvider \
    Email \
    Gallery3D \
    LatinIME \
    Launcher2 \
    Mms \
    Music \
    Provision \
    Settings \
    SystemUI \
    Sync \
    Updater \
    CalendarProvider \
    SyncProvider \
    faketsd \
    ZeroXBenchmark \
    hwcomposer.default \
    libmicro \
    powertop \
    mmtest \
    $(ZEROXBENCHMARK_NATIVE_APPS) \
    GLMark2 \
    libglmark2-android \
    gatord \
    LinaroWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    mediaframeworktest \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \
    libaudioutils \
    ConnectivityManagerTest \
    iozone \
    memtester \
    stress \
    stressapptest \
    DisableSuspend \
    libncurses \
    htop

#packages we are using for benchmarking
PRODUCT_PACKAGES += \
    v8shell \
    skia_bench

V8BENCHMARKS := $(foreach js,$(wildcard $(TOP)/external/v8/benchmarks/*.js),\
	$(js):data/benchmark/v8/$(notdir $(js)))

PRODUCT_COPY_FILES := \
	device/linaro/common/wallpaper_info.xml:data/system/wallpaper_info.xml \
	device/linaro/common/disablesuspend.sh:system/bin/disablesuspend.sh \
	$(V8BENCHMARKS)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)
