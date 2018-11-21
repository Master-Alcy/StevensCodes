package Chapter1;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Note_7 {

	public static void main(String[] args) {
		/** A early study for multi-threading */
		// Try testing the three sum funciton
		Note_7 n = new Note_7();
		MultiThreading R1 = n.new MultiThreading("T1");
		R1.start();
		MultiThreading R2 = n.new MultiThreading("T2");
		R2.start();
		MultiThreading R3 = n.new MultiThreading("T3");
		R3.start();
		MultiThreading R4 = n.new MultiThreading("T4");
		R4.start();
		// Too many threads would slow everything down
		// 4 cores 4 threads
		MultiThreading R5 = n.new MultiThreading("T5");
		R5.start();
		MultiThreading R6 = n.new MultiThreading("T6");
		R6.start();
		MultiThreading R7 = n.new MultiThreading("T7");
		R7.start();
		MultiThreading R8 = n.new MultiThreading("T8");
		R8.start();
		/** Testing passing functions as parameter */
//		Thread R5 = new Thread(() -> Test(10));
//		R5.start();
//		new Thread(() -> TestTwoSum("algs4-data\\2Kints.txt",2000)).start();
//		new Thread(() -> TestTwoSum("algs4-data\\4Kints.txt",4000)).start();
//		new Thread(() -> TestTwoSum("algs4-data\\8Kints.txt",8000)).start();
		//new Thread(() -> TestTwoSum("algs4-data\\1Mints.txt",1000000)).start();
		
	}
	
	@SuppressWarnings("unused")
	private static void Test(int a){
		System.out.println(a);
	}

	/** implements Runnable is said to be better than extend thread */
	private class MultiThreading implements Runnable {
		private Thread t;
		private String threadName;

		MultiThreading(String name) {
			threadName = name;
			System.out.println("Creating " + threadName);
		}

		@Override
		public void run() {
			System.out.println("Running " + threadName);
			// My Tasks are distributed here
			try {
				switch (threadName) {
				case "T1":
					Note_7.TestThreeSum("algs4-data\\1Kints.txt", 1000);
				case "T2":
					Note_7.TestThreeSum("algs4-data\\2Kints.txt", 2000);
				case "T3":
					Note_7.TestThreeSum("algs4-data\\4Kints.txt", 4000);
				case "T4":
					Note_7.TestThreeSum("algs4-data\\8Kints.txt", 8000);
				case "T5":
					Note_7.TestTwoSum("algs4-data\\1Kints.txt", 1000);
				case "T6":
					Note_7.TestTwoSum("algs4-data\\2Kints.txt", 2000);
				case "T7":
					Note_7.TestTwoSum("algs4-data\\4Kints.txt", 4000);
				case "T8":
					Note_7.TestTwoSum("algs4-data\\8Kints.txt", 8000);
				default:
					System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
							+ "UnRegistered Thread Passing By."
							+ "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("Thread " + threadName + " exiting.");
		}

		public void start() {
			System.out.println("Starting " + threadName);
			if (t == null) {
				t = new Thread(this, threadName);
				t.start();
			}
		}
	}

	/** Testing twoSum fast with mergesort and binary search */
	public static void TestTwoSum(String filePath, int size) {
		try {
			Scanner sc = new Scanner(new File(filePath));
			int[] arr = new int[size];
			int index = 0;

			Stopwatch timer1 = new Stopwatch();
			while (sc.hasNext()) {
				arr[index++] = sc.nextInt();
			}
			double readTime = timer1.elapsedTime();
			sc.close();
			Stopwatch timer2 = new Stopwatch();
			int count = TwoSum.MergeSortAndBinarySearch(arr);
			double methodTime = timer2.elapsedTime();

			System.out.println("---------------------------------"
					+ "\nTwoSum\nOn size: " + size
					+ "\nThe time it takes to read the file is: " + readTime
					+ "secs\nTest if array is full: " + arr[size - 1]
					+ "\nThe time it takes to compute is: " + methodTime
					+ "secs.\nThe count is: " + count);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	/** Try counting the actual time it takes to finish the method */
	public static void TestThreeSum(String filePath, int size)
			throws FileNotFoundException {
		Scanner sc = new Scanner(new File(filePath));
		int[] arr = new int[size];
		int index = 0;

		Stopwatch timer1 = new Stopwatch();
		while (sc.hasNext()) {
			arr[index++] = sc.nextInt();
		}
		double readTime = timer1.elapsedTime();
		sc.close();
		Stopwatch timer2 = new Stopwatch();
		int count = ThreeSum.BruteForceCount(arr);
		double methodTime = timer2.elapsedTime();

		System.out.println("---------------------------------"
				+ "\nThreeSum\nOn size: " + size
				+ "\nThe time it takes to read the file is: " + readTime
				+ "secs\nTest if array is full: " + arr[size - 1]
				+ "\nThe time it takes to compute is: " + methodTime
				+ "secs.\nThe count is: " + count);
	}
}