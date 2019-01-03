package chapter1;

import edu.princeton.cs.algs4.StdOut;
import edu.princeton.cs.algs4.StdRandom;

/** A very good testing program */
public class DoublingRatio {

	public static void main(String[] args) {
		int base = 125; //Setting base Interval
		double prev = DoublingRatio.timeTrial(base);
		for (int N = base * 2; true; N += N) {
			double time = DoublingRatio.timeTrial(N);
			StdOut.printf("%6d %7.2f ", N, time);
			StdOut.printf("%5.2f\n", time / prev);
			prev = time;
		}
	}

	public static double timeTrial(int N) {
		int MAX = 1000000;
		int[] a = new int[N];
		for (int i = 0; i < N; i++) {
			a[i] = StdRandom.uniform(-MAX, MAX);
		}
		Stopwatch timer = new Stopwatch();
		
		// ------Testing program here---------
		TwoSum.MergeSortAndBinarySearch(a);
		
		return timer.elapsedTime();
	}
}
