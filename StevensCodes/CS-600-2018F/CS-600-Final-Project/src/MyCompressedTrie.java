import java.util.HashMap;

/**
 * This Compressed Trie is for a-z only. Inspired from:
 * http://theoryofprogramming.com/2016/11/15/compressed-trie-tree/ *
 * <p>There are only two public method in this class. All others are hiding
 * <ol><li>{@code insert(String word, String url)}</li>
 * <li>{@code get(String word)}</li></ol></P>
 */
public class MyCompressedTrie {
	/** 
	 * @param R Set the available edges and next Nodes for each Node
	 * @param BASE Set the ASCII base 
	 * @param root Root should be un-changed
	 */
	private static final int R = 26;
	private static final char BASE = 'a';
	private static final Node root = new Node(0);
	
	/** The Structure of Node */
	private static class Node {
		/** 
		 * @param urlsMap Storing the urls and their occurrences 
		 * @param nextNode[R] Denote the next Node of current Node
		 * @param edge[R] Denote the R's edges this Node can have
		 * @param wordCount Denote the number of word ends at this Node
		 */
		private HashMap<String,Integer> urlsMap = new HashMap<>();
		private Node[] next = new Node[R];
		private StringBuilder[] edge = new StringBuilder[R];
		private int wordCount;
		
		/** Set the word count for each Node. root.wordCount is always 0. */
		private Node(int wordCount) {
			this.wordCount = wordCount;
		}
	}
	
	/** 
	 * {@code insert} Insertion open to user. 
	 * Renew the root stored after insertion.
	 * @param word The word gets inserted
	 * @param url The data need to be stored
	 */
	public void insert(String word, String url) {
		insert(root,word, url, 0, 0);
	}
	
	/**
	 * {@code insert} The recursive inserting method
	 * @param currentNode At first this is the base root.
	 * @param word Word to be inserted at edge
	 * @param url Data stored with word
	 * @param wordIndex The char pointer of word string
	 * @param labelIndex The char pointer of label string
	 */
	private void insert(Node current, String word, String url,
			int wordIndex, int labelIndex) {
		
		while (wordIndex < word.length() 
				&& current.edge[word.charAt(wordIndex) - BASE] != null) {
			int charIndex = word.charAt(wordIndex) - BASE;
			labelIndex = 0;
			StringBuilder label = current.edge[charIndex];
			
			while (labelIndex < label.length() && wordIndex < word.length()
					&& label.charAt(labelIndex) == word.charAt(wordIndex)) {
				wordIndex++;
				labelIndex++;
			}

			if (labelIndex == label.length()) {
				current = current.next[charIndex];
			} else {
				if (wordIndex == word.length()) { 
					// inserting a prefix of existing word. "face" into "facebook"
					Node oldNext = current.next[charIndex];	// node 'f'
					Node newNext = new Node(1);
					putData(newNext,url);
					StringBuilder remainingLabel = restString(label, labelIndex);
					int labelAt = remainingLabel.charAt(0) - BASE;
					
					label.setLength(labelIndex); // making "faceboook" as "face"
					current.next[charIndex] = newNext; // new node for "face"
					newNext.next[labelAt] = oldNext;
					newNext.edge[labelAt] = remainingLabel;
				} else { 
					// inserting word which has a partial match with existing word
					Node oldNext = current.next[charIndex];	
					Node newNext = new Node(0);
					StringBuilder remainingLabel = restString(label, labelIndex);
					StringBuilder remainingWord = restString(word, wordIndex);
					int labelAt = remainingLabel.charAt(0) - BASE;
					int wordAt = remainingWord.charAt(0) - BASE;
					
					label.setLength(labelIndex);
					current.next[charIndex] = newNext;
					newNext.edge[labelAt] = remainingLabel;
					newNext.next[labelAt] = oldNext;
					newNext.edge[wordAt] = remainingWord;
					
					Node temp = newNext.next[wordAt] = new Node(1);
					putData(temp, url);
				}
				return;
			}
		}//End of while loop

		if (wordIndex < word.length()) { 
			// inserting new node for new word
			int wordAt = word.charAt(wordIndex) - BASE;
			current.edge[wordAt] = restString(word, wordIndex);
			Node temp = current.next[wordAt] = new Node(1);
			putData(temp, url);
		} else {
			// inserting "there" when "therein" and "thereafter" are existing
			if (current.wordCount == 0){
				current.wordCount = 1;
			}else{
				current.wordCount ++;
			}
			putData(current,url);
		}
	}// End of insert method
	
	/**
	 * {@code restString} The rest of string from index
	 * @param str Input string
	 * @param index Rest index
	 * @return Processed string
	 */
	private StringBuilder restString(CharSequence str, int index) {
		StringBuilder result = new StringBuilder();
		while (index < str.length()){
			result.append(str.charAt(index++));
		}
		return result;
	}
	
	/**
	 * {@code putData} Put url data into hashmap
	 * @param current Current Node
	 * @param url Url data
	 */
	private void putData(Node current, String url) {
		HashMap<String, Integer> h = current.urlsMap;
		if (h.containsKey(url)){
			h.put(url, h.get(url) + 1);
		}else{
			h.put(url, 1);
		}
	}
	
	/**
	 * {@code get} Get data from trie
	 * @param word 
	 * @return HashMap with data
	 */
	public HashMap<String,Integer> get(String word) {
		Node temp = get(root,word,0);
		temp.urlsMap.put("WordCount", temp.wordCount);
		return temp.urlsMap;
	}
	
	/**
	 * {@code} The recursive method to find the node
	 * @param current Root node
	 * @param word Searched word
	 * @param wordIndex The char pointer of word string
	 * @return Null if not found, a node if found.
	 */
	private Node get(Node current, String word, int wordIndex) {

		while (wordIndex < word.length()
				&& current.edge[word.charAt(wordIndex) - BASE] != null) {
			int charIndex = word.charAt(wordIndex) - BASE;
			StringBuilder label = current.edge[charIndex];
			int labelIndex = 0;

			while (wordIndex < word.length() && labelIndex < label.length()) {
				if (word.charAt(wordIndex) != label.charAt(labelIndex)) {
					return null; // character mismatch
				}
				wordIndex++;
				labelIndex++;
			}

			if (labelIndex == label.length() && wordIndex <= word.length()) {
				current = current.next[charIndex]; // traverse further
			} else {
				// edge label is larger than target word
				// searching for "face" when tree has "facebook"
				return null;
			}
		}//End of while loop

		// target word fully traversed and current node is a word ending
		if (wordIndex == word.length() && current.wordCount != 0){
			return current;
		}
		return null;
	}
}