package chapter1;

import java.util.Iterator;

/** Bag is LIFO */
public class A4_LinkedListBag<Item> implements Iterable<Item> {
	private Node head;
	
	private class Node{
		Item item;
		Node next;
	}
	
	public void add(Item item){
		// Same as push() in Stack
		Node oldHead = head;
		head = new Node();
		head.item = item;
		head.next = oldHead;
	}
	
	/** Compact List Iterator */
	@Override
	public Iterator<Item> iterator() {return new ListIterator();}
	private class ListIterator implements Iterator<Item> {
		private Node current = head;		
		public boolean hasNext() {return current != null;}	
		public void remove(){}	
		public Item next(){
			Item item = current.item;
			current = current.next;
			return item;
		}
	}
}
