# Camera Setup
USE_CAMERA_STUB := true
USE_PROPRIETARY_AUDIO_EXTENSIONS := true

-include device/lenovo/thinkpadtablet/gapps/gapps.mk
#-include device/lenovo/thinkpadtablet/alsa-lib/Android.mk
#-include device/lenovo/thinkpadtablet/alsa-utils/Android.mk
#-include device/lenovo/thinkpadtablet/alsa_sound/Android.mk

TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_BOOTLOADER_BOARD_NAME := ventana

TARGET_BOARD_INFO_FILE := device/lenovo/thinkpadtablet/board-info.txt

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERYIMAGE := true

NEED_WORKAROUND_CORTEX_A9_745320 := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Wifi related defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WLAN_DEVICE           := bcm4329
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan0 firmware_path=/system/vendor/firmware/fw_bcm4329.bin nvram_path=/etc/nvram.txt"

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_GPS := true

BOARD_VENDOR_USE_AKMD := akm8975

BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 2048

BOARD_USES_GENERIC_AUDIO := false
#BOARD_USES_AUDIO_LEGACY := true
BOARD_USES_ALSA_AUDIO := false
#TARGET_PROVIDES_LIBAUDIO := true
BUILD_WITH_ALSA_UTILS := false

TARGET_OTA_ASSERT_DEVICE := thinkpadtablet,ventana

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/lenovo/thinkpadtablet/prebuild/lib/egl/egl.cfg

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13249806336
BOARD_FLASH_BLOCK_SIZE := 131072

# Indicate that the board has an Internal SD Card
BOARD_HAS_SDCARD_INTERNAL := true

BOARD_DATA_DEVICE := /dev/block/mmcblk0p10
BOARD_DATA_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p4
BOARD_CACHE_FILESYSTEM := ext4
