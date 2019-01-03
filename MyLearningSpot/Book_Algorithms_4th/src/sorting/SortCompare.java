package sorting;

import java.util.Arrays;

import edu.princeton.cs.algs4.StdOut;
import edu.princeton.cs.algs4.StdRandom;
import edu.princeton.cs.algs4.Stopwatch;

public class SortCompare {

	public static double time(String alg, Double[] a) {
		Stopwatch timer = new Stopwatch();
		switch (alg) {
		case "JavaSort":	// Use this as Base and 10000000 * 5
			Arrays.sort(a);
			break;
		case "JavaParSort":	// Fastest for large arrays
			Arrays.parallelSort(a);
			break;
		case "Insertion":	// skip
			Elementary.InsertionSort(a);
			break;
		case "InsertionX":	// skip
			Elementary.InsertionSortX(a);
			break;
		case "Bubble":		// skip
			Elementary.BubbleSort(a);
			break;
		case "Selection":	// skip
			Elementary.SelectionSort(a);
			break;
		case "Shell":		// 0.261
			Elementary.ShellSort(a);
			break;
		case "MergeX":		// 0.915
			Merge.sortX(a);
			break;
		case "Merge":		// 0.772
			Merge.sort(a);
			break;
		case "MergeBU":		// 0.560
			Merge.sortBU(a);
			break;
		case "ParMerge":	// 1.402 --- 0.439 against JavaParSort
			Merge.parallelMergeSort(a);
			break;
		case "Quick":		// 1.084
			Quick.sort(a);
			break;
		case "Quick3W":		// 0.761
			Quick.sort3W(a);	// Good for same keys array
			break;				// Almost linear time complexity
		case "QuickX":		// 1.724 --- 0.471 against JavaParSort
			Quick.sortX(a);	// 1.543 faster than ParMerge
			break;
		case "Quick3WX":	// 1.505
			Quick.sort3WX(a);
			break;
		case "Heap":
			// Heap.sort(a);
			break;
		default:
			System.out.println(alg + " is not in switch.");
			break;
		}
		return timer.elapsedTime();
	}

	public static double timeRandomInput(String alg, int N, int T) {
		// Use alg to sort T random arrays of length N.
		double total = 0.0;
		Double[] a = new Double[N];
		for (int t = 0; t < T; t++) { // Perform one experiment (generate and sort an array).
			for (int i = 0; i < N; i++)
				a[i] = StdRandom.uniform();
			StdRandom.shuffle(a);
			total += time(alg, a);
		}
		return total;
	}

	public static void main(String[] args) {
		String alg1 = "QuickX";
		String alg2 = "ParMerge";
		int N = Integer.parseInt("10000000");
		int T = Integer.parseInt("5");
		double t1 = timeRandomInput(alg1, N, T); // total for alg1
		System.out.println("Method 1 finished in: " + t1);
		double t2 = timeRandomInput(alg2, N, T); // total for alg2
		System.out.println("Method 2 finished in: " + t2);
		StdOut.printf("For %d random Doubles in %d Arrays%n%s is", N, T, alg1);
		StdOut.printf(" %.3f times faster than %s\n", t2 / t1, alg2);
	}
}