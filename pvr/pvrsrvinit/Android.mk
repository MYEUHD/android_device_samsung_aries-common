LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := pvrsrvinit.c
LOCAL_CFLAGS := -Wall -Werror
LOCAL_LDFLAGS := -L $(TARGET_OUT_VENDOR)/lib
LOCAL_ADDITIONAL_DEPENDENCIES := libsrv_init libsrv_um
LOCAL_ALLOWED_LDLIBS := $(LOCAL_ADDITIONAL_DEPENDENCIES:lib%=-l%)
LOCAL_LDFLAGS += $(LOCAL_ALLOWED_LDLIBS)
LOCAL_MODULE_PATH := $(TARGET_OUT_EXECUTABLES)
LOCAL_MODULE := pvrsrvinit
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
