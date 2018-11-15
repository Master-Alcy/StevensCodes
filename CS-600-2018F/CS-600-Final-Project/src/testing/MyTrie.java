package testing;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

// A un-compressed Trie-structure
public class MyTrie {
	//Alphabet size
	private static int R = 256;
	private Node root;

	private static class Node {
		// Store url and its occurrence
		private HashMap<String,Integer> urlsMap = new HashMap<>();
		private Node[] next = new Node[R];
	}
	
	// Use this to get key's url stored in hashmap 
	public HashMap<String, Integer> get(String key) {
		Node x = get(root, key, 0);
		if (x == null) {
			return null;
		}
		return x.urlsMap;
	}

	// return value with specific key in subtrie with root x
	private Node get(Node x, String key, int d) {
		if (x == null) {
			return null;
		}
		if (d == key.length()) {
			return x;
		}
		// Read subtrie with dth key
		char c = key.charAt(d);
		return get(x.next[c], key, d + 1);
	}
	
	// Use this to insert key with url
	public void put(String key, String url) {
		root = put(root, key, url, 0);
	}

	private Node put(Node x, String key, String url, int d) {
		if (x == null) {
			// For first key inserted
			x = new Node();
		}
		// d start from 0 
		if (d == key.length()) {
			// this is when all chars in word inserted
			// append this word's url to the list
			// x.urlsMap has all the urls Word x has occurred
			// and the number of times it has occurred.
			if (x.urlsMap.containsKey(url)){
				// If this url appeared before. Increment it.
				x.urlsMap.put(url, x.urlsMap.get(url) + 1);
			}else {
				// This url is new
				x.urlsMap.put(url,1);
			}
			return x;
		}
		// start from first char in this word
		char c = key.charAt(d);
		x.next[c] = put(x.next[c], key, url, d + 1);
		return x;
	}
	
	public static void main(String[] args) {
		MyTrie t = new MyTrie();
		t.put("her", "www.wdf.com");
		t.put("her", "www.dude.com");
		t.put("her", "www.dude.com");
		t.put("hers", "www.wdf.com");
		t.put("hers", "www.wdf.com");
		t.put("herself", "www.another.com");
		t.put("herselves", "www.another.com");
		t.put("end", "www.wdf.com");
		Iterator<Entry<String, Integer>> it = t.get("hers").entrySet().iterator();
		while(it.hasNext()){
			Entry<String, Integer> entry = it.next();
			System.out.println("Key: " + entry.getKey() 
					+ "\nValue: " + entry.getValue());
		}
	}
}
