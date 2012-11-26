AndroidHunspellService
======================

Android spellchecking service that uses the modified Hunspell engine from the Chromium project.

License information

* The following directories were taken from the Chromium project: jni/base, jni/base/third_party/dmg_fp, jni/base/third_party/dynamic_annotations, jni/base/third_party/icu, jni/build, jni/hunspell, jni/jni, jni/third_party/hunspell/google, src/org/chromium/base/. Each of these directories contains the respective license file. The modifications can be found in patch_chrome.diff
* src/lu/spellchecker/hunspell/Hunspell.java as well as jni/hunspell.cpp are licensed under the MIT license

FAQ

* To compile the native library: /path/to/android-ndk-r8b/ndk-build LOCAL_USE_LTO=true
* Unfortunately, this doesn't run on many Samsung phones, because the removed the spell checking function from their Android version. I contacted them but didn't get a useful answer.

For a similar project using the original Hunspell code, check https://github.com/iwo/HunspellCheckerService