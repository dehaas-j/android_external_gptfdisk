# A quick port of gptfdisk to Android
This is a quick and dirty port of 
[gptfdisk](http://sourceforge.net/projects/gptfdisk/) to Android. The Android.mk 
file contains instructions on how to build statically linked binaries for gdisk 
and sgdisk.

# USE THIS CODE AND ITS DERIVATIVES AT YOUR OWN RISK
It was written by an amateur, a hobbyist, who might not have known what he was 
doing.


# Compilation instructions
1. Obtain the Android source code
2. Clone this repository into the external directory of your Android code 
   directory.
3. Ensure a static version of libuuid will be compiled. Edit 
   external/e2fsprogs/lib/uuid/Android.mk and add the following lines
```
include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(libext2_uuid_src_files)
LOCAL_C_INCLUDES := $(libext2_uuid_c_includes)
LOCAL_CFLAGS := $(libext2_uuid_cflags)
LOCAL_SYSTEM_SHARED_LIBRARIES := $(libext2_uuid_system_shared_libraries)
LOCAL_MODULE := libext2_uuid
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
include $(BUILD_STATIC_LIBRARY)
```
You should now be able to build gptfdisk for your device using the standardized 
procedure

# Changes
1. The log2 implementation in gpt.cc was taken from
   [Senseg's port](https://github.com/Senseg/android_external_gptfdisk) of
   gptfdisk
2. The Android.mk file was also inspired on the aforementioned port
3. I added a simple implementation of toupper to support.cc as (s)gdisk 
   segfaulted when using the version provided by libc.

