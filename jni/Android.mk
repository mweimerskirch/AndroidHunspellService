LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# -DHUNSPELL_CHROME_CLIENT enabled the chrome enhancements in Hunspell
# -D_GLIBCXX_PERMIT_BACKWARD_HASH enables deprecated "Hash" functionality (otherwise the chrome specific stuff won't compile
# -DNVALGRIND disables valgrind (to eliminate assembler errors due to cross-compilation)
# -DNDEBUG Disables debugging
# -Os: Optimize for size
LOCAL_CFLAGS    := -DHUNSPELL_CHROME_CLIENT=1 \
                   -D_GLIBCXX_PERMIT_BACKWARD_HASH=1 \
                   -DNVALGRIND=1 \
                   -DNDEBUG=1 \
                   -Os \
                   -fdata-sections \
                   -ffunction-sections

LOCAL_MODULE    := hunspell
LOCAL_SRC_FILES := hunspell.cpp \
                   hunspell/affentry.cxx \
                   hunspell/affixmgr.cxx \
                   hunspell/csutil.cxx \
                   hunspell/dictmgr.cxx \
                   hunspell/filemgr.cxx \
                   hunspell/hashmgr.cxx \
                   hunspell/hunspell.cxx \
                   hunspell/hunzip.cxx \
                   hunspell/phonet.cxx \
                   hunspell/replist.cxx \
                   hunspell/suggestmgr.cxx \
                   third_party/hunspell/google/bdict_reader.cc \
                   third_party/hunspell/google/bdict.cc \
                   base/allocator/type_profiler_control.cc \
                   base/android/build_info.cc \
                   base/android/jni_android.cc \
                   base/android/jni_string.cc \
                   base/android/path_utils.cc \
                   base/android/scoped_java_ref.cc \
                   base/at_exit.cc \
                   base/base_paths.cc \
                   base/base_paths_android.cc \
                   base/base_switches.cc \
                   base/bind_helpers.cc \
                   base/callback_internal.cc \
                   base/command_line.cc \
                   base/debug/alias.cc \
                   base/debug/debugger.cc \
                   base/debug/debugger_posix.cc \
                   base/debug/stack_trace_android.cc \
                   base/file_descriptor_shuffle.cc \
                   base/file_path.cc \
                   base/file_util.cc \
                   base/file_util_android.cc \
                   base/file_util_posix.cc \
                   base/lazy_instance.cc \
                   base/location.cc \
                   base/logging.cc \
                   base/md5.cc \
                   base/memory/ref_counted.cc \
                   base/memory/singleton.cc \
                   base/memory/weak_ptr.cc \
                   base/os_compat_android.cc \
                   base/path_service.cc \
                   base/platform_file.cc \
                   base/platform_file_posix.cc \
                   base/process_posix.cc \
                   base/process_util.cc \
                   base/process_util_linux.cc \
                   base/process_util_posix.cc \
                   base/profiler/alternate_timer.cc \
                   base/profiler/tracked_time.cc \
                   base/safe_strerror_posix.cc \
                   base/string16.cc \
                   base/string_number_conversions.cc \
                   base/string_piece.cc \
                   base/string_split.cc \
                   base/string_util.cc \
                   base/stringprintf.cc \
                   base/synchronization/condition_variable_posix.cc \
                   base/synchronization/lock.cc \
                   base/synchronization/lock_impl_posix.cc \
                   base/synchronization/waitable_event_posix.cc \
                   base/sys_info_android.cc \
                   base/sys_info_posix.cc \
                   base/sys_string_conversions_posix.cc \
                   base/third_party/dmg_fp/dtoa.cc \
                   base/third_party/dmg_fp/g_fmt.cc \
                   base/third_party/dynamic_annotations/dynamic_annotations.c \
                   base/third_party/icu/icu_utf.cc \
                   base/threading/platform_thread_posix.cc \
                   base/threading/thread_checker_impl.cc \
                   base/threading/thread_collision_warner.cc \
                   base/threading/thread_local_posix.cc \
                   base/threading/thread_local_storage_posix.cc \
                   base/threading/thread_restrictions.cc \
                   base/time.cc \
                   base/time_posix.cc \
                   base/tracked_objects.cc \
                   base/tracking_info.cc \
                   base/utf_string_conversion_utils.cc \
                   base/utf_string_conversions.cc \
                   base/vlog.cc \
                   base/rand_util.cc \
                   base/rand_util_posix.cc \
                   base/atomicops_internals_x86_gcc.cc

LOCAL_LDLIBS        := -landroid -gc-sections

include $(BUILD_SHARED_LIBRARY)
