package chapter1;

@SuppressWarnings("unchecked")
public class ResizableCapacityStack<Item> {
	private Item[] a; // data
	private int N; // current size

	// Create empty stack size cap
	ResizableCapacityStack(int cap) {
		this.a = (Item[]) new Object[cap];
		N = 0;
	}

	public void push(Item item) {
		if (N == a.length)
			resize(2 * a.length); // Double the array size
		a[N++] = item; // N increment before operation
	}

	public Item pop() {
		Item item = a[--N]; // N decrement after operation
		a[N] = null; // Avoid loitering. This a[N] is orphan now
		// Allow system to reclaim this
		// Note that java's garbage collection is to reclaim
		// the memory -> object which is no longer accessed.
		if (N > 0 && N == a.length / 4)
			resize(a.length / 2);
		return item;
	}

	public boolean isEmpty() {
		return N == 0;
	}

	public int size() {
		return N;
	}

	private void resize(int max) {
		// Move stack of size N <= max to a new array of size max.
		Item[] temp = (Item[]) new Object[max];
		for (int i = 0; i < N; i++)
			temp[i] = this.a[i];
		this.a = temp;
	}
}
