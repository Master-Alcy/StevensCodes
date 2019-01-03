package chapter1;

@SuppressWarnings("unused")
public class Note_5 {

	public static void main(String[] args) {
		// Building a data structure
		// A linked list is a recursive data structure that is
		// either empty (null) or a reference to a node having
		// a generic item and a reference to a linked list
		Note_5 t = new Note_5();
		Node first = t.new Node();
		Node second = t.new Node();
		Node third = t.new Node();
		// Static inner class
		// OuterClass.InnerClass obj = new OuterClass.InnerClass();
		Note_5.NodeS ts = new Note_5.NodeS();
		NodeS tss = new NodeS();
		// Building the list
		first.item = "to";
		second.item = "be";
		third.item = "or";
		first.next = second;
		second.next = third;
		//third.next is null
		// Operations: >>>>>>>>
		// to be or
		//1. Insert at head
		Node oldfirst = first;
		first = t.new Node();
		first.item = "not";
		first.next = oldfirst;
		// not to be or
		//2. remove
		first = first.next;
		// to be or
		//3. Insert at tail
		Node oldlast = third;
		Node thrid = t.new Node();
		thrid.item = "not";
		oldlast.next = thrid;
		// to be or not
		//4. Insert/remove at other position
		// Need to Traversal
		for (Node x = first; x!= null; x=x.next){
			System.out.println(x.item);
		}
	}
	
	Node first = new Node();
	Node second = new Node();
	Node third = new Node();
	
	private class Node{
		Object item;
		Node next;
	}
	
	private static class NodeS {
		Object item;
		NodeS next;
	}

}