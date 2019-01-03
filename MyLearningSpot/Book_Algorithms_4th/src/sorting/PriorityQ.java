package sorting;

import java.io.File;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.PriorityQueue;
import java.util.Scanner;

import edu.princeton.cs.algs4.In;
import edu.princeton.cs.algs4.IndexMinPQ;
import edu.princeton.cs.algs4.MinPQ;
import edu.princeton.cs.algs4.Stack;
import edu.princeton.cs.algs4.StdOut;
import edu.princeton.cs.algs4.Transaction;

import static sorting.SortUtils.*;

@SuppressWarnings({ "unchecked", "unused", "rawtypes" })
public class PriorityQ {

	public static void main(String[] args) {
		TestTopM("algs4-data\\tinyBatch.txt");
		TestMultiway();
	}

	// Heapsort
	public static void sort(Comparable[] a) {
		int N = a.length;
		for (int k = N / 2; k >= 1; k--)
			sink(a, k, N);
		while (N > 1) {
			exch(a, 1, N--);
			sink(a, 1, N);
		}
	}

	private static void sink(Comparable[] pq, int k, int n) {
		while (2 * k <= n) {
			int j = 2 * k;
			if (j < n && less(pq, j, j + 1))
				j++;
			if (!less(pq, k, j))
				break;
			exch(pq, k, j);
			k = j;
		}
	}

	private static boolean less(Comparable[] pq, int i, int j) {
		return pq[i - 1].compareTo(pq[j - 1]) < 0;
	}

	private static void TestMultiway() {
		String[] args = { "A", "F", "C", "Z", "B", "Q", "D", "I" };
		// String[] args2 = { "A", "F", "C", "Z", "B", "Q", "D", "I" };
		int N = args.length;
		In[] streams = new In[N];
		for (int i = 0; i < N; i++)
			streams[i] = new In(args[i]);
		merge(streams);
	}

	private static void merge(In[] streams) {
		int N = streams.length;
		IndexMinPQ<String> pq = new IndexMinPQ<String>(N);
		for (int i = 0; i < N; i++)
			if (!streams[i].isEmpty())
				pq.insert(i, streams[i].readString());
		while (!pq.isEmpty()) {
			// The min() need to be find online
			// StdOut.println(pq.min());
			int i = pq.delMin();
			if (!streams[i].isEmpty())
				pq.insert(i, streams[i].readString());
		}
	}

	private class MaxPQ<Key> implements Iterable<Key> {
		private Key[] pq; // store items at indices 1 to n
		private int n; // number of items on priority queue
		private Comparator<Key> comparator; // optional comparator

		public MaxPQ(int initCapacity) {
			pq = (Key[]) new Object[initCapacity + 1];
			n = 0;
		}

		public MaxPQ() {
			this(1);
		}

		public MaxPQ(int initCapacity, Comparator<Key> comparator) {
			this.comparator = comparator;
			pq = (Key[]) new Object[initCapacity + 1];
			n = 0;
		}

		public MaxPQ(Comparator<Key> comparator) {
			this(1, comparator);
		}

		public MaxPQ(Key[] keys) {
			n = keys.length;
			pq = (Key[]) new Object[keys.length + 1];
			for (int i = 0; i < n; i++)
				pq[i + 1] = keys[i];
			for (int k = n / 2; k >= 1; k--)
				sink(k);
			assert isMaxHeap();
		}

		public boolean isEmpty() {
			return n == 0;
		}

		public int size() {
			return n;
		}

		public Key max() {
			if (isEmpty())
				throw new NoSuchElementException("Priority queue underflow");
			return pq[1];
		}

		// helper function to double the size of the heap array
		private void resize(int capacity) {
			assert capacity > n;
			Key[] temp = (Key[]) new Object[capacity];
			for (int i = 1; i <= n; i++) {
				temp[i] = pq[i];
			}
			pq = temp;
		}

		public void insert(Key x) {
			// double size of array if necessary
			if (n == pq.length - 1)
				resize(2 * pq.length);
			// add x, and percolate it up to maintain heap invariant
			pq[++n] = x;
			swim(n);
			assert isMaxHeap();
		}

		public Key delMax() {
			if (isEmpty())
				throw new NoSuchElementException("Priority queue underflow");
			Key max = pq[1];
			exch(1, n--);
			sink(1);
			pq[n + 1] = null; // to avoid loiteing and help with garbage collection
			if ((n > 0) && (n == (pq.length - 1) / 4))
				resize(pq.length / 2);
			assert isMaxHeap();
			return max;
		}

		/***************************************************************************
		 * Helper functions to restore the heap invariant.
		 ***************************************************************************/

		private void swim(int k) {
			while (k > 1 && less(k / 2, k)) {
				exch(k, k / 2);
				k = k / 2;
			}
		}

		private void sink(int k) {
			while (2 * k <= n) {
				int j = 2 * k;
				if (j < n && less(j, j + 1))
					j++;
				if (!less(k, j))
					break;
				exch(k, j);
				k = j;
			}
		}

		/***************************************************************************
		 * Helper functions for compares and swaps.
		 ***************************************************************************/
		private boolean less(int i, int j) {
			if (comparator == null) {
				return ((Comparable<Key>) pq[i]).compareTo(pq[j]) < 0;
			} else {
				return comparator.compare(pq[i], pq[j]) < 0;
			}
		}

		private void exch(int i, int j) {
			Key swap = pq[i];
			pq[i] = pq[j];
			pq[j] = swap;
		}

		// is pq[1..N] a max heap?
		private boolean isMaxHeap() {
			return isMaxHeap(1);
		}

		// is subtree of pq[1..n] rooted at k a max heap?
		private boolean isMaxHeap(int k) {
			if (k > n)
				return true;
			int left = 2 * k;
			int right = 2 * k + 1;
			if (left <= n && less(k, left))
				return false;
			if (right <= n && less(k, right))
				return false;
			return isMaxHeap(left) && isMaxHeap(right);
		}

		/***************************************************************************
		 * Iterator.
		 ***************************************************************************/

		public Iterator<Key> iterator() {
			return new HeapIterator();
		}

		private class HeapIterator implements Iterator<Key> {

			// create a new pq
			private MaxPQ<Key> copy;

			// add all items to copy of heap
			// takes linear time since already in heap order so no keys move
			public HeapIterator() {
				if (comparator == null)
					copy = new MaxPQ<Key>(size());
				else
					copy = new MaxPQ<Key>(size(), comparator);
				for (int i = 1; i <= n; i++)
					copy.insert(pq[i]);
			}

			public boolean hasNext() {
				return !copy.isEmpty();
			}

			public void remove() {
				throw new UnsupportedOperationException();
			}

			public Key next() {
				if (!hasNext())
					throw new NoSuchElementException();
				return copy.delMax();
			}
		}
	}

	private static void TestTopM(String filePath) {
		try {
			// Print the top M lines in the input stream.
			int M = Integer.parseInt("10");
			MinPQ<Transaction> pq = new MinPQ<Transaction>(M + 1);
			Scanner sc = new Scanner(new File(filePath));

			while (sc.hasNextLine()) {
				pq.insert(new Transaction(sc.nextLine()));
				if (pq.size() > M)
					pq.delMin(); // Remove minimum if M+1 entries on the PQ.
			} // Top M entries are on the PQ.

			Stack<Transaction> stack = new Stack<Transaction>();
			while (!pq.isEmpty())
				stack.push(pq.delMin());

			for (Transaction t : stack)
				StdOut.println(t);

			sc.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("TopM test END.");
		}
	}

}
