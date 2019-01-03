package sorting;

import edu.princeton.cs.algs4.Insertion;
import edu.princeton.cs.algs4.StdRandom;

import static sorting.SortUtils.*;

/**
 * Quick Sort is the Merge Sort that when subarrays sorted, the whole array is
 * sorted. Quick sort is faster than Merge Sort because with 39% more compares,
 * it also does much less data movement.
 */
@SuppressWarnings({ "rawtypes", "unchecked" })
public class Quick {

	public static void sort(Comparable[] a) {
		StdRandom.shuffle(a); // Eliminate dependence on input.
		sort(a, 0, a.length - 1);
	}

	private static void sort(Comparable[] a, int lo, int hi) {
		if (hi <= lo)
			return;
		int j = partition(a, lo, hi); // Partition (see page 291).
		sort(a, lo, j - 1); // Sort left part a[lo .. j-1].
		sort(a, j + 1, hi); // Sort right part a[j+1 .. hi].
	}

	/**
	 * The entry a[j] is in its final place in the array, for some j. No entry in
	 * a[lo] through a[j-1] is greater than a[j]. No entry in a[j+1] through a[hi]
	 * is less than a[j].
	 */
	private static int partition(Comparable[] a, int lo, int hi) { // Partition into a[lo..i-1], a[i], a[i+1..hi].
		// This is in place, note avoid creating new arrays though
		// that reduce the difficulty
		int i = lo, j = hi + 1; // left and right scan indices
		Comparable v = a[lo]; // partitioning item
		while (true) { // Scan right, scan left, check for scan complete, and exchange.
			while (less(a[++i], v))
				if (i == hi)
					break;
			while (less(v, a[--j]))
				if (j == lo)
					break;
			if (i >= j)
				break;
			exch(a, i, j);
		}
		exch(a, lo, j); // Put v = a[j] into position
		return j; // with a[lo..j-1] <= a[j] <= a[j+1..hi].
	}

	// 3-way, better for arrays with large number of duplicate keys
	// -----------------------------------------------

	public static void sort3W(Comparable[] a) {
		StdRandom.shuffle(a);
		sort3W(a, 0, a.length - 1);
		assert isSorted(a);
	}

	// quicksort the subarray a[lo .. hi] using 3-way partitioning
	private static void sort3W(Comparable[] a, int lo, int hi) {
		if (hi <= lo)
			return;
		int lt = lo, gt = hi;
		Comparable v = a[lo];
		int i = lo + 1;
		while (i <= gt) {
			int cmp = a[i].compareTo(v);
			if (cmp < 0)
				exch(a, lt++, i++);
			else if (cmp > 0)
				exch(a, i, gt--);
			else
				i++;
		}

		// a[lo..lt-1] < v = a[lt..gt] < a[gt+1..hi].
		sort3W(a, lo, lt - 1);
		sort3W(a, gt + 1, hi);
		assert isSorted(a, lo, hi);
	}

	// 2-way optimal ----------------------------

	// cutoff to insertion sort, must be >= 1
	private static final int INSERTION_SORT_CUTOFF = 8;

	public static void sortX(Comparable[] a) {
		// StdRandom.shuffle(a);
		sortX(a, 0, a.length - 1);
		assert isSorted(a);
	}

	// quicksort the subarray from a[lo] to a[hi]
	private static void sortX(Comparable[] a, int lo, int hi) {
		if (hi <= lo)
			return;

		// cutoff to insertion sort (Insertion.sort() uses half-open intervals)
		int n = hi - lo + 1;
		if (n <= INSERTION_SORT_CUTOFF) {
			Insertion.sort(a, lo, hi + 1);
			return;
		}

		int j = partitionX(a, lo, hi);
		sortX(a, lo, j - 1);
		sortX(a, j + 1, hi);
	}

	// partition the subarray a[lo..hi] so that a[lo..j-1] <= a[j] <= a[j+1..hi]
	// and return the index j.
	private static int partitionX(Comparable[] a, int lo, int hi) {
		int n = hi - lo + 1;
		int m = median3(a, lo, lo + n / 2, hi);
		exch(a, m, lo);

		int i = lo;
		int j = hi + 1;
		Comparable v = a[lo];

		// a[lo] is unique largest element
		while (less(a[++i], v)) {
			if (i == hi) {
				exch(a, lo, hi);
				return hi;
			}
		}
		// a[lo] is unique smallest element
		while (less(v, a[--j])) {
			if (j == lo + 1)
				return lo;
		}
		// the main loop
		while (i < j) {
			exch(a, i, j);
			while (less(a[++i], v))
				;
			while (less(v, a[--j]))
				;
		}
		// put partitioning item v at a[j]
		exch(a, lo, j);
		// now, a[lo .. j-1] <= a[j] <= a[j+1 .. hi]
		return j;
	}

	// return the index of the median element among a[i], a[j], and a[k]
	private static int median3(Comparable[] a, int i, int j, int k) {
		return ( 
				less(a[i], a[j]) ? ( 
						less(a[j], a[k]) ? j : 
							less(a[i], a[k]) ? k : i 
									) : ( 
											less(a[k], a[j]) ? j : 
												less(a[k], a[i]) ? k : i 
														)
						);
	}

	// Optimal 3-way -----------------------------

	// cutoff to insertion sort, must be >= 1
	private static final int INSERTION_SORT_CUTOFF2 = 8;
	// cutoff to median-of-3 partitioning
	private static final int MEDIAN_OF_3_CUTOFF = 40;

	public static void sort3WX(Comparable[] a) {
		sort3WX(a, 0, a.length - 1);
	}

	private static void sort3WX(Comparable[] a, int lo, int hi) {
		int n = hi - lo + 1;

		// cutoff to insertion sort
		if (n <= INSERTION_SORT_CUTOFF2) {
			insertionSort(a, lo, hi);
			return;
		}

		// use median-of-3 as partitioning element
		else if (n <= MEDIAN_OF_3_CUTOFF) {
			int m = median3(a, lo, lo + n / 2, hi);
			exch(a, m, lo);
		}

		// use Tukey ninther as partitioning element
		else {
			int eps = n / 8;
			int mid = lo + n / 2;
			int m1 = median3(a, lo, lo + eps, lo + eps + eps);
			int m2 = median3(a, mid - eps, mid, mid + eps);
			int m3 = median3(a, hi - eps - eps, hi - eps, hi);
			int ninther = median3(a, m1, m2, m3);
			exch(a, ninther, lo);
		}

		// Bentley-McIlroy 3-way partitioning
		int i = lo, j = hi + 1;
		int p = lo, q = hi + 1;
		Comparable v = a[lo];
		while (true) {
			while (less(a[++i], v))
				if (i == hi)
					break;
			while (less(v, a[--j]))
				if (j == lo)
					break;

			// pointers cross
			if (i == j && eq(a[i], v))
				exch(a, ++p, i);
			if (i >= j)
				break;

			exch(a, i, j);
			if (eq(a[i], v))
				exch(a, ++p, i);
			if (eq(a[j], v))
				exch(a, --q, j);
		}

		i = j + 1;
		for (int k = lo; k <= p; k++)
			exch(a, k, j--);
		for (int k = hi; k >= q; k--)
			exch(a, k, i++);

		sort3WX(a, lo, j);
		sort3WX(a, i, hi);
	}

	// sort from a[lo] to a[hi] using insertion sort
	private static void insertionSort(Comparable[] a, int lo, int hi) {
		for (int i = lo; i <= hi; i++)
			for (int j = i; j > lo && less(a[j], a[j - 1]); j--)
				exch(a, j, j - 1);
	}
}
