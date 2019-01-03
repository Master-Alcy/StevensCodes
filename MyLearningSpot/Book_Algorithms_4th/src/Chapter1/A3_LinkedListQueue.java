package chapter1;

import java.util.Iterator;

/** Queue is FIFO */
public class A3_LinkedListQueue<Item> implements Iterable<Item>{
	private Node head;
	private Node tail;
	private int N;
	
	private class Node{
		Item item;
		Node next;
	}
	
	public boolean isEmpty() {return head == null;}
	public int size() {return N;}
	
	public void enqueue(Item item) {
		Node oldTail = tail;
		tail = new Node();
		tail.item = item;
		tail.next = null;
		if (isEmpty()){ head = tail; }
		else { oldTail.next = tail; }
		N++;
	}
	
	public Item dequeue(){
		Item item = head.item;
		head = head.next;
		if (isEmpty()){ tail = null;}
		N--;
		return item;
	}
	
	// This iterator can hide implementation of the stack
	@Override
	public Iterator<Item> iterator() {
		return new ListIterator();
	}
	
	private class ListIterator implements Iterator<Item> {
		private Node current = head;
		
		public boolean hasNext() { return current != null; }
		public Item next() {
			Item item = current.item;
			current = current.next;
			return item;
		}
	}
}
