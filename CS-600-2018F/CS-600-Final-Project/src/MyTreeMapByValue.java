import java.util.Comparator;
import java.util.HashMap;
import java.util.TreeMap;

/**
 * This class implemented the tree map sorted with value
 * Inspired from:
 * https://www.programcreek.com/2013/03/java-sort-map-by-value/
 */
public class MyTreeMapByValue {
	
	/**
	 * {@code sortValue(HashMap<String, Integer> hmap)} 
	 * The only public method for user
	 * @param hmap Input HashMap
	 * @return Output TreeMap
	 */
	public static TreeMap<String, Integer> sortValue(HashMap<String, Integer> hmap) {
		Comparator<String> comp = new ValueComparator(hmap);
		TreeMap<String,Integer> tree = new TreeMap<>(comp);
		tree.putAll(hmap);
		return tree;
	}
	
	/**
	 * {@code ValueComparator implements Comparator<String>}
	 * Implement the new comparator
	 */
	private static class ValueComparator implements Comparator<String> {
		
		private HashMap<String, Integer> hmap = new HashMap<>();
		
		/** A normal constructor take HashMap */
		public ValueComparator(HashMap<String, Integer> hmap) {
			this.hmap.putAll(hmap);
		}
		
		/**
		 * {@code compare(String s1, String s2)} Just use get(key) to compare value
		 * @param s1 Key 1
		 * @param s2 Key 2
		 */
		@Override
		public int compare(String s1, String s2) {
			if(hmap.get(s1) >= hmap.get(s2)){
				return -1;
			}else{
				return 1;
			}
		}	
	}
}
