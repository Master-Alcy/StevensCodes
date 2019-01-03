package sorting;

import java.util.Comparator;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveTask;

import static sorting.SortUtils.*;

@SuppressWarnings("rawtypes")
public class Merge {

	// Base Method ----------------------------------------------------------------

	private static Comparable[] aux; // auxiliary array for merges

	public static void sort(Comparable[] a) {
		aux = new Comparable[a.length]; // Allocate space just once.
		sort(a, 0, a.length - 1);
	}

	private static void sort(Comparable[] a, int lo, int hi) { // Sort a[lo..hi].
		if (hi <= lo)
			return;
		int mid = lo + (hi - lo) / 2;
		sort(a, lo, mid); // Sort left half.
		sort(a, mid + 1, hi); // Sort right half.
		merge(a, lo, mid, hi); // Merge results (code on page 271).
	}

	private static void merge(Comparable[] a, int lo, int mid, int hi) {
		// Merge a[lo..mid] with a[mid+1..hi].
		int i = lo, j = mid + 1;
		for (int k = lo; k <= hi; k++) // Copy a[lo..hi] to aux[lo..hi].
			aux[k] = a[k];
		for (int k = lo; k <= hi; k++) // Merge back to a[lo..hi].
			if (i > mid)
				a[k] = aux[j++];
			else if (j > hi)
				a[k] = aux[i++];
			else if (less(aux[j], aux[i]))
				a[k] = aux[j++];
			else
				a[k] = aux[i++];
	}

	// Optimized Base Method
	// ---------------------------------------------------------

	private static final int CUTOFF = 7; // cutoff to insertion sort

	private static void merge(Comparable[] src, Comparable[] dst, int lo, int mid, int hi) {
		// precondition: src[lo .. mid] and src[mid+1 .. hi] are sorted subarrays
		assert isSorted(src, lo, mid);
		assert isSorted(src, mid + 1, hi);

		int i = lo, j = mid + 1;
		for (int k = lo; k <= hi; k++) {
			if (i > mid)
				dst[k] = src[j++];
			else if (j > hi)
				dst[k] = src[i++];
			else if (less(src[j], src[i]))
				dst[k] = src[j++]; // to ensure stability
			else
				dst[k] = src[i++];
		}

		// postcondition: dst[lo .. hi] is sorted subarray
		assert isSorted(dst, lo, hi);
	}

	private static void sort(Comparable[] src, Comparable[] dst, int lo, int hi) {
		// if (hi <= lo) return;
		if (hi <= lo + CUTOFF) {
			insertionSort(dst, lo, hi);
			return;
		}
		int mid = lo + (hi - lo) / 2;
		sort(dst, src, lo, mid);
		sort(dst, src, mid + 1, hi);

		// if (!less(src[mid+1], src[mid])) {
		// for (int i = lo; i <= hi; i++) dst[i] = src[i];
		// return;
		// }

		// using System.arraycopy() is a bit faster than the above loop
		if (!less(src[mid + 1], src[mid])) {
			System.arraycopy(src, lo, dst, lo, hi - lo + 1);
			return;
		}

		merge(src, dst, lo, mid, hi);
	}

	public static void sortX(Comparable[] a) {
		Comparable[] aux = a.clone();
		sort(aux, a, 0, a.length - 1);
		assert isSorted(a);
	}

	// sort from a[lo] to a[hi] using insertion sort
	private static void insertionSort(Comparable[] a, int lo, int hi) {
		for (int i = lo; i <= hi; i++)
			for (int j = i; j > lo && less(a[j], a[j - 1]); j--)
				exch(a, j, j - 1);
	}

	// Optimized Base Method 2
	// --------------------------------------------------------

	public static void sortX2(Object[] a, Comparator comparator) {
		Object[] aux = a.clone();
		sort(aux, a, 0, a.length - 1, comparator);
		assert isSorted(a, comparator);
	}

