package chapter1;

public class Note_6 {

	/**Note that 
	 * Stack is LIFO, 
	 * Queue is FIFO
	 * Bag is LIFO
	 */
	public static void main(String[] args) {
		/**Side Node on Javadoc: Add
		 * -encoding UTF-8 -charset UTF-8
		 * at Extra Javadoc options
		 */
		/**
		 * After this section we got two data structures:
		 * Arrays and Linked Lists or 
		 * Sequential allocation and linked allocation
		 * Two extensions:
		 * Multiple links and compose data structures
		 * Binary Tree / Queue of arrays
		 * 
		 *	Array: 
		 *			Index provides immediate access
		 *		   	Need to know size on initialization
		 *	LinkedList: 
		 *			Use space proportional to size
		 *			Need reference to access an item
		 */
		int N = 50;
		// The java.util.Stack is not LIFO
		A2_LinkedListStack<Integer> stack = 
				new A2_LinkedListStack<Integer>();
		while (N > 0){
			stack.push(N % 2);
			N = N / 2;
		}
		for (int d : stack)
			System.out.print(d);
		System.out.println("\nEND");
	}

}
