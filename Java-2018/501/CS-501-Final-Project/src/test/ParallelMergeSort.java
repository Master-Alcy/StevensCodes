package test;

import java.util.concurrent.RecursiveAction;
import java.util.concurrent.ForkJoinPool;

public class ParallelMergeSort {

	public static void main(String[] args) {
		final int SIZE = 7000000;
		int[] list1 = new int[SIZE];
		int[] list2 = new int[SIZE];
		
		for (int i = 0; i < list1.length; i++) {
			list1[i] = list2[i] = (int) (Math.random() * 10000000);
		}

		long startTime = System.currentTimeMillis();
		parallelMergeSort(list1); // Invoke parallel merge sort
		long endTime = System.currentTimeMillis();
		System.out.println("\nParallel time with " + Runtime.getRuntime().availableProcessors() + " processors is "
				+ (endTime - startTime) + " milliseconds");

		startTime = System.currentTimeMillis();
		mergeSort(list2); // MergeSort is in Listing 23.5
		endTime = System.currentTimeMillis();
		System.out.println("\nSequential time is " + (endTime - startTime) + " milliseconds");
	}

	public static void parallelMergeSort(int[] list) {
		RecursiveAction mainTask = new SortTask(list);
		ForkJoinPool pool = new ForkJoinPool();
		pool.invoke(mainTask);
	}

	private static class SortTask extends RecursiveAction {
		private final int THRESHOLD = 500;
		private int[] list;

		SortTask(int[] list) {
			this.list = list;
		}

		@Override
		protected void compute() {
			if (list.length < THRESHOLD)
				java.util.Arrays.sort(list);
			else {
				// Obtain the first half
				int[] firstHalf = new int[list.length / 2];
				System.arraycopy(list, 0, firstHalf, 0, list.length / 2);

				// Obtain the second half
				int secondHalfLength = list.length - list.length / 2;
				int[] secondHalf = new int[secondHalfLength];
				System.arraycopy(list, list.length / 2, secondHalf, 0, secondHalfLength);

				// Recursively sort the two halves
				invokeAll(new SortTask(firstHalf), new SortTask(secondHalf));

				// Merge firstHalf with secondHalf into list
				merge(firstHalf, secondHalf, list);
			}
		}
	}

	/** The method for sorting the numbers */
	public static void mergeSort(int[] list) {
		if (list.length > 1) { // base case
			// Merge sort the first half
			int[] firstHalf = new int[list.length / 2];
			System.arraycopy(list, 0, firstHalf, 0, list.length / 2);
			mergeSort(firstHalf);

			// Merge sort the second half
			int secondHalfLength = list.length - list.length / 2;
			int[] secondHalf = new int[secondHalfLength];
			System.arraycopy(list, list.length / 2, secondHalf, 0, secondHalfLength);
			mergeSort(secondHalf);

			// Merge firstHalf with secondHalf into list
			merge(firstHalf, secondHalf, list);
		}
	}

	/** Merge two sorted lists */
	public static void merge(int[] list1, int[] list2, int[] temp) {
		int current1 = 0; // Current index in list1
		int current2 = 0; // Current index in list2
		int current3 = 0; // Current index in temp

		while (current1 < list1.length && current2 < list2.length) {
			if (list1[current1] < list2[current2])
				temp[current3++] = list1[current1++];
			else
				temp[current3++] = list2[current2++];
		}

		while (current1 < list1.length)
			temp[current3++] = list1[current1++];

		while (current2 < list2.length)
			temp[current3++] = list2[current2++];
	}

}
