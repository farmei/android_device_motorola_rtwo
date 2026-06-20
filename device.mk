#
# Copyright (C) 2023 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/motorola/rtwo

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B support
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    recovery \
    super \
    system_dlkm \
    vendor_boot \
    vendor_dlkm \
    vbmeta \
    vbmeta_system

# fastbootd is intentionally disabled until it is validated on-device. The
# original tree documents a broken fastbootd flow that can leave rtwo unable to
# boot normally without reflashing recovery.

# Recovery HALs used by battery reporting and FBE credential services.
PRODUCT_PACKAGES += \
    android.hardware.health-service.qti_recovery \
    qcom_decrypt \
    qcom_decrypt_fbe

# Dependencies
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libdmabufheap

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so

# Enable Fuse Passthrough
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true