	private static void merge(Object[] src, Object[] dst, int lo, int mid, int hi, Comparator comparator) {
		// precondition: src[lo .. mid] and src[mid+1 .. hi] are sorted subarrays
		assert isSorted(src, lo, mid, comparator);
		assert isSorted(src, mid + 1, hi, comparator);

		int i = lo, j = mid + 1;
		for (int k = lo; k <= hi; k++) {
			if (i > mid)
				dst[k] = src[j++];
			else if (j > hi)
				dst[k] = src[i++];
			else if (less(src[j], src[i], comparator))
				dst[k] = src[j++];
			else
				dst[k] = src[i++];
		}

		// postcondition: dst[lo .. hi] is sorted subarray
		assert isSorted(dst, lo, hi, comparator);
	}

	private static void sort(Object[] src, Object[] dst, int lo, int hi, Comparator comparator) {
		// if (hi <= lo) return;
		if (hi <= lo + CUTOFF) {
			insertionSort(dst, lo, hi, comparator);
			return;
		}
		int mid = lo + (hi - lo) / 2;
		sort(dst, src, lo, mid, comparator);
		sort(dst, src, mid + 1, hi, comparator);

		// using System.arraycopy() is a bit faster than the above loop
		if (!less(src[mid + 1], src[mid], comparator)) {
			System.arraycopy(src, lo, dst, lo, hi - lo + 1);
			return;
		}

		merge(src, dst, lo, mid, hi, comparator);
	}

	private static void insertionSort(Object[] a, int lo, int hi, Comparator comparator) {
		for (int i = lo; i <= hi; i++)
			for (int j = i; j > lo && less(a[j], a[j - 1], comparator); j--)
				exch(a, j, j - 1);
	}

	// Merge Bottom-Up Method
	// ----------------------------------------------------------

	public static void sortBU(Comparable[] a) { // Do lg N passes of pairwise merges.
		int N = a.length;
		aux = new Comparable[N];

		for (int sz = 1; sz < N; sz = sz + sz) // sz: subarray size
			for (int lo = 0; lo < N - sz; lo += sz + sz) // lo: subarray index
				merge(a, lo, lo + sz - 1, Math.min(lo + sz + sz - 1, N - 1));
	}

	// Parallel Method ----------------------------------------------------------

	/**
	 * Parallel Merge Sort entry, around 2 times faster than Merge for large
	 * array(100k)
	 */
	public static Comparable[] parallelMergeSort(Comparable[] list) {
		RecursiveTask<Comparable[]> mainTask = new SortTask(list);
		ForkJoinPool pool = new ForkJoinPool();
		return pool.invoke(mainTask);
	}

	private static class SortTask extends RecursiveTask<Comparable[]> {
		private static final long serialVersionUID = 1L;
		private final int THRESHOLD = 500;
		private Comparable[] list;

		private SortTask(Comparable[] list) {
			this.list = list;
		}

		@Override
		protected Comparable[] compute() {
			if (list.length < THRESHOLD)
				java.util.Arrays.sort(list);
			else {
				// Obtain the first half
				int firstHalfLength = list.length / 2;
				Comparable[] firstHalf = new Comparable[firstHalfLength];
				System.arraycopy(list, 0, firstHalf, 0, firstHalfLength);

				// Obtain the second half
				int secondHalfLength = list.length - firstHalfLength;
				Comparable[] secondHalf = new Comparable[secondHalfLength];
				System.arraycopy(list, firstHalfLength, secondHalf, 0, secondHalfLength);

				// Recursively sort the two halves
				invokeAll(new SortTask(firstHalf), new SortTask(secondHalf));

				// Merge firstHalf with secondHalf into list
				merge(firstHalf, secondHalf, list);
			}
			return list;
		}
	}

	/** Merge two sorted lists */
	private static void merge(Comparable[] list1, Comparable[] list2, Comparable[] temp) {
		int current1 = 0; // Current index in list1
		int current2 = 0; // Current index in list2
		int current3 = 0; // Current index in temp

		while (current1 < list1.length && current2 < list2.length) {
			if (less(list1[current1], list2[current2])) {
				temp[current3++] = list1[current1++];
			} else {
				temp[current3++] = list2[current2++];
			}
		}
		while (current1 < list1.length) {
			temp[current3++] = list1[current1++];
		}
		while (current2 < list2.length) {
			temp[current3++] = list2[current2++];
		}
	}
}