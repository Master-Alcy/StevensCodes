package testThread;

import java.util.concurrent.RecursiveTask;
import java.util.concurrent.ForkJoinPool;

public class ParallelMergeSort {

	public static void main(String[] args) {
		final int SIZE = 7000000;
		int[] list1 = new int[SIZE];
		int[] list2 = new int[SIZE];
		final int N = 9000000;
		int[] list = new int[N];

		for (int i = 0; i < list1.length; i++) {
			list1[i] = list2[i] = (int) (Math.random() * 10000000);
		}
		for (int i = 0; i < list.length; i++) {
			list[i] = i;
		}

		long startTime = System.currentTimeMillis();
		list1 = parallelMergeSort(list1); // Invoke parallel merge sort
		long endTime = System.currentTimeMillis();
		System.out.println(list1);
		System.out.println("Parallel time with " + Runtime.getRuntime().availableProcessors() + " processors is "
				+ (endTime - startTime) + " milliseconds");

		startTime = System.currentTimeMillis();
		list2 = mergeSort(list2); // MergeSort is in Listing 23.5
		endTime = System.currentTimeMillis();
		System.out.println("\n" + list2);
		System.out.println("Sequential time is " + (endTime - startTime) + " milliseconds");

		startTime = System.currentTimeMillis();
		System.out.println("\nThe maximal number is " + max(list));
		endTime = System.currentTimeMillis();
		System.out.println("The number of processors is " + Runtime.getRuntime().availableProcessors() + " Time is "
				+ (endTime - startTime) + " milliseconds");
	}

	/** parallel find max entry */
	private static int max(int[] list) {
		RecursiveTask<Integer> task = new MaxTask(list, 0, list.length);
		ForkJoinPool pool = new ForkJoinPool();
		return pool.invoke(task);
	}

	/** ForkJoinTask find max */
	private static class MaxTask extends RecursiveTask<Integer> {
		private static final long serialVersionUID = 1L;
		private final static int THRESHOLD = 1000;
		private int[] list;
		private int low;
		private int high;

		private MaxTask(int[] list, int low, int high) {
			this.list = list;
			this.low = low;
			this.high = high;
		}

		@Override
		protected Integer compute() {
			if (high - low < THRESHOLD) {
				int max = list[0];
				for (int i = low; i < high; i++) {
					if (list[i] > max) {
						max = list[i];
					}
				}
				return new Integer(max);
			} else {
				int mid = (low + high) / 2;
				RecursiveTask<Integer> left = new MaxTask(list, low, mid);
				RecursiveTask<Integer> right = new MaxTask(list, mid, high);

				right.fork();
				left.fork();
				return new Integer(Math.max(left.join().intValue(), right.join().intValue()));
			}
		}
	}

	/** parallel merge sort entry */
	private static int[] parallelMergeSort(int[] list) {
		RecursiveTask<int[]> mainTask = new SortTask(list);
		ForkJoinPool pool = new ForkJoinPool();
		return pool.invoke(mainTask);
	}

	/** ForkJoinTask merge sort */
	private static class SortTask extends RecursiveTask<int[]> {
		private static final long serialVersionUID = 1L;
		private final int THRESHOLD = 500;
		private int[] list;

		private SortTask(int[] list) {
			this.list = list;
		}

		@Override
		protected int[] compute() {
			if (list.length < THRESHOLD)
				java.util.Arrays.sort(list);
			else {
				// Obtain the first half
				int firstHalfLength = list.length / 2;
				int[] firstHalf = new int[firstHalfLength];
				System.arraycopy(list, 0, firstHalf, 0, firstHalfLength);

				// Obtain the second half
				int secondHalfLength = list.length - firstHalfLength;
				int[] secondHalf = new int[secondHalfLength];
				System.arraycopy(list, firstHalfLength, secondHalf, 0, secondHalfLength);

				// Recursively sort the two halves
				invokeAll(new SortTask(firstHalf), new SortTask(secondHalf));

				// Merge firstHalf with secondHalf into list
				merge(firstHalf, secondHalf, list);
			}
			return list;
		}
	}

	/** The normal method for sorting the numbers */
	private static int[] mergeSort(int[] list) {
		if (list.length > 1) { // base case
			// Merge sort the first half
			int firstHalfLength = list.length / 2;
			int[] firstHalf = new int[firstHalfLength];
			System.arraycopy(list, 0, firstHalf, 0, firstHalfLength);
			mergeSort(firstHalf);

			// Merge sort the second half
			int secondHalfLength = list.length - firstHalfLength;
			int[] secondHalf = new int[secondHalfLength];
			System.arraycopy(list, firstHalfLength, secondHalf, 0, secondHalfLength);
			mergeSort(secondHalf);

			// Merge firstHalf with secondHalf into list
			merge(firstHalf, secondHalf, list);
		}
		return list;
	}

	/** Merge two sorted lists */
	private static void merge(int[] list1, int[] list2, int[] temp) {
		int current1 = 0; // Current index in list1
		int current2 = 0; // Current index in list2
		int current3 = 0; // Current index in temp

		while (current1 < list1.length && current2 < list2.length) {
			if (list1[current1] < list2[current2]) {
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