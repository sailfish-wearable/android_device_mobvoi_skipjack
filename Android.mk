#
# Copyright (C) 2018 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),skipjack)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.skipjack
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := rootdir/etc/fstab.skipjack
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := ueventd.skipjack.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := rootdir/etc/ueventd.skipjack.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

# To ensure KERNEL_OUT and TARGET_PREBUILT_INT_KERNEL are defined,
# kernel/AndroidKernel.mk must be included. While m and regular
# make builds will include kernel/AndroidKernel.mk, mm and mmm builds
# do not. Therefore, we need to explicitly include kernel/AndroidKernel.mk.
# It is safe to include it more than once because the entire file is
# guarded by "ifeq ($(TARGET_PREBUILT_KERNEL),) ... endif".
TARGET_KERNEL_PATH := $(TARGET_KERNEL_SOURCE)/AndroidKernel.mk
include $(TARGET_KERNEL_PATH)

endif
