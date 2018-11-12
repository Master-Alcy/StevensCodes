public class ProcessPage {
	public static Trie trie = new Trie('#');

	public void addPageWithUrl(String page, String url) {
		
		String[] words = page.split(" ");
		for(String word : words){
			if(word.trim().length()>0  && fillteredWord(word) && !StopWords.isStopWord(word)){
				processWord(word.trim(), url);
			}
		}	
	}

	private boolean fillteredWord(String word) {
		if(word.equals(",") || word.equals(".") || word.equals("/")
				||word.equals("==") ||word.equals("//")
				|| word.equals("<")|| word.equals(">")|| word.equals("?")
				|| word.equals(";")|| word.equals("'")|| word.equals(":")
				|| word.equals("\"")|| word.equals("[")|| word.equals("]")
				|| word.equals("\\")|| word.equals("/{")|| word.equals("}")
				|| word.equals("|")|| word.equals("+")|| word.equals("-")
				|| word.equals("=")|| word.equals("!")|| word.equals("@")
				|| word.equals("#")|| word.equals("$")|| word.equals("%")
				|| word.equals("^")|| word.equals("&")|| word.equals("*")
				|| word.equals("(")|| word.equals(")")|| word.equals("_")){
			
			return false;	
		}
		return true;
	}

	private void processWord(String w, String url) {
		String word = w.toLowerCase();
		int i = 0;
		Trie root = trie;
		while(i < word.length()) {
			root.addChild(word.charAt(i));
			root = root.getChild(word.charAt(i));
			i++;
		}
		root.addUrls(url);
	}
}
