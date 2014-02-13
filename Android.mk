LOCAL_PATH := $(call my-dir)

gptfdisk_src_files := \
	crc32.cc \
	support.cc \
	guid.cc \
	gptpart.cc \
	mbrpart.cc \
	basicmbr.cc \
	mbr.cc \
	gpt.cc \
	bsd.cc \
	parttypes.cc \
	attributes.cc \
	diskio.cc \
	diskio-unix.cc
gptfdisk_c_flags := \
	-D_ANDROID \
	-D_FILE_OFFSET_BITS=64
gptfdisk_cpp_flags := \
	-D_ANDROID \
	-Wall \
	-D_FILE_OFFSET_BITS=64
	#-D USE_UTF16
gptfdisk_c_includes := \
	external/stlport/stlport \
	external/e2fsprogs/lib/ \
	bionic \
	$(KERNEL_HEADERS)
gptfdisk_system_shared_libraries := \
	libext2_uuid \
	libstlport \
	libstdc++ \
	libcutils \
	libutils \
	libc 
gptfdisk_system_static_libraries := \
	libext2_uuid \
	libstlport_static \
	libstdc++ \
	libcutils \
	libutils \
	libc 


include $(CLEAR_VARS)

LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := gdisk
LOCAL_MODULE_TAGS := 
LOCAL_PRELINK_MODULE := true
LOCAL_CFLAGS += $(gptfdisk_c_flags)
LOCAL_CPPFLAGS += $(gptfdisk_cpp_flags)
LOCAL_SRC_FILES += $(gptfdisk_src_files) \
	gdisk.cc \
	gpttext.cc
LOCAL_C_INCLUDES += $(gptfdisk_c_includes)
LOCAL_CPP_EXTENSION := .cc
#LOCAL_SYSTEM_SHARED_LIBRARIES = $(gptfdisk_system_shared_libraries)
LOCAL_STATIC_LIBRARIES := $(gptfdisk_system_static_libraries)

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := sgdisk
LOCAL_MODULE_TAGS := 
LOCAL_PRELINK_MODULE := true
LOCAL_CFLAGS += $(gptfdisk_c_flags)
LOCAL_CPPFLAGS += $(gptfdisk_cpp_flags)
LOCAL_SRC_FILES += $(gptfdisk_src_files) \
	sgdisk.cc \
	gptcl.cc
LOCAL_C_INCLUDES += $(gptfdisk_c_includes) \
	external/oprofile/libpopt
LOCAL_CPP_EXTENSION := .cc
LOCAL_STATIC_LIBRARIES := $(gptfdisk_system_static_libraries) \
	liboprofile_popt

include $(BUILD_EXECUTABLE)
