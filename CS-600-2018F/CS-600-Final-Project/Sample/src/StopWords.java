public class StopWords {
	public static String[] articles = {"the", "a", "an"};
	public static String[] pronouns = {"i", "you", "he", "she", "it" , "they", "we", "me", "him", "her", "them", "us"};
	public static String[] prepositions = {
			"aboard","about","above","across","after","against","along","among",
			"around","as","at","before","behind","below","beside",
			"besides","between","beyond","but","by","despite", "down", "during",
			"except", "following","for", "from", "in", "inside","into",
			"near", "of","on", "onto", "over", "past", "since", "than", "to",
			"through", "toward", "towards", "under", "until", "up", "upon", "via",
			"with", "within", "without"
	};
	
	public static String[] html = {
			"a", "href", "p", "div", "img", "src", "html", "http", "body",
			"span", "class", "id", "name", "target", "style", "figure", "border", "width", "height"
	};
	
	public static String[] alphabet = {
			"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
			"l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
			"w", "x", "y", "z"
	};
	
	public static boolean isStopWord(String w) {
		String word = w.toLowerCase();
		for (String str : articles) {
			if (word.equals(str)) return true;
		}
		for (String str : pronouns) {
			if (word.equals(str)) return true;
		}
		for (String str : prepositions) {
			if (word.equals(str)) return true;
		}
		for (String str : html) {
			if (word.equals(str)) return true;
		}
		for (String str : alphabet) {
			if (word.equals(str)) return true;
		}
		return false;
	}
}
