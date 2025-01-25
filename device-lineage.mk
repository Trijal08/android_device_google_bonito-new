#
# Copyright (C) 2020-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# Add common definitions for Qualcomm
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# AiAi Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/allowlist_com.google.android.as.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_com.google.android.as.xml

# Camera
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.camera.extensions.package=com.google.android.apps.camera.services \
    ro.vendor.camera.extensions.service=com.google.android.apps.camera.services.extensions.service.PixelExtensions

# DeviceAsWebcam
TARGET_BUILD_DEVICE_AS_WEBCAM := true

# Elmyra
PRODUCT_PACKAGES += \
    ElmyraService

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# GMS
ifeq ($(WITH_GMS),true)
GMS_MAKEFILE=gms_minimal.mk
endif

# Google Assistant
PRODUCT_PRODUCT_PROPERTIES += ro.opa.eligible_device=true

# Google Pixel Face Unlock
$(call inherit-product-if-exists, vendor/google/faceunlock/config.mk)

# Lineage Health
include hardware/google/pixel/lineage_health/device.mk

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm

# Parts
PRODUCT_PACKAGES += \
    GoogleParts

# Pixel Parts
$(call inherit-product-if-exists, packages/apps/PixelParts/device.mk)

# Private signing keys
-include vendor/lineage-priv/keys/keys.mk

# Quick Tap Stronger Taps
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.columbus.use_ap_sensor=false

# RCS
PRODUCT_PACKAGES += \
    PresencePolling \
    RcsService

# Build necessary packages for vendor

# CHRE
PRODUCT_PACKAGES += \
    chre

# Configstore
PRODUCT_PACKAGES += \
    disable_configstore

# Identity credential
PRODUCT_PACKAGES += \
    android.hardware.identity_credential.xml

# Telephony
PRODUCT_PACKAGES += \
    qti-telephony-hidl-wrapper \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper.xml \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml

# VNDK FWK detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti.vendor

# Properties
TARGET_VENDOR_PROP := $(LOCAL_PATH)/vendor.prop

## Extras/Add-ons
# ViPER4AndroidFX
$(call inherit-product-if-exists, packages/apps/ViPER4AndroidFX/config.mk)

# Basic Call Recorder (BCR)
$(call inherit-product-if-exists, vendor/bcr/bcr.mk)
