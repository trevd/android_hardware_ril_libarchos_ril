# Copyright 2006 The Android Open Source Project

# XXX using libutils for simulator build only...
#
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    huaweigeneric-ril.c \
    atchannel.c \
    misc.c \
    at_tok.c \
    sms.c \
    sms_gsm.c \
    gsm.c

LOCAL_SHARED_LIBRARIES := \
	libcutils libutils libril

LOCAL_CFLAGS := -D_GNU_SOURCE

LOCAL_C_INCLUDES := $(KERNEL_HEADERS)

ifeq ($(TARGET_PRODUCT),sooner)
  LOCAL_CFLAGS += -DOMAP_CSMI_POWER_CONTROL -DUSE_TI_COMMANDS 
endif

ifeq ($(TARGET_PRODUCT),surf)
  LOCAL_CFLAGS += -DPOLL_CALL_STATE -DUSE_QMI
endif

ifeq ($(TARGET_PRODUCT),dream)
  LOCAL_CFLAGS += -DPOLL_CALL_STATE -DUSE_QMI
endif

LOCAL_LDLIBS += -lpthread
LOCAL_CFLAGS += -DRIL_SHLIB 
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libhuaweigeneric-ril
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)


LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)
