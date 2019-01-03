package chapter1;

import edu.princeton.cs.algs4.Bag;
import edu.princeton.cs.algs4.In;
import edu.princeton.cs.algs4.Queue;
import edu.princeton.cs.algs4.Stack;
import edu.princeton.cs.algs4.StdIn;
import edu.princeton.cs.algs4.StdOut;

public class Note_3 {

	public static void main(String[] args) {
		// Implement bag
		Bag<Double> numbers = new Bag<Double>();

		numbers.add(1.0);
		numbers.add(2.0);
		numbers.add(3.0);
		numbers.add(4.0);
		numbers.add(5.0);
		numbers.add(6.0);
		numbers.add(7.0);
		numbers.add(11.0);

		int N = numbers.size();
		double sum = 0.0;
		for (double x : numbers)
			sum += x;
		double mean = sum / N;
		sum = 0.0;
		for (double x : numbers)
			sum += (x - mean) * (x - mean);
		double std = Math.sqrt(sum / (N - 1));
		StdOut.printf("Mean: %.2f\n", mean);
		StdOut.printf("Std dev: %.2f\n", std);
		
		//Stack LIFO last-in-first-out
		Stack<Integer> stack;
		stack = new Stack<Integer>();
		while (!StdIn.isEmpty())
			stack.push(StdIn.readInt());
		for (int i : stack)
			StdOut.println(i);

	}

	// Queue FIFO fist-in-first-out
	public static int[] readInts(String name) {
		In in = new In(name);
		Queue<Integer> q = new Queue<Integer>();
		while (!in.isEmpty())
			q.enqueue(in.readInt());
		int N = q.size();
		int[] a = new int[N];
		for (int i = 0; i < N; i++)
			a[i] = q.dequeue();
		return a;
	}

}
