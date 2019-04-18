package testing;
public class CompressedTrie {

	public static void main(String[] args) {
		Trie trie = new Trie();
		
//		trie.insert("facebook");
//		trie.insert("face");
//		trie.insert("this");
//		trie.insert("there");
//		trie.insert("then");
		trie.insert("do");
		trie.insert("doing");

		//trie.print();

		System.out.println(trie.search("do")); // true
		System.out.println(trie.search("doing")); // true
		//System.out.println(trie.startsWith("th")); // true
		//System.out.println(trie.startsWith("fab")); // false
		//System.out.println(trie.startsWith("fac")); // true
	}
}

class Trie {
	private final Node root = new Node(false);
	// root's isEnd is false
	private final char CASE; // 'a' for lower, 'A' for upper

	public Trie() {
		CASE = 'a'; // default case
	}

	public Trie(char CASE) {
		this.CASE = CASE; // constructor accepting the starting symbol
	}
	
	private static class Node {
		private final static int SYMBOLS = 26;
		Node[] next = new Node[SYMBOLS];
		StringBuilder[] edge = new StringBuilder[SYMBOLS];
		boolean isEnd;
		/**
		 * Important Note:
		 * The Node in this structure is boolean isEnd.
		 * All strings are stored as edges!
		 */

		public Node(boolean isEnd) {
			this.isEnd = isEnd;
		}
	}

	public void insert(String word) {
		//~~~Enter: there~~~//
		Node trav = root;
		int i = 0;
		/** In ASCII
		 * a is #97, z is #122, 
		 * A is #65, Z is #90
		 * 0 is #48, 9 is #57
		 */
		//~~~word.length() = 5, i = 0, say != null~~~//
		while (i < word.length()
				// [word.charAt(i) - CASE]
				// To avoid exception, input should only contain a-z
				// In base case, edge[] is null
				&& trav.edge[word.charAt(i) - CASE] != null) {
			//~~~index = 't'-'a' = 19, j=0~~~//
			int index = word.charAt(i) - CASE, j = 0;
			/** i is index for word, j is index for label*/
			//~~~suppose trav.edge[19] = the~~~//
			//~~~label=trav.edge[19]=the~~~//
			// trav.edge[index] is the edge of this node start with 
			// char at this index, in this case 't'
			StringBuilder label = trav.edge[index];
			
			//~~~j=0,label.length=3,i=0,word.length()=5,~~~//
			//~~~label.charAt(j)='t', word.charAt(i)='t'~~~//
			//~~~true&&true&&true~~~//
			//~~~label not reach end yet, word not reach end yet~~~//
			//~~~label by far is the same as word!~~~//
			while (j < label.length() && i < word.length()
					&& label.charAt(j) == word.charAt(i)) {
				i++;
				j++;
			}
			//~~~word:there, label:the. i=3, j=3~~~//
			//~~~index = 't'-'a'=19~~~//

			if (j == label.length()) {
				//~~~renew base node with its children node start with 't'~~~//
				//~~~  from R--the-- to R--the--N-- ~~~//
				trav = trav.next[index];
				// Enter next while loop
			} else {
				if (i == word.length()) { 
					// inserting a prefix of existing word
					Node existingChild = trav.next[index];	// node 'f'
					Node newChild = new Node(true);
					StringBuilder remainingLabel = strCopy(label, j);

					label.setLength(j); // making "faceboook" as "face"
					trav.next[index] = newChild; // new node for "face"
					newChild.next[remainingLabel.charAt(0) - CASE] = existingChild;
					newChild.edge[remainingLabel.charAt(0) - CASE] = remainingLabel;
				} else { 
					// inserting word which has a partial match with existing word
					StringBuilder remainingLabel = strCopy(label, j);
					Node newChild = new Node(false);
					// newChild is the new middle node, containing isEnd=false now
					StringBuilder remainingWord = strCopy(word, i);
					Node temp = trav.next[index];	
					//temp is the end node of the first word
					//containing isEnd = true and null for rest
					
					label.setLength(j);
					trav.next[index] = newChild;
					newChild.edge[remainingLabel.charAt(0) - CASE] = remainingLabel;
					newChild.next[remainingLabel.charAt(0) - CASE] = temp;
					newChild.edge[remainingWord.charAt(0) - CASE] = remainingWord;
					newChild.next[remainingWord.charAt(0) - CASE] = new Node(true);
				}

				return;
			}
		}	//End of while loop
		/*
		(i < word.length()
				&& trav.edge[word.charAt(i) - CASE] != null
		 */
		if (i < word.length()) { // inserting new node for new word
			// In this case, trav.edge[...] = null
			// this word.charAt(i) - CASE is from 0-25
			// >>> strCopy(word, i)
			trav.edge[word.charAt(i) - CASE] = strCopy(word, i);
			// this node got an edge as long complete word
			trav.next[word.charAt(i) - CASE] = new Node(true);
			// Next node is isEnd = true
		} else { // i = word.length 
			// inserting "there" when "therein" and "thereafter" are existing
			trav.isEnd = true;
		}
	}
	
	//CharSequence includes: String, StringBuilder, CHarBuffer
	// Creates a new String from an existing
	// string starting from the given index
	private StringBuilder strCopy(CharSequence str, int index) {
		// Note 256 is ASCII full size
		StringBuilder result = new StringBuilder();
	
		//index < str.length
		while (index != str.length()) {
			//append the char at index then increment once
			result.append(str.charAt(index++));
		}
		// result is the rest of the string after index
		// strCopy( thisisalongword , 3) => sisalongword
		// index 0 is return whole word.
		return result;
	}

	public void print() {
		printUtil(root, new StringBuilder());
	}

	private void printUtil(Node node, StringBuilder str) {
		if (node.isEnd) {
			System.out.println(str);
		}

		for (int i = 0; i < node.edge.length; ++i) {
			if (node.edge[i] != null) {
				int length = str.length();

				str = str.append(node.edge[i]);
				printUtil(node.next[i], str);
				str = str.delete(length, str.length());
			}
		}
	}

	public boolean search(String word) {
		int i = 0;
		Node trav = root;

		while (i < word.length()
				&& trav.edge[word.charAt(i) - CASE] != null) {
			int index = word.charAt(i) - CASE;
			StringBuilder label = trav.edge[index];
			int j = 0;

			while (i < word.length() && j < label.length()) {
				if (word.charAt(i) != label.charAt(j)) {
					return false; // character mismatch
				}

				++i;
				++j;
			}

			if (j == label.length() && i <= word.length()) {
				trav = trav.next[index]; // traverse further
			} else {
				// edge label is larger than target word
				// searching for "face" when tree has "facebook"
				return false;
			}
		}//End while loop

		// target word fully traversed and current node is a word ending
		return i == word.length() && trav.isEnd;
	}

	public boolean startsWith(String prefix) {
		int i = 0;
		Node trav = root;

		while (i < prefix.length()
				&& trav.edge[prefix.charAt(i) - CASE] != null) {
			int index = prefix.charAt(i) - CASE;
			StringBuilder label = trav.edge[index];
			int j = 0;

			while (i < prefix.length() && j < label.length()) {
				if (prefix.charAt(i) != label.charAt(j)) {
					return false; // character mismatch
				}

				++i;
				++j;
			}

			if (j == label.length() && i <= prefix.length()) {
				trav = trav.next[index]; // traverse further
			} else {
				// edge label is larger than target word, which is fine
				return true;
			}
		}

		return i == prefix.length();
	}
}