import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class lab8 {

	static final int sizeL = 10;
	
	public static void main(String args[]) {
		Scanner sc = new Scanner(System.in);
		String line = "";
		List<Integer> list = new ArrayList<Integer>();
		System.out.println("Input 10 integers, 'quit' to stop.");

		while (true) {
			if (list.size() >= sizeL) {
				System.out.println("\nFinished reading 10 integers: ");
				break;
			}
			line = sc.nextLine();
			if (line.equals("quit")) {
				break;
			}
			String[] keys = line.split("[\\s\\t]+");	//split spaces and tabs 
			for (int i = 0; i < keys.length; i++) {
				insertHeap(list, keys[i]);				//insert
			}
		}
		sc.close();
		System.out.println(list);
		System.out.println("\nRetrieving and deleting from heap: ");
		processHeap(list);								//print
	}

	public static void insertHeap(List<Integer> list, String key) {
		try {
			list.add(0, Integer.parseInt(key)); 	// insert at heap
			makeHeap(list, list.size(), 0); 		// one at a time
		} catch (NumberFormatException e) {			// catch invalid inputs
			System.out.println("Error, wrong number format.");
		}
	}

	public static void processHeap(List<Integer> list) {
		for (int i = sizeL - 1; i >=0; i--){
			int heap = list.get(0);			//retrieve
			System.out.println(heap);
			list.remove(0);					//delete
			makeHeap (list, i, 0);
		}
	}

	public static void makeHeap(List<Integer> list, int size, int index) {
		int max = index;
		int left = 2 * index + 1;
		int right = 2 * index + 2;

		if (left < size && list.get(left) > list.get(max)) {
			max = left;
		}
		if (right < size && list.get(right) > list.get(max)) {
			max = right;
		}
		if (max != index) {
			int temp = list.get(index);
			list.set(index, list.get(max));
			list.set(max, temp);
			makeHeap(list, size, max);
		}
	}
}