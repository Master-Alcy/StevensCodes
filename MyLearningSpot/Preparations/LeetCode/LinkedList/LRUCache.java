package linkedlist;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@SuppressWarnings("unused")
public class LRUCache {

	/**
	 * Your LRUCache object will be instantiated and called as such: LRUCache obj =
	 * new LRUCache(capacity); int param_1 = obj.get(key); obj.put(key,value);
	 * 
	 * LinkedHashMap is implemented with DoublyLinkedList
	 */
	public static void main(String[] args) {
		LRUCache cache = new LRUCache();
		LRUCache_DoublyLinkedList complexCache = cache.new LRUCache_DoublyLinkedList(2);
		complexCache.put(1, 1);
		complexCache.put(2, 2);
		int num1 = complexCache.get(1);       // returns 1
		System.out.println(num1);
		complexCache.put(3, 3);    // evicts key 2
		num1 = complexCache.get(2);       // returns -1 (not found)
		System.out.println(num1);
		complexCache.put(4, 4);    // evicts key 1
		num1 = complexCache.get(1);       // returns -1 (not found)
		System.out.println(num1);
		num1 = complexCache.get(3);       // returns 3
		System.out.println(num1);
		num1 = complexCache.get(4);       // returns 4
		System.out.println(num1);
	}

	/**	
	 * DoublyLinkedList can delete a node and keep the 
	 * rest of the list consistent, in other words, a 
	 * node can delete itself without other reference. 
	 * Need to be aware of the possibility of resource leak.
	 * The space complexity of an algorithm or data structure is the maximum amount of 
	 * space used at any one time, ignoring the space used by the input to the algorithm.
	 * For this one it need to hold n items in HashMap, thus space complexity is O(n).
	 */
	private class LRUCache_DoublyLinkedList {
		private final int CAPACITY; 
		private int size;
		private Node head, tail;
		private HashMap<Integer, Node> map;
		
		/**
		 * null <- head -> tail
		 * head <- tail -> null
		 */
		public LRUCache_DoublyLinkedList(int capacity) {
			this.CAPACITY = capacity;
			size = 0;
			map = new HashMap<>();
			head = new Node(0, 0);
			tail = new Node(0, 0);
			head.prev = null;
			head.next = tail;
			tail.prev = head;
			tail.next = null;
		}
		
		/** Short-Cut this Node from list
		 * 		  _____________________
		 * 		  |	     | Node |	   |
		 * Node<--| prev | data | next |-->Node
		 * 		  |______|______|______|
		 */
		private void removeOldNode(Node node) {
			node.prev.next = node.next;
			node.next.prev = node.prev;
			// prevent resource leak
			node.prev = null;
			node.next = null;
		}
		
		/**
		 * 0. null <- head -> <- aNode
		 * 1.         head <- node -> aNode
		 *    null <- head ->      <- aNode
		 * 2. null <- head -> <- node -> <- aNode
		 */
		private void updateNodeToHead(Node node) {
			node.prev = head;
			node.next = head.next;
			node.next.prev = node;
			head.next = node;
		}
		
		public int get(int key) {
			if (map.get(key) != null) {
				Node aNode = map.get(key);
				int value = aNode.value;
				// This is a recently used key!
				removeOldNode(aNode);
				updateNodeToHead(aNode);
				return value;
			}

			return -1;
		}

		public void put(int key, int value) {
			if (map.get(key) != null) {
				Node aNode = map.get(key);
				aNode.value = value;
				removeOldNode(aNode);
				updateNodeToHead(aNode);
			} else { // Not Found
				// HashMap is to keep the existence of keys
				Node aNode = new Node(key, value);
				map.put(key, aNode);
				if (size < CAPACITY) {
					size++;
					updateNodeToHead(aNode);
				} else { // Remove Least Recently Used Node
					map.remove(tail.prev.key);
					removeOldNode(tail.prev);
					updateNodeToHead(aNode);
				}
			}
		}

		private class Node {
			int key;
			int value;
			Node prev;
			Node next;
			
			/** Initially prev = next = null
			 * 		  _____________________
			 * 		  |	     | Node |	   |
			 * NULL<--| prev | data | next |-->NULL
			 * 		  |______|______|______|
			 */
			Node(int key, int value) {
				this.key = key;
				this.value = value;
			}
		}
	}
	
	/**
	 * Java already have a LinkedHashMap, only around 10 ms slower.
	 */
	private class LRUCache_LinkedHashMap {
		private final int CAPACITY;
		private LinkedHashMap<Integer, Integer> map;

		@SuppressWarnings("serial")
		public LRUCache_LinkedHashMap(int capacity) {
			this.CAPACITY = capacity;
			/**	Parameters:
			 * initialCapacity: the initial capacity
			 * loadFactor: the load factor
			 * accessOrder: the ordering mode - true for access-order, false for insertion-order
			 */
			map = new LinkedHashMap<Integer, Integer>(capacity, 0.75f, true) {
				protected boolean removeEldestEntry(Map.Entry<Integer, Integer> eldest) {
					return size() > CAPACITY;
				}
			};
		}

		public int get(int key) {
			return map.getOrDefault(key, -1);
		}

		public void put(int key, int value) {
			map.put(key, value);
		}
	}
}