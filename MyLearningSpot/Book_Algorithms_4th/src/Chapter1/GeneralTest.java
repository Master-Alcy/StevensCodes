package chapter1;

@SuppressWarnings("unused")
public class GeneralTest {

	public static void main(String[] args) {
		// Test1();	// FixedCapacityStackOfStrings	
		// Test2();	// ResizableCapacityStack
		// Test3();	// A2_LinkedListStack
		// Test4();	// A3_LinkedListQueue
		// Test5();	// A1_ResizingArrayStack

	}
	
	/** SortUtils A1_ResizingArrayStack */
	private static void Test5() {
		A1_ResizingArrayStack<String> stringStack = new A1_ResizingArrayStack<>();
		String str = "";
		int temp = 0;
		for (int i = 0; i < 100; i++) {
			stringStack.push(str += String.valueOf(temp++));
		}
		System.out.println("stack full, start pop. Current size: "
				+ stringStack.size());
		while (!stringStack.isEmpty()) {
			System.out.println(stringStack.pop());
		}

	}
	
	/** SortUtils Linked List Queue */
	private static void Test4() {
		A3_LinkedListQueue<String> q = new A3_LinkedListQueue<>();
		q.enqueue("a");
		q.enqueue("b");
		q.enqueue("c");
		q.enqueue("d");
		System.out.println("Iterator would Not delete data");
		System.out.println("Using Iterator's Iterable instance.");
		for (String s : q){
			System.out.println(s);
		}
		
		System.out.println("Using Queue. Delete data");
		while(!q.isEmpty()){
			System.out.println(q.dequeue());
		}
		//q.dequeue();
	}

	/** SortUtils Linked List Stack */
	private static void Test3() {
		A2_LinkedListStack<String> s = new A2_LinkedListStack<>();
		s.push("1");
		s.push("a");
		s.push("2");
		s.push("b");
		s.push("3");
		s.push("c");
		while (!s.isEmpty()) {
			System.out.println(s.pop());
		}
	}

	/** SortUtils ResizableCapacityStack */
	private static void Test2() {
		ResizableCapacityStack<String> stringStack = new ResizableCapacityStack<>(
				100);
		String str = "";
		int temp = 0;

		for (int i = 0; i < 100; i++) {
			stringStack.push(str += String.valueOf(temp++));
		}
		System.out.println("stack full, start pop. Current size: "
				+ stringStack.size());
		while (!stringStack.isEmpty()) {
			System.out.println(stringStack.pop());
		}
	}

	/** SortUtils FixedCapacityStackOfStrings */
	private static void Test1() {
		FixedCapacityStackOfStrings stringStack = new FixedCapacityStackOfStrings(
				100);
		String str = "";
		int temp = 0;
		for (int i = 0; i < 100; i++) {
			stringStack.push(str += String.valueOf(temp++));
		}
		System.out.println("stack full, start pop. Current size: "
				+ stringStack.size());
		while (!stringStack.isEmpty()) {
			System.out.println(stringStack.pop());
		}
	}
}