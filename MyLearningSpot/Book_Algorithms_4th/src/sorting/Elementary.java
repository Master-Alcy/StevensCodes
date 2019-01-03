package sorting;

import static sorting.SortUtils.*;

@SuppressWarnings("rawtypes")
public class Elementary {
	
	public static void BubbleSort(Comparable[] a) { 
		// Sort a[] into increasing order.
		int length = a.length;

		for (int i = 0; i < length - 1; i++) {
			for (int j = 0; j < length - 1 - i; j++) {
				if (!less(a[j], a[j + 1])) {
					exch(a, j, j + 1);
				}
			}
		}
	}
	
	public static void SelectionSort(Comparable[] a) { 
		// Sort a[] into increasing order.
		int N = a.length; // array length
		
		for (int i = 0; i < N; i++) { // Exchange a[i] with smallest entry in a[i+1...N).
			int min = i; // index of minimal entry.
			for (int j = i + 1; j < N; j++)
				if (less(a[j], a[min]))
					min = j;
			exch(a, i, min);
		}
	}
	
	/** Almost linear time for partially sorted array */
	public static void InsertionSort(Comparable[] a) { // Sort a[] into increasing order.
		int N = a.length;
		
		for (int i = 1; i < N; i++) { // Insert a[i] among a[i-1], a[i-2], a[i-3]... ..
			for (int j = i; j > 0 && less(a[j], a[j - 1]); j--)
				exch(a, j, j - 1);
		}
	}
	
	// We can shortening its inner loop to move the larger entries
	// to the right one position rather than doing full exchanges
	public static void InsertionSortX(Comparable[] a) { // Sort a[] into increasing order.
		int n = a.length;
		int exchanges = 0;
		// put smallest element in position to serve as sentinel
		for (int i = n - 1; i > 0; i--) {
			if (less(a[i], a[i - 1])) {
				exch(a, i, i - 1);
				exchanges++;
			}
		}
		if (exchanges == 0)
			return;
		// insertion sort with half-exchanges
		for (int i = 2; i < n; i++) {
			Comparable v = a[i];
			int j = i;
			while (less(v, a[j - 1])) {
				a[j] = a[j - 1];
				j--;
			}
			a[j] = v;
		}
	}
	
	/**
	 * Experienced programmers sometimes choose ShellSort because it has acceptable
	 * running time even for moderately large arrays; it requires a small amount of
	 * code; and it uses no extra space.
	 */
	public static void ShellSort(Comparable[] a) { // Sort a[] into increasing order.
		int N = a.length;
		int h = 1;

		while (h < N / 3)	// After last loop h is at N/3 * 3 + 1 which is around N
			h = 3 * h + 1; // 1, 4, 13, 40, 121, 364, 1093, ...
		while (h >= 1) { // h-sort the array.
			for (int i = h; i < N; i++) {
				// Insert a[i] among a[i-h], a[i-2*h], a[i-3*h]... .
				for (int j = i; j >= h && less(a[j], a[j - h]); j -= h)
					exch(a, j, j - h);
			}
			h = h / 3;
		}
	}
}