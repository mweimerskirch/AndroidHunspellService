/**
 * Copyright (c) 2012 Michel Weimerskirch
 * MIT License
 */

#include <jni.h>
#include <string.h>

#include "base/utf_string_conversions.h"
#include "base/memory/scoped_ptr.h"
#include "base/file_path.h"
#include "base/file_util.h"

#include "hunspell/hunspell.hxx"

extern "C" {

scoped_ptr<Hunspell> hunspell_;
scoped_ptr<file_util::MemoryMappedFile> bdict_file_;
base::PlatformFile file_;

void Java_lu_spellchecker_hunspell_Hunspell_init(JNIEnv* env, jobject obj, jstring jbdic) {
	if (hunspell_.get())
		return;

	const char *bdic = env->GetStringUTFChars(jbdic, NULL);

	FilePath bdict_file_path_ = FilePath::FromUTF8Unsafe(std::string(bdic));
	base::PlatformFile file_ = base::CreatePlatformFile(bdict_file_path_,
			base::PLATFORM_FILE_READ | base::PLATFORM_FILE_OPEN, NULL, NULL);

	bdict_file_.reset(new file_util::MemoryMappedFile);
	bdict_file_->Initialize(file_);
	hunspell_.reset(new Hunspell(bdict_file_->data(), bdict_file_->length()));

	env->ReleaseStringUTFChars(jbdic, bdic);
}

jobjectArray Java_lu_spellchecker_hunspell_Hunspell_getSuggestions(JNIEnv* env, jobject obj, jstring jword) {
	char **suggestions;
	jclass stringClass = env->FindClass("java/lang/String");

	const char *word = env->GetStringUTFChars(jword, NULL);
	int number_of_suggestions = hunspell_->suggest(&suggestions, word);

	jobjectArray suggestions_java_array = env->NewObjectArray(number_of_suggestions, stringClass, 0);
	for (int i = 0; i < number_of_suggestions; i++) {
		env->SetObjectArrayElement(suggestions_java_array, i, env->NewStringUTF(suggestions[i]));
	}
	hunspell_->free_list(&suggestions, number_of_suggestions);

	env->ReleaseStringUTFChars(jword, word);

	return suggestions_java_array;
}

jboolean Java_lu_spellchecker_hunspell_Hunspell_check(JNIEnv* env, jobject obj, jstring jword) {
	const char *word = env->GetStringUTFChars(jword, NULL);

	int result = hunspell_->spell(word);

	env->ReleaseStringUTFChars(jword, word);

	if (result == 1)
		return true;
	return false;
}

}
