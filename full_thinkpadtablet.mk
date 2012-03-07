# Copyright (C) 2011 The Android Open Source Project
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



# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# Languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
# Propitary files
$(call inherit-product, $(LOCAL_PATH)/proprietary/thinkpadtablet-vendor-blobs.mk)
# Different Configfiles
$(call inherit-product, $(LOCAL_PATH)/configfiles/thinkpadtablet-configs.mk)
# Gapps
$(call inherit-product, $(LOCAL_PATH)/gapps/gapps.mk)

#Included other Packages
PRODUCT_PACKAGES := \
    Camera \
    su \
    Superuser \
    Trebuchet \
    make_ext4fs \
    librs_jni \

#Live Wallpaper
PRODUCT_PACKAGES := \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

#Packages for Audio
PRODUCT_PACKAGES += \
    libtinyalsa \
    audio.primary.ventana \
    tinyplay \
    tinymix \
    tinycap

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/lenovo/thinkpadtablet/zImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#For Chrome
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_ID=IML74K

# Names
PRODUCT_NAME := full_thinkpadtablet
PRODUCT_DEVICE := thinkpadtablet
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full CM9 on ThinkPad Tablet

#Configs for build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version = 131072 \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.dexopt-flags=m=y \
    wifi.interface=wlan0 \
    ro.sf.lcd_density=150 

# Device Overlays
DEVICE_PACKAGE_OVERLAYS += device/lenovo/thinkpadtablet/overlay

# This is a tablet
PRODUCT_CHARACTERISTICS := tablet

# Use HDPI artwork
PRODUCT_LOCALES += hdpi

# CM9 Green Fix
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS -DBOARD_USES_ALSA_AUDIO

# Get files for bootimg
PRODUCT_COPY_FILES += \
    device/lenovo/thinkpadtablet/ramdisk/default.prop:root/default.prop \
    device/lenovo/thinkpadtablet/ramdisk/init.ventana.rc:root/init.ventana.rc \
    device/lenovo/thinkpadtablet/ramdisk/ueventd.ventana.rc:root/ueventd.ventana.rc \
    device/lenovo/thinkpadtablet/ramdisk/init:root/init 

