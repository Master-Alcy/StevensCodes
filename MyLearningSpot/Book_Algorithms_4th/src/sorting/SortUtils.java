package sorting;

import java.util.Comparator;

import edu.princeton.cs.algs4.StdIn;
import edu.princeton.cs.algs4.StdOut;

/**
 * Certification; Running time; Extra memory; Types of data
 */

@SuppressWarnings({ "rawtypes", "unchecked" })
public class SortUtils {

	public static void sort(Comparable[] a) {
		/* See Algorithms 2.1, 2.2, 2.3, 2.4, 2.5, or 2.7. */
	}

	/***************************************************************************
	 * Helper functions to exchange
	 ***************************************************************************/

	protected static void exch(Comparable[] a, int i, int j) {
		Comparable t = a[i];
		a[i] = a[j];
		a[j] = t;
	}

	// exchange a[i] and a[j]
	protected static void exch(Object[] a, int i, int j) {
		Object swap = a[i];
		a[i] = a[j];
		a[j] = swap;
	}

	/***************************************************************************
	 * Helper functions to compare
	 ***************************************************************************/

	protected static boolean less(Comparable v, Comparable w) {
		return v.compareTo(w) < 0;
	}

	// is a[i] < a[j]?
	protected static boolean less(Object a, Object b, Comparator comparator) {
		return comparator.compare(a, b) < 0;
	}

	// does v == w ?
	protected static boolean eq(Comparable v, Comparable w) {
		if (v == w)
			return true; // optimization when reference equal
		return v.compareTo(w) == 0;
	}

	/***************************************************************************
	 * Helper functions to print
	 ***************************************************************************/

	protected static void show(Comparable[] a) { // Print the array, on a single line.
		for (int i = 0; i < a.length; i++)
			StdOut.print(a[i] + " ");
		StdOut.println();
	}

	/***************************************************************************
	 * Test if sorted
	 ***************************************************************************/

	protected static boolean isSorted(Comparable[] a) {
		return isSorted(a, 0, a.length - 1);
	}

	protected static boolean isSorted(Comparable[] a, int lo, int hi) {
		for (int i = lo + 1; i <= hi; i++)
			if (less(a[i], a[i - 1]))
				return false;
		return true;
	}

	protected static boolean isSorted(Object[] a, Comparator comparator) {
		return isSorted(a, 0, a.length - 1, comparator);
	}

	protected static boolean isSorted(Object[] a, int lo, int hi, Comparator comparator) {
		for (int i = lo + 1; i <= hi; i++)
			if (less(a[i], a[i - 1], comparator))
				return false;
		return true;
	}

	/***************************************************************************
	 * End
	 ***************************************************************************/

	public static void main(String[] args) {
		// Read strings from standard input, sort them, and print.
		String[] a = StdIn.readAllStrings();
		sort(a);
		if (isSorted(a)) {
			show(a);
		} else {
			System.out.println("Not Sorted.");
		}
	}

}
