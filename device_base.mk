# Copyright (C) 2010 The Android Open Source Project
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


# This file is the device-specific product definition file for
# crespo. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that crespo is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.


# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS += device/samsung/aries-common/overlay

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/aries-common/config/audio_policy.conf:system/etc/audio_policy.conf

# Hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/aries-common/rootdir/init.aries.rc:root/init.aries.rc \
    device/samsung/aries-common/rootdir/init.aries.gps.rc:root/init.aries.gps.rc \
    device/samsung/aries-common/rootdir/init.aries.usb.rc:root/init.aries.usb.rc \
    device/samsung/aries-common/rootdir/init.aries.usb.rc:recovery/root/usb.rc \
    device/samsung/aries-common/rootdir/init.recovery.aries.rc:root/init.recovery.aries.rc \
    device/samsung/aries-common/rootdir/fstab.aries:root/fstab.aries \
    device/samsung/aries-common/recovery/twrp.fstab:recovery/root/etc/twrp.fstab \
    device/samsung/aries-common/rootdir/ueventd.aries.rc:root/ueventd.aries.rc

# Prebuilt static utilities (for updater.sh)
PRODUCT_COPY_FILES += \
    device/samsung/aries-common/utilities/bml_over_mtd:utilities/bml_over_mtd \
    device/samsung/aries-common/utilities/busybox:utilities/busybox \
    device/samsung/aries-common/utilities/erase_image:utilities/erase_image \
    device/samsung/aries-common/utilities/flash_image:utilities/flash_image \
    device/samsung/aries-common/utilities/make_ext4fs:utilities/make_ext4fs

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/samsung/aries-common/config/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc

# OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
    device/samsung/aries-common/config/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/aries-common/config/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video.xml \
    hardware/samsung/exynos3/s5pc110/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
    device/samsung/aries-common/config/cypress-touchkey.kcm:system/usr/keychars/cypress-touchkey.kcm \
    device/samsung/aries-common/config/cypress-touchkey.kl:system/usr/keylayout/cypress-touchkey.kl \
    device/samsung/aries-common/config/sec_jack.kcm:system/usr/keychars/sec_jack.kcm \
    device/samsung/aries-common/config/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/aries-common/config/s3c-keypad.kcm:system/usr/keychars/s3c-keypad.kcm \
    device/samsung/aries-common/config/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl

# Shell scripts
PRODUCT_COPY_FILES += \
    device/samsung/aries-common/bml_over_mtd.sh:bml_over_mtd.sh \
    device/samsung/aries-common/updater.sh:updater.sh

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    audio.primary.aries \
    audio.a2dp.default \
    audio.usb.default

# Bluetooth MAC Address
PRODUCT_PACKAGES += \
    bdaddr_read

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Device-specific packages
PRODUCT_PACKAGES += \
    DeviceSettings \
    LegacyCamera \
    SamsungServiceMode

# GPS Shims
PRODUCT_PACKAGES += \
    libdmitry \
    libstegps

# HIDL
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.keymaster@3.0-impl \
    android.hardware.power@1.0-impl

# Libs
PRODUCT_PACKAGES += \
    libstagefrighthw

# Lights
PRODUCT_PACKAGES += \
	android.hardware.light@2.0-impl \
    lights.aries

# Static executables for updater.sh
PRODUCT_PACKAGES += \
    bml_over_mtd \
    setup_fs \
    static_busybox \
    utility_erase_image \
    utility_flash_image \
    utility_make_ext4fs

# Misc other modules
PRODUCT_PACKAGES += \
    camera.aries \
    hwcomposer.s5pc110 \
    libcorkscrew \
    libs3cjpeg \
    power.s5pc110 \
    sensors.aries

# OpenMAX IL modules
PRODUCT_PACKAGES += \
    libSEC_OMX_Core \
    libOMX.SEC.AVC.Decoder \
    libOMX.SEC.AVC.Encoder \
    libOMX.SEC.M4V.Decoder \
    libOMX.SEC.M4V.Encoder

# PVR
PRODUCT_PACKAGES += \
    libEGL_POWERVR \
    pvrsrvinit

# RIL
PRODUCT_PACKAGES += \
    libsecril-client \
    libsecril-compat \
    libsecril-shim

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwpa_client \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.config.low_ram=true \
    ro.sys.fw.bg_apps_limit=8 \
    ro.ksm.default=1 \
    wifi.interface=wlan0

# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    dalvik.vm.dex2oat-swap=false

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# OMX is non-Treble
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# OpenGL
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.render_dirty_regions=false \
    ro.opengles.version=131072 \
    ro.zygote.disable_gl_preload=true

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly,
# but they can spot a variety of nasty bugs
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=false \
    ro.kernel.android.checkjni=0

# SGX540 is slower with the scissor optimization enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true

# Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# SELinux status in Settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Strict mode disabled
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.disable=1 \
    persist.sys.strictmode.visual=0

include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk
$(call inherit-product-if-exists, device/common/gps/gps_us_supl.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
