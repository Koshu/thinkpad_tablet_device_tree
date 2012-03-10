#
# Copyright (C) 2011 The Android Open-Source Project
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
#

# This file includes all definitions that apply to ALL tuna devices, and
# are also specific to tuna devices
#
# Everything in this directory will become public

# Kernel

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/lenovo/thinkpadtablet/zImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_ID=IML74K

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version = 131072 \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.dexopt-flags=m=y \
    wifi.interface=wlan0 \
    ro.sf.lcd_density=150 

# Get a proper init file
PRODUCT_COPY_FILES += \
    device/lenovo/thinkpadtablet/ramdisk/default.prop:root/default.prop \
    device/lenovo/thinkpadtablet/ramdisk/init.ventana.rc:root/init.ventana.rc \
    device/lenovo/thinkpadtablet/ramdisk/ueventd.ventana.rc:root/ueventd.ventana.rc \
    device/lenovo/thinkpadtablet/ramdisk/init:root/init 

#    device/lenovo/thinkpadtablet/ramdisk/ueventd.ventana.rc:root/ueventd.rc \
#device/lenovo/thinkpadtablet/ramdisk/init.rc:root/init.rc 
#device/lenovo/thinkpadtablet/ramdisk/init:root/init 
# Set default USB interface
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#	persist.sys.usb.config=mtp
    
# Some files for 3G
#PRODUCT_COPY_FILES += \
    device/lenovo/thinkpadtablet/prebuild/etc/ppp/ip-up:system/etc/ppp/ip-up \
    device/lenovo/thinkpadtablet/prebuild/etc/ppp/ip-down:system/etc/ppp/ip-down 


# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml\
    device/toshiba/folio100/prebuild/etc/permissions/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Wirless files
PRODUCT_COPY_FILES += \
    device/lenovo/thinkpadtablet/prebuild/vendor/firmware/fw_bcm4329.bin:system/vendor/firmware/fw_bcm4329.bin \
    device/lenovo/thinkpadtablet/prebuild/vendor/firmware/fw_bcm4329_apsta.bin:system/vendor/firmware/fw_bcm4329_apsta.bin \
    device/lenovo/thinkpadtablet/prebuild/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd
    
$(call inherit-product-if-exists, device/lenovo/thinkpadtablet/proprietary/thinkpadtablet-vendor.mk)
$(call inherit-product-if-exists, device/lenovo/thinkpadtablet/configfiles/thinkpadtablet-configs.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/thinkpadtablet/overlay

PRODUCT_PACKAGES += \
    libtinyalsa \
    audio.primary.ventana \
    tinyplay \
    tinymix \
    tinycap
 #   audio.primary.ventana \
 #   audio.a2dp.default \ 
    

# Include packages
PRODUCT_PACKAGES += \
    make_ext4fs \
    librs_jni \
    su \
    Superuser \
    alsa_aplay \
    alsa_ctl \
    alsa_amixer \
    Trebuchet

PRODUCT_CHARACTERISTICS := tablet

# Use HDPI artwork
PRODUCT_LOCALES += hdpi

# VOLD
PRODUCT_COPY_FILES += \
    device/lenovo/thinkpadtablet/prebuild/etc/vold.fstab:system/etc/vold.fstab

# APNs
PRODUCT_COPY_FILES += \
   device/lenovo/thinkpadtablet/prebuild/etc/apns-conf.xml:system/etc/apns-conf.xml

# Media Profile
PRODUCT_COPY_FILES += \
   device/lenovo/thinkpadtablet/prebuild/etc/media_profiles.xml:system/etc/media_profiles.xml

#CM9 Green Fix
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS -DBOARD_USES_ALSA_AUDIO

