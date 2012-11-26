/**
 * Copyright (c) 2012 Michel Weimerskirch
 * MIT License
 */

package lu.spellchecker.hunspell;

public class Hunspell {

    public native void init(String bdic);

    public native boolean check(String word);

    public native String[] getSuggestions(String word);

    static {
	System.loadLibrary("hunspell");
    }

}
