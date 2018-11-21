package Chapter1;

import java.util.Arrays;

import edu.princeton.cs.algs4.BinarySearch;

public class ThreeSum {
	public static int BruteForceCount(int[] a) {
		int N = a.length;
		int cnt = 0;
		for (int i = 0; i < N - 2; i++) {
			for (int j = i + 1; j < N - 1; j++) {
				for (int k = j + 1; k < N; k++) {
					if (a[i] + a[j] + a[k] == 0) {
						cnt++;
					}
				}
			}
		}
		return cnt;
	}

	public static int MergeSortAndBinarySearch(int[] a) {
		Arrays.sort(a);
		int N = a.length;
		int cnt = 0;
		for (int i = 0; i < N; i++) {
			for (int j = i + 1; j < N; j++) {
				if (BinarySearch.indexOf(a, -a[i] - a[j]) > j) {
					cnt++;
				}
			}
		}
		return cnt;
	}
}
