import java.util.Arrays;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class lab4t2arr {
	
	public static void main(String[] args){
		List<Double> li = new AList<Double>();	
		System.out.println("Test fake double vector:  \n");
		
		li.push(1.0);li.push(2.4);li.push(3.0);li.push(4.0);li.push(5.0);		
		System.out.println("push(1.0), push(2.4), push(3.0), push(4.0), push(5.0): "
				+ "\nThe vector is: " + li.print() + "\n");
		
		li.set(2,99.0);
		System.out.println("set(2,99.0), then get(2): " + li.get(2) + "\n");
		
		System.out.println("length(): " + li.length() + "\n");
		
		System.out.println("pop(): " + li.pop() + "\nThe vector is: " + li.print());
		System.out.println("pop(): " + li.pop() + "\nThe vector is: " + li.print() + "\n");
		
		li.insert(1,111.0);
		System.out.println("insert(1,111.0). \nThe vector is: " + li.print());
		
		System.out.println("\nTest double Iterator: ");		
		Iterator<Double> it = li.iterator();
		
		while(it.hasNext()){
			System.out.print(it.next()+ " ");
		}
	}
	
	public interface List<T> extends Iterable<T>{		
		public T get(int n);
		public void set(int n, T a);
		public int length();
		public void push(T a);
		public T pop();
		public void insert(int n, T a);		
		public String print();
	}
	
	public static class AList<T> implements List<T>{		
		T[] arr;

		@Override
		public T get(int n) {
			if (arr == null) {
				System.out.println("This is null.");
				return null;
			} else {
				return arr[n];
			}
		}
		
		@Override
		public void set(int n, T a) {
			if (arr == null) {
				System.out.println("This is null.");
			} else {
				arr[n] = a;
			}
		}

		@Override
		public int length() {
			if (arr == null) {
				return 0;
			} else {
				return arr.length;
			}
		}
		
		@Override
		public void push(T a) {
			if (arr == null) {
				arr = (T[])new Object[1];
				arr[0] = a;
			} else {
				T[] temp = arr;
				arr = (T[])new Object[arr.length + 1];
				for (int i = 0; i < arr.length-1; i++){
					arr[i]=temp[i];
				}
				arr[arr.length-1] = a;
			}
		}

		@Override
		public T pop() {
			T last;
			if (arr == null){
				System.out.println("This is null.");
				return null;
			}else if (arr.length >= 2){
				last = arr[arr.length-1];
				T[] temp = arr;
				arr = (T[])new Object[arr.length-1];
				for (int i = 0; i < arr.length; i++){
					arr[i]=temp[i];
				}
				return last;
			}else{
				last = arr[0];
				System.out.println("Array becomes null.");
				arr = null;
				return last;
			}
		}
		
		@Override
		public void insert(int n, T a) {
			if (arr == null) {
				System.out.println("This is null. Use push.");	
			} else {
				T[] temp = arr;
				arr = (T[])new Object[arr.length + 1];
				for (int i = 0; i < arr.length; i++){
					if (i < n){
						arr[i] = temp[i];
					}else if (i == n){
						arr[i] = a;
					}else if (i > n){
						arr[i] = temp [i - 1];
					}
				}
			}
		}

		@Override
		public String print() {
			return Arrays.toString(arr);
		}

		@Override
		public Iterator<T> iterator() {	
			return new VectorIterator();
		}
		
		class VectorIterator implements Iterator<T>{
			int count = 0;

			@Override
			public boolean hasNext() {
				if (count < arr.length){
					return true;
				}
				return false;
			}

			@Override
			public T next() {
				if (!hasNext()){
					throw new NoSuchElementException();
				}
				return arr[count++];
			}
		}
	}
}