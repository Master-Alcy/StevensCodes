package chapter1;

public class FixedCapacityStackOfStrings {
	private String[] a;	//data
	private int N;	//current size
	
	// Create empty stack size cap
	FixedCapacityStackOfStrings(int cap){
		this.a = new String[cap];
		N = 0;		
	}
	
	public void push(String item) {
		a[N++] = item;	//N increment before operation
	}
	public String pop() {
		return a[--N];	//N decrement after operation
	}
	public boolean isEmpty() {
		return N == 0;
	}
	public int size() {
		return N;
	}
}