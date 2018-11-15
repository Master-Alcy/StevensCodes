import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.regex.Pattern;

/** <h2>My trie insertion and searching class</h2>
 * <p>There are only two public method in this class. All others are hiding
 * <ol><li>{@code process(String page, String currentURL)}</li>
 * <li>{@code searchEngine(String input)}</li></ol></P>
 */
public class MyProcessor {
	
	/** this entrance of Trie is only visable within this class */
	private static MyCompressedTrie trie = new MyCompressedTrie();
	
	/**
	 * {@code process} Process data
	 * @param page Input string
	 * @param currentURL Input data
	 */
	public static void process(String page, String currentURL) {
		String data = cleansing(page);
		String[] words = data.split(" ");
		for (String w : words){
			trie.insert(w,currentURL);
		}	
	}
	
	/**
	 * {@code cleansing} Make data valid
	 * @param page Input raw string
	 * @return Cleaned string
	 */
	private static String cleansing(String page) {
		page = page.replaceAll("[^A-Za-z\\s]+"," ");
		page = stopwordsFilter(page);
		page = page.replaceAll("\\s+", " ").trim().toLowerCase();
		return page;
	}
	
	/**
	 * {@code stopwordsFilter} Replace all stop words
	 * Stop words all from:
	 * https://www.ranks.nl/stopwords
	 * @param page Input string
	 * @return Filtered string
	 */
	private static String stopwordsFilter(String page) {
		String[] stopWords = {"a","about","above","after","again","against","all","am","an","and","any",
				"are","aren","t","as","at","be","because","been","before","being","below","between","both",
				"but","by","can","cannot","could","couldn","did","didn","do","does","doesn","doing",
				"don","down","during","each","few","for","from","further","had","hadn","has","hasn",
				"have","haven","having","he","d","ll","s","her","here","hers","herself","him","himself",
				"his","how","i","m","ve","if","in","into","is","isn","it","its","itself","let","me","more",
				"most","mustn","my","myself","no","nor","not","of","off","on","once","only","or","other",
				"ought","our","ours","ourselves","out","over","own","same","shan","she","should","shouldn",
				"so","some","such","than","that","the","their","theirs","them","themselves","then","there",
				"these","they","re","this","those","through","to","too","under","until","up","very","was",
				"wasn","we","were","weren","what","when","where","which","while","who","whom","why","with",
				"won","would","wouldn","you","your","yours","yourself","yourselves"};
		for (int i = 0; i < stopWords.length; i++){
			page = page.replaceAll(("\\b(?i)" + Pattern.quote(stopWords[i]) + "\\b+"), " ");
		}
		return page;
	}
	
	/**
	 * The search engine main
	 * @param Input Input searching string
	 * @return Response with data or error message.
	 */
	public static String searchEngine(String input) {
		input = cleansing(input);
		String[] words = input.split(" ");
		// For cases "" and " " before split
		if (words.length == 0 || (words.length == 1 && words[0].isEmpty())){	
			return "Empty search word. Maybe you entered a stopword.";
		}
		
		HashMap<String, Integer> oneMap = new HashMap<>();
		HashMap<String, Integer> allMap = new HashMap<>();
		Iterator<Entry<String, Integer>> iter;
		int wordsTotalOccurence = 0;
		StringBuilder result = new StringBuilder();
		
		result.append("Searched against: ");
		for (String word : words){
			// If not found => NullPointerException
			try {
				oneMap = trie.get(word);
			} catch (NullPointerException e) {
				return "Word \"" + word + "\" not found.";
			}
			wordsTotalOccurence += oneMap.remove("WordCount"); //word count for this word
			iter = oneMap.entrySet().iterator();
			while (iter.hasNext()){
				Entry<String,Integer> entry = iter.next();
				allMap.merge(entry.getKey(), entry.getValue(), 
						(value, newValue) -> value + entry.getValue()); 
			}// End of iterator of oneMap
			result.append(word + " ");
		}// End of words for loop
		String newline = System.getProperty("line.separator");
		result.append(newline + "Total occurence: " + wordsTotalOccurence);
		result.append(newline);
		
		// This is basically merge sort
		TreeMap<String, Integer> sortedTree = MyTreeMapByValue.sortValue(allMap);
		iter = sortedTree.entrySet().iterator();
		int ranking = 1;
		while(iter.hasNext()){
			Entry<String,Integer> entry = iter.next();
			String url = entry.getKey();
			Integer occurence = entry.getValue();
			result.append("Rank " + ranking++ + ": " + url + newline);
			result.append("All words' total occurences on this site is: " + occurence + newline);
		}
		result.append("This search ends." + newline);
		return result.toString();
	}
}
