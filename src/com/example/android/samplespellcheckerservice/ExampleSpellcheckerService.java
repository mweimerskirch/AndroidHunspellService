package com.example.android.samplespellcheckerservice;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;

import lu.spellchecker.hunspell.Hunspell;
import android.service.textservice.SpellCheckerService;
import android.view.textservice.SuggestionsInfo;
import android.view.textservice.TextInfo;

public class ExampleSpellcheckerService extends SpellCheckerService {
	@Override
	public Session createSession() {
		return new AndroidSpellCheckerSession();
	}

	private static class AndroidSpellCheckerSession extends Session {
		private String mLocale;
		private Hunspell hunspell;

		@Override
		public void onCreate() {
			String fileName = "/sdcard/spellchecker/" + getLocale() + ".bdic";
			hunspell = new Hunspell();
			hunspell.init(fileName);
		}

		@Override
		public SuggestionsInfo onGetSuggestions(TextInfo textInfo, int suggestionsLimit) {
			final String inputText = textInfo.getText();

			final boolean result = hunspell.check(inputText);

			if (result) {
				return new SuggestionsInfo(SuggestionsInfo.RESULT_ATTR_IN_THE_DICTIONARY, new String[] {});
			}

			String[] suggestions = hunspell.getSuggestions(inputText);

			return new SuggestionsInfo(SuggestionsInfo.RESULT_ATTR_LOOKS_LIKE_TYPO, suggestions);
		}
	}
}
