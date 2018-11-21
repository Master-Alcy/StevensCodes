package Chapter1;

import java.util.Arrays;

import edu.princeton.cs.algs4.BinarySearch;

public class TwoSum {
	public static int MergeSortAndBinarySearch (int[] a) {
		Arrays.sort(a);
		int N = a.length;
		int cnt = 0;
		for (int i = 0; i < N; i++) {
			// Find the one can sum to 0 with -a[i]
			if (BinarySearch.indexOf(a, -a[i]) > i){
				cnt ++;
			}
			// in 0 < j < i => still sum to 0 but duplicated 
			// failed return -1
		}
		return cnt;
	}
}
