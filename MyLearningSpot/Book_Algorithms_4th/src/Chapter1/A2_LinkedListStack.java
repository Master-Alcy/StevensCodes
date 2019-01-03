package chapter1;

import java.util.Iterator;

/** Stack is LIFO */
public class A2_LinkedListStack<Item> implements Iterable<Item> {
	private Node head;
	private int N;
	
	private class Node{
		Item item;
		Node next;
	}
	
	public boolean isEmpty() { return head == null; }
	public int size() { return N; }
	
	public void push (Item item) {
		Node oldHead = head;
		head = new Node();
		head.item = item;
		head.next = oldHead;
		N++;
	}
	
	public Item pop(){
		Item item = head.item;
		head = head.next;
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
